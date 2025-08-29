import type { Handle } from '@sveltejs/kit';
import * as auth from '$lib/server/auth';

export const handle: Handle = async ({ event, resolve }) => {
	const sessionToken = event.cookies.get(auth.sessionCookieName);
	console.log("🔑 hooks: cookie from browser →", sessionToken);

	if (!sessionToken) {
		console.log("❌ hooks: no session token, setting user=null");
		event.locals.user = null;
		event.locals.session = null;
		return resolve(event);
	}

	const { session, user } = await auth.validateSessionToken(sessionToken);
	console.log("🔍 hooks: validate result →", { session, user });

	if (session) {
		auth.setSessionTokenCookie(event.cookies, sessionToken, session.expiresAt);
	} else {
		auth.deleteSessionTokenCookie(event.cookies);
	}

	event.locals.user = user;
	event.locals.session = session;
	console.log("✅ hooks: locals.user set to →", user);
	return resolve(event);
};
