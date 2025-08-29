import type { RequestHandler } from './$types';
import { redirect } from '@sveltejs/kit';
import * as auth from '$lib/server/auth';

export const POST: RequestHandler = async ({ cookies }) => {
  const sessionToken = cookies.get(auth.sessionCookieName);

  if (sessionToken) {
    const { session } = await auth.validateSessionToken(sessionToken);
    if (session) {
      await auth.invalidateSession(session.sessionId); // delete from DB
    }
    auth.deleteSessionTokenCookie(cookies); // clear browser cookie
  }

  throw redirect(302, '/admin/login');
};
