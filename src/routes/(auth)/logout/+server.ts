// src/routes/logout/+server.ts
import { lucia } from "$lib/server/lucia";
import { redirect } from "@sveltejs/kit";

export const POST = async ({ cookies }) => {
    const sessionId = cookies.get(lucia.sessionCookieName);
    if (sessionId) {
        await lucia.invalidateSession(sessionId);
        const blankCookie = lucia.createBlankSessionCookie();
        cookies.set(blankCookie.name, blankCookie.value, {
            path: "/",
            ...blankCookie.attributes
        });
    }
    throw redirect(302, "/login");
};
