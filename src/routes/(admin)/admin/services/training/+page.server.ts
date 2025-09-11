// src/routes/admin/services/training/+page.server.ts
import { db, schema } from "$lib/server/db";
import { fail } from "@sveltejs/kit";
import { eq } from "drizzle-orm";
import { logActivity } from "$lib/server/activityLogger";

export async function load() {
  // Ensure deterministic hero row: pick the first row ordered by id ascending
  const hero = await db.query.trainingHero.findFirst({
    orderBy: (h, { asc }) => [asc(h.id)]
  });

  // Trainings and plans ordered by id ascending
  const trainings = await db.query.trainings.findMany({
    orderBy: (t, { asc }) => [asc(t.id)]
  });

  const plans = await db.query.trainingPlans.findMany({
    orderBy: (p, { asc }) => [asc(p.id)]
  });

  return { hero, trainings, plans };
}

export const actions = {
  updateHero: async ({ request }) => {
    const formData = await request.formData();
    const id = Number(formData.get("id"));

    try {
      await db.update(schema.trainingHero)
        .set({
          bgImage: (formData.get("bgImage") as string) ?? "",
          mainHeading: (formData.get("mainHeading") as string) ?? "",
          subheading: (formData.get("subheading") as string) ?? ""
        })
        .where(eq(schema.trainingHero.id, id));

      await logActivity("Training - Hero");
      return { success: true, message: "Hero section updated successfully!" };
    } catch (e) {
      console.error("Error updating hero:", e);
      return fail(500, { error: "Failed to update hero" });
    }
  },

  updateTrainings: async ({ request }) => {
    const formData = await request.formData();

    const ids = formData.getAll("ids[]").map((v) => Number(v));
    const icons = formData.getAll("icon[]").map((v) => String(v));
    const titles = formData.getAll("title[]").map((v) => String(v));
    const descriptions = formData.getAll("description[]").map((v) => String(v));

    try {
      for (let i = 0; i < ids.length; i++) {
        await db.update(schema.trainings)
          .set({
            icon: icons[i] ?? "",
            title: titles[i] ?? "",
            description: descriptions[i] ?? ""
          })
          .where(eq(schema.trainings.id, ids[i]));
      }

      await logActivity("Training - Training modules");
      return { success: true, message: "Training modules updated successfully!" };
    } catch (e) {
      console.error("Error updating trainings:", e);
      return fail(500, { error: "Failed to update trainings" });
    }
  },

  updatePlans: async ({ request }) => {
    const formData = await request.formData();

    const ids = formData.getAll("ids[]").map((v) => Number(v));
    const sectiontitles = formData.getAll("sectiontitle[]").map((v) => String(v));
    const titles = formData.getAll("title[]").map((v) => String(v));
    const descriptions = formData.getAll("description[]").map((v) => String(v));

    try {
      for (let i = 0; i < ids.length; i++) {
        await db.update(schema.trainingPlans)
          .set({
            sectiontitle: sectiontitles[i] ?? "",
            title: titles[i] ?? "",
            description: descriptions[i] ?? ""
          })
          .where(eq(schema.trainingPlans.id, ids[i]));
      }

      await logActivity("Training - Why Choose Us");
      return { success: true, message: "Why Choose Us section updated successfully!" };
    } catch (e) {
      console.error("Error updating plans:", e);
      return fail(500, { error: "Failed to update plans" });
    }
  }
};
