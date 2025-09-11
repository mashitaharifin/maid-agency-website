// src/routes/(admin)/admin/+layout.server.ts
import type { LayoutServerLoad } from "./$types";
//import { lucia } from "$lib/server/lucia";
//import { redirect } from "@sveltejs/kit";

//export const load: LayoutServerLoad = async ({ cookies }) => {
//  const sessionId = cookies.get(lucia.sessionCookieName);
//  const { session, user } = sessionId
//    ? await lucia.validateSession(sessionId)
//   : { session: null, user: null };

  // Protect all /admin routes
//  if (!session) throw redirect(302, "/auth/login");
//  return { user };
//};

//temporary bypass for development

export const load: LayoutServerLoad = async () => {
    // ⚠️ Temporary bypass: pretend you're logged in
    return {
        user: {
            id: 'dev-user',
            name: 'Developer',
            role: 'admin'
        }
    };
};