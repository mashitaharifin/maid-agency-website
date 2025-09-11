// src/routes/login/+page.server.ts
import { lucia } from "$lib/server/lucia";
import { redirect, fail } from "@sveltejs/kit";
import { Argon2id } from "oslo/password";
import type { Actions, PageServerLoad } from "./$types";
import { eq } from "drizzle-orm";
import { db } from "$lib/server/db";
import * as schema from "$lib/server/db/schema";


export const actions: Actions = {
    default: async ({ request, cookies }) => {
        const form = await request.formData();
        const username = String(form.get("username"));
        const password = String(form.get("password"));

        const [user] = await db
            .select()
            .from(schema.users)
            .where(eq(schema.users.username, username));

        if (!user) return fail(400, { message: "Invalid credentials" });

        const validPassword = await new Argon2id().verify(
            user.passwordHash,
            password
        );
        if (!validPassword) return fail(400, { message: "Invalid credentials" });

        const session = await lucia.createSession(String(user.id), {});
        const sessionCookie = lucia.createSessionCookie(session.id);

        cookies.set(sessionCookie.name, sessionCookie.value, {
            path: ".",
            ...sessionCookie.attributes
        });

        throw redirect(302, "/admin");
    }
};

// Helper functions
function validateUsername(username: unknown): username is string {
	return (
		typeof username === "string" &&
		username.length >= 3 &&
		username.length <= 31 &&
		/^[a-z0-9_-]+$/i.test(username)
	);
}

function validatePassword(password: unknown): password is string {
	return (
		typeof password === "string" &&
		password.length >= 6 &&
		password.length <= 255
	);
}
