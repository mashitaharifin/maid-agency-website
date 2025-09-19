// src/routes/admin/settings/+page.server.ts
import { db, schema } from "$lib/server/db";
import { fail } from "@sveltejs/kit";
import { eq } from "drizzle-orm";
import { logActivity } from "$lib/server/activityLogger";
import fs from "fs";
import path from "path";

export async function load() {
  const settings = await db.query.globalContent.findFirst();
  return { settings };
}

export const actions = {
  updateNavbar: async ({ request }) => {
    const form = await request.formData();
    const id = Number(form.get("id") ?? 1);
    const agencyName = form.get("agencyName") as string;

    let logoUrl: string | null = null;
    const logoField = form.get("logoUrl");

    try {
      if (logoField instanceof File && logoField.size > 0) {
        const uploadDir = "static/images";
        const fileName = `${Date.now()}-${logoField.name}`;
        const filePath = path.join(uploadDir, fileName);

        fs.mkdirSync(uploadDir, { recursive: true });
        const buffer = Buffer.from(await logoField.arrayBuffer());
        fs.writeFileSync(filePath, buffer);

        logoUrl = `/images/${fileName}`;
      } else {
        logoUrl = (form.get("logoUrl") as string) || null;
      }

      await db
        .update(schema.globalContent)
        .set({
          logoUrl,
          agencyName,
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
