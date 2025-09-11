// src/lib/server/lucia.ts
import { Lucia } from "lucia";
import { DrizzlePostgreSQLAdapter } from "@lucia-auth/adapter-drizzle";
import { db } from "./db";
import { users, sessions } from "./db/schema";

// Create adapter (link drizzle + lucia)
const adapter = new DrizzlePostgreSQLAdapter(db, sessions, users);

// Initialize Lucia
export const lucia = new Lucia(adapter, {
    sessionCookie: {
        name: "auth_session",
        expires: false,
        attributes: {
            secure: process.env.NODE_ENV === "production"
        }
    },
    getUserAttributes: (attrs) => {
        return {
            username: attrs.username,
            isActive: attrs.isActive ?? true
        };
    }
});

// --- TypeScript module augmentation (required) ---
declare module "lucia" {
    interface Register {
        Lucia: typeof lucia;
        DatabaseUserAttributes: {
            username: string;
            isActive: boolean;
        };
    }
}

// Optional: Add just the validateRequest function if you need it for other routes
export async function validateRequest(event: any): Promise<{ user: any; session: any }> {
    const sessionId = event.cookies.get(lucia.sessionCookieName);
    
    if (!sessionId) {
        return { user: null, session: null };
    }

    const { session, user } = await lucia.validateSession(sessionId);
    
    if (session && session.fresh) {
        const sessionCookie = lucia.createSessionCookie(session.id);
        event.cookies.set(sessionCookie.name, sessionCookie.value, {
            path: ".",
            ...sessionCookie.attributes
        });
    }
    
    if (!session) {
        const sessionCookie = lucia.createBlankSessionCookie();
        event.cookies.set(sessionCookie.name, sessionCookie.value, {
            path: ".",
            ...sessionCookie.attributes
        });
    }
    
    return { user, session };
}