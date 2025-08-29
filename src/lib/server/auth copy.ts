import type { Cookies } from '@sveltejs/kit';
import { eq } from 'drizzle-orm';
import { sha256 } from '@oslojs/crypto/sha2';
import { encodeBase64url, encodeHexLowerCase } from '@oslojs/encoding';
import { db } from '$lib/server/db';
import * as table from '$lib/server/db/schema';
import bcrypt from 'bcrypt'; 

const DAY_IN_MS = 1000 * 60 * 60 * 24;

export const sessionCookieName = 'auth-session';

export function generateSessionToken() {
	const bytes = crypto.getRandomValues(new Uint8Array(18));
	const token = encodeBase64url(bytes);
	return token;
}

export async function createSession(token: string, userId: number) {
	const sessionId = encodeHexLowerCase(sha256(new TextEncoder().encode(token)));
	const newSession: Omit<table.Session, 'id'> = {
		sessionId,
		userId,
		expiresAt: new Date(Date.now() + DAY_IN_MS * 30),
	};

	const [insertedSession] = await db
    .insert(table.session)
    .values(newSession)
    .returning();

  	return insertedSession;
}

export async function validateSessionToken(token: string) {
	const sessionId = encodeHexLowerCase(sha256(new TextEncoder().encode(token)));
	const [result] = await db
		.select({
			user: { 
				id: table.user.id, 
				username: table.user.username,  
			},
			session: table.session
		})
		.from(table.session)
		.innerJoin(table.user, eq(table.session.userId, table.user.id))
		.where(eq(table.session.sessionId, sessionId));

		console.log("🔍 DB result:", result);
		
	if (!result) {
		console.log("❌ No session found for:", sessionId);
		return { session: null, user: null };
	}
	const { session, user } = result;
	console.log("✅ Found session:", session, "user:", user);

	const sessionExpired = Date.now() >= session.expiresAt.getTime();
	if (sessionExpired) {
		await db.delete(table.session).where(eq(table.session.sessionId, session.sessionId));
		return { session: null, user: null };
	}

	const renewSession = Date.now() >= session.expiresAt.getTime() - DAY_IN_MS * 15;
	if (renewSession) {
		const newExpiry = new Date(Date.now() + DAY_IN_MS * 30);
    	await db
      		.update(table.session)
      		.set({ expiresAt: newExpiry })
      		.where(eq(table.session.sessionId, session.sessionId));
    	session.expiresAt = newExpiry;
    	console.log("🔄 Session renewed:", sessionId);
	}

	return { session, user };
}

export type SessionValidationResult = Awaited<ReturnType<typeof validateSessionToken>>;

export async function invalidateSession(sessionId: string) {
	await db.delete(table.session).where(eq(table.session.sessionId, sessionId));
}

export function setSessionTokenCookie(cookies: Cookies, token: string, expiresAt: Date) {
	const isProd = process.env.NODE_ENV === "production";
	cookies.set(sessionCookieName, token, {
		expires: expiresAt,
		path: '/',
		httpOnly: true,
		sameSite: "lax", 
		secure: isProd
	});
}

export function deleteSessionTokenCookie(cookies: Cookies) {
	cookies.delete(sessionCookieName, {
		path: '/'
	});
}

// Hash a password (used when creating users, e.g. seed script)
export async function hashPassword(password: string) {
  const saltRounds = 10;
  return await bcrypt.hash(password, saltRounds);
}

// Verify password against stored hash
export async function verifyPassword(password: string, hash: string) {
  return await bcrypt.compare(password, hash);
}

export async function getUserFromSession(sessionToken: string) {
    const { user } = await validateSessionToken(sessionToken);
    if (!user) return null;

    // Add hardcoded isAdmin flag since there's only one admin
    return {
        ...user,
        isAdmin: true
    };
}
