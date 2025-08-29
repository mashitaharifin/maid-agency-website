import type { Actions, PageServerLoad } from './$types';
import { fail, redirect } from '@sveltejs/kit';
import { db } from '$lib/server/db';
import { user } from '$lib/server/db/schema';
import { eq } from 'drizzle-orm';
import { verifyPassword, createSession, setSessionTokenCookie, sessionCookieName} from '$lib/server/auth';
import crypto from "crypto";

export const load: PageServerLoad = async ({ locals }) => {
  if (locals.user) throw redirect(302, '/admin');   // already logged in → send to dashboard
  return {};
};

export const actions: Actions = {
  default: async ({ request, cookies }) => {
    const formData = await request.formData();
    const username = formData.get('username')?.toString();
    const password = formData.get('password')?.toString();

    console.log("Login attempt →", { username: username ?? null });

    if (!username || !password) {
      return fail(400, { error: 'Username and password are required' });
    }

    // Find user by username
    const [dbUser] = await db.select().from(user).where(eq(user.username, username));
    console.log("DB user →", dbUser); // Debug 2

    if (!dbUser || !dbUser.isActive) {
      return fail(400, { error: 'Invalid username or password' });
    }

    console.log("Stored hash →", dbUser.passwordHash); // Debug 3
    // Check password hash
    const valid = await verifyPassword(password, dbUser.passwordHash);
    console.log("Password valid? →", valid); // Debug 4

    if (!valid) {
      return fail(400, { error: 'Invalid username or password' });
    }

    // Generate raw token
    const rawToken = crypto.randomBytes(32).toString("hex");
    const session = await createSession(rawToken, dbUser.id);

    // Prefer using helper setSessionTokenCookie if you exported it in auth
    if (typeof setSessionTokenCookie === 'function') {
      setSessionTokenCookie(cookies, rawToken, session.expiresAt);
      console.log('Cookie set via setSessionTokenCookie helper');
    } else {

      // Fallback: set cookie directly (works for local dev)
      const isProd = process.env.NODE_ENV === 'production';
      cookies.set(sessionCookieName, rawToken, {
        path: '/',
        httpOnly: true,
        sameSite: 'lax',                      // allow POST -> redirect flows
        secure: isProd,                       // false on localhost
        expires: session?.expiresAt ? new Date(session.expiresAt) : undefined
      });
      console.log('Cookie set via fallback. isProd=', isProd);
    }

    // Redirect to dashboard/home
    throw redirect(302, '/admin');
  }
};
