// src/routes/admin/services/insurance/+page.server.ts
import { db, schema } from "$lib/server/db";
import { fail } from "@sveltejs/kit";
import { eq, asc } from "drizzle-orm";
import { logActivity } from "$lib/server/activityLogger";
import fs from "fs";
import path from "path";

export async function load() {
  const hero = await db.query.insuranceHero.findFirst();
  const plans = await db.query.insurancePlans.findMany({  orderBy: (plans, { asc }) => [asc(plans.id)],});
  const comparison = await db.query.insuranceTable.findMany();

  return { hero, plans, comparison };
}

export const actions = {
  updateHero: async ({ request }) => {
    const form = await request.formData();
    const id = Number(form.get("id"));
    const mainHeading = form.get("mainHeading") as string;
    const subheading = form.get("subheading") as string;

    if (!id) return fail(400, { error: "Missing hero ID" });

    let bgImageUrl: string | null = null;
    const bgImageField = form.get("bgImage");

    try {
      if (bgImageField instanceof File && bgImageField.size > 0) {
        const uploadDir = "static/images";
        const fileName = `${Date.now()}-${bgImageField.name}`;
        const filePath = path.join(uploadDir, fileName);

        fs.mkdirSync(uploadDir, { recursive: true });

        const buffer = Buffer.from(await bgImageField.arrayBuffer());
        fs.writeFileSync(filePath, buffer);

        bgImageUrl = `/images/${fileName}`;
      } else {
        bgImageUrl = (form.get("bgImage") as string) || null;
      }

      await db
        .update(schema.insuranceHero)
        .set({
          bgImage: bgImageUrl,
          mainHeading,
          subheading,
        })
        .where(eq(schema.insuranceHero.id, id));

      await logActivity("Insurance - Hero");
      return { success: true, message: "Hero section updated successfully!" };
    } catch (e) {
      console.error("Error updating hero:", e);
      return fail(500, { error: "Failed to update hero" });
    }
  },

  updatePlans: async ({ request }) => {
    const formData = await request.formData();

    try {
      const ids = formData.getAll("id") as string[];
      const icons = formData.getAll("icon") as string[];
      const titles = formData.getAll("title") as string[];
      const descriptions = formData.getAll("description") as string[];

      for (let i = 0; i < ids.length; i++) {
        await db.update(schema.insurancePlans)
          .set({
            icon: icons[i],
            title: titles[i],
            description: descriptions[i],
          })
          .where(eq(schema.insurancePlans.id, Number(ids[i])));
      }

      await logActivity("Insurance - Insurance Plans");
      return { success: true, message: "Insurance plans updated successfully!" };
    } catch (e) {
      console.error("Error updating plans:", e);
      return fail(500, { error: "Failed to update plans" });
    }
  },

  updateComparison: async ({ request }) => {
    const formData = await request.formData();

    try {
      const ids = formData.getAll("id") as string[];
      const features = formData.getAll("feature") as string[];
      const standards = formData.getAll("standard") as string[];
      const enhanced = formData.getAll("enhanced") as string[];

      for (let i = 0; i < ids.length; i++) {
        await db.update(schema.insuranceTable)
          .set({
            feature: features[i],
            standard: standards[i],
            enhanced: enhanced[i],
          })
          .where(eq(schema.insuranceTable.id, Number(ids[i])));
      }

      await logActivity("Insurance - Comparison Table");
      return { success: true, message: "Comparison table updated successfully!" };
    } catch (e) {
      console.error("Error updating comparison table:", e);
      return fail(500, { error: "Failed to update comparison table" });
    }
  }
};
