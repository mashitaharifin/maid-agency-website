// src/routes/admin/+page.server.ts
import type { PageServerLoad } from "./$types";
import { redirect } from "@sveltejs/kit";
import { db } from "$lib/server/db";
import * as schema from "$lib/server/db/schema";
import { desc } from "drizzle-orm";

export const load: PageServerLoad = async ({ locals }) => {
  if (!locals.user) { // ← Changed this line!
    throw redirect(302, "/login"); // redirect to login if user NOT found
  }

  const activities = await db.query.activities.findMany({
    orderBy: [desc(schema.activities.createdAt)],
  });

  return { activities };
};