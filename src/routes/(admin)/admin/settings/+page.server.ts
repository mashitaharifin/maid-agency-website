// src/routes/admin/settings/+page.server.ts
import { db, schema } from "$lib/server/db";
import { fail } from "@sveltejs/kit";
import { eq } from "drizzle-orm";
import { logActivity } from "$lib/server/activityLogger";

export async function load() {
  const settings = await db.query.globalContent.findFirst();
  return { settings };
}

export const actions = {
  updateNavbar: async ({ request }) => {
    const formData = await request.formData();
    const id = Number(formData.get("id"));

    try {
      await db.update(schema.globalContent)
        .set({
          logoUrl: formData.get("logoUrl") as string,
          agencyName: formData.get("agencyName") as string,
        })
        .where(eq(schema.globalContent.id, id));

      await logActivity("Settings - Navbar");
      return { success: true, message: "Navbar settings updated successfully!" };
    } catch (e) {
      console.error("Error updating navbar:", e);
      return fail(500, { error: "Failed to update navbar" });
    }
  },

  updateFooter: async ({ request }) => {
    const formData = await request.formData();
    const id = Number(formData.get("id"));

    try {
      await db.update(schema.globalContent)
        .set({
          whatsappLink: formData.get("whatsappLink") as string,
          facebookLink: formData.get("facebookLink") as string,
          phone: formData.get("phone") as string,
          licenseNo: formData.get("licenseNo") as string,
          companyNo: formData.get("companyNo") as string,
          empRegNo: formData.get("empRegNo") as string,
          copyright: formData.get("copyright") as string,
        })
        .where(eq(schema.globalContent.id, id));

      await logActivity("Settings - Footer");
      return { success: true, message: "Footer settings updated successfully!" };
    } catch (e) {
      console.error("Error updating footer:", e);
      return fail(500, { error: "Failed to update footer" });
    }
  }
};
