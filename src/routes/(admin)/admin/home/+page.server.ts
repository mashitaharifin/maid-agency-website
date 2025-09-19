// src/routes/admin/home/+page.server.ts
import { fail, redirect } from "@sveltejs/kit";
import { db, schema } from "$lib/server/db";
import { asc, eq } from "drizzle-orm";
import { logActivity } from "$lib/server/activityLogger";
import fs from "fs";
import path from "path";

export const load = async () => {
  const hero = await db.query.homepageHero.findFirst();
  const welcome = await db.query.homepageWelcome.findFirst();
  const recognitions = await db.query.homepageRecognitions.findFirst();
  const services = await db.query.homepageServices.findMany();
  const reviews = await db.query.homepageReviews.findMany({orderBy: [asc(schema.homepageReviews.id)]});

  return {
    hero,
    welcome,
    recognitions,
    services,
    reviews
  };
};

export const actions = {
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
      const uploadDir = "static/images";
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
      // Keep existing image if no new upload
      bgImageUrl = (form.get("bgImage") as string) || null;
    }

    await db
      .update(schema.homepageHero)
      .set({
        bgImage: bgImageUrl,
        mainHeading,
        subheading,
      })
      .where(eq(schema.homepageHero.id, id));

      await logActivity("Home - Hero");
      return { success: "Hero section updated successfully!" };
  },

  updateWelcome: async ({ request }) => {
    const form = await request.formData();
    const id = Number(form.get("id"));
    const description = form.get("description") as string;

    await db
      .update(schema.homepageWelcome)
      .set({ description })
      .where(eq(schema.homepageWelcome.id, id));

    await logActivity("Home - Welcome");
    return { success: "Welcome section updated successfully!" };
  },

  updateRecognitions: async ({ request }) => {
    const form = await request.formData();
    const id = Number(form.get("id"));
    const sectionTitle = form.get("sectionTitle") as string;
    const caption = form.get("caption") as string;

    let urlImage: string | null = null;
    const fileField = form.get("urlImage");

    try {
      if (fileField instanceof File && fileField.size > 0) {
        const uploadDir = "static/images";
        const fileName = `${Date.now()}-${fileField.name}`;
        const filePath = path.join(uploadDir, fileName);

        fs.mkdirSync(uploadDir, { recursive: true });
        const buffer = Buffer.from(await fileField.arrayBuffer());
        fs.writeFileSync(filePath, buffer);

        urlImage = `/images/${fileName}`;
      } else {
        urlImage = (form.get("urlImage") as string) || null;
      }

      await db
        .update(schema.homepageRecognitions)
        .set({ sectionTitle, caption, urlImage })
        .where(eq(schema.homepageRecognitions.id, id));

      await logActivity("Home - Recognitions");
      return { success: "Recognitions section updated successfully!" };
    } catch (e) {
      console.error("Error updating recognitions:", e);
      return fail(500, { error: "Failed to update recognitions" });
    }
  },

  updateService: async ({ request }) => {
    const form = await request.formData();
    const id = Number(form.get("id"));
    const title = form.get("title") as string;
    const maidType = form.get("maidType") as string;
    const description = form.get("description") as string;

    await db
      .update(schema.homepageServices)
      .set({ title, maidType, description })
      .where(eq(schema.homepageServices.id, id));

    await logActivity("Home - Services");
    return { success: "Service updated successfully!" };
  },

  updateReview: async ({ request }) => {
    const form = await request.formData();
    const id = Number(form.get("id"));
    const title = form.get("title") as string;
    const reviewText = form.get("reviewText") as string;
    const reviewerName = form.get("reviewerName") as string;

    await db
      .update(schema.homepageReviews)
      .set({ title, reviewText, reviewerName })
      .where(eq(schema.homepageReviews.id, id));

    await logActivity("Home - Reviews");
    return { success: "Review updated successfully!" };
  }
};
