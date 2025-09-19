import { fail, redirect } from "@sveltejs/kit";
import type { Actions, PageServerLoad } from "./$types";
import { db } from "$lib/server/db";
import { aboutHero, aboutMissionVision, aboutCoreValues, aboutFindUs} from "$lib/server/db/schema";
import { eq } from "drizzle-orm";
import { logActivity } from "$lib/server/activityLogger";
import fs from 'fs';
import path from 'path';

export const load: PageServerLoad = async () => {
  const hero = await db.query.aboutHero.findFirst();
  const missionVisionData = await db.query.aboutMissionVision.findMany();
  const coreValuesData = await db.query.aboutCoreValues.findMany();
  const findUsData = await db.query.aboutFindUs.findFirst();

  return {
    hero,
    missionVision: missionVisionData,
    coreValues: coreValuesData,
    findUs: findUsData
  };
};

export const actions: Actions = {
  updateHero: async ({ request }) => {
    const form = await request.formData();
    const id = Number(form.get("id"));
    const mainHeading = form.get("mainHeading") as string;
    const subheading = form.get("subheading") as string;

    if (!id) return fail(400, { error: "Missing hero ID" });

    let bgImageUrl: string | null = null;
    const bgImageField = form.get("bgImage");

    // Handle file upload
    if (bgImageField instanceof File && bgImageField.size > 0) {
      const uploadDir = 'static/images';
      const fileName = `${Date.now()}-${bgImageField.name}`;
      const filePath = path.join(uploadDir, fileName);

      // Ensure folder exists
      fs.mkdirSync(uploadDir, { recursive: true });

      // Save file
      const buffer = Buffer.from(await bgImageField.arrayBuffer());
      fs.writeFileSync(filePath, buffer);

      // Public URL for DB
      bgImageUrl = `/images/${fileName}`;
    } else {
      // If no new upload, keep existing value from DB
      // (you may already have hero data fetched in load, but here we re-use form data fallback)
      bgImageUrl = (form.get("bgImage") as string) || null;
    }

    // Save to DB
    await db
      .update(aboutHero)
      .set({
        bgImage: bgImageUrl,
        mainHeading,
        subheading
      })
      .where(eq(aboutHero.id, id));

    await logActivity("About Us - Hero");
    return { success: "Hero section updated successfully!" };
  },

  updateMissionVision: async ({ request }) => {
    const form = await request.formData();
    const ids = form.getAll("id");
    const titles = form.getAll("title");
    const descriptions = form.getAll("description");

    for (let i = 0; i < ids.length; i++) {
      const id = Number(ids[i]);
      if (!id) continue;

      await db
        .update(aboutMissionVision)
        .set({
          title: titles[i] as string,
          description: descriptions[i] as string
        })
        .where(eq(aboutMissionVision.id, id));
    }

    await logActivity("About Us - Mission & Vission");
    return { success: "Mission & Vision updated successfully!" };
  },

  updateCoreValues: async ({ request }) => {
    const form = await request.formData();
    const ids = form.getAll("id");
    const emojis = form.getAll("emoji");
    const values = form.getAll("value");
    const descriptions = form.getAll("description");

    for (let i = 0; i < ids.length; i++) {
      const id = Number(ids[i]);
      if (!id) continue;

      await db
        .update(aboutCoreValues)
        .set({
          emoji: emojis[i] as string,
          value: values[i] as string,
          description: descriptions[i] as string
        })
        .where(eq(aboutCoreValues.id, id));
    }

    await logActivity("About Us - Core values");
    return { success: "Core values updated successfully!" };
  },

  updateFindUs: async ({ request }) => {
    const form = await request.formData();
    const id = Number(form.get("id"));
    const title = form.get("title") as string;
    const description = form.get("description") as string;
    const gmapLink = form.get("gmapLink") as string;

    if (!id) return fail(400, { error: "Missing Find Us ID" });

    await db
      .update(aboutFindUs)
      .set({ title, description, gmapLink })
      .where(eq(aboutFindUs.id, id));

    await logActivity("About Us - Find Us");
    return { success: "Find Us updated successfully!" };
  }
};
