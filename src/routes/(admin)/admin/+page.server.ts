import type { PageServerLoad } from "./$types";
import { redirect } from "@sveltejs/kit";

export const load: PageServerLoad = async ({ locals }) => {
  // Already logged in? Send them to /admin
  if (locals.user) throw redirect(302, "/admin");
  return {};
};
