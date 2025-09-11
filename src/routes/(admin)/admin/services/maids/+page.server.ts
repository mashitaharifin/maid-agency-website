import { db } from "$lib/server/db";
import type { PageServerLoad, Actions } from "./$types";
import { fail } from "@sveltejs/kit";
import {
  maidHero,
  maidReasons,
  maidGallery,
  maidGalleryImages,
  maidSteps,
  maidFaq
} from "$lib/server/db/schema";
import { asc, eq } from "drizzle-orm";
import { logActivity } from "$lib/server/activityLogger";

export const load: PageServerLoad = async () => {
  try {
    const heroRows = await db.select().from(maidHero).orderBy(asc(maidHero.id)).limit(1);
    const hero = heroRows[0] ?? { bgImage: "", mainHeading: "", subheading: "" };
    const reasons = (await db.select().from(maidReasons).orderBy(asc(maidReasons.id)))
    .map(r => ({
      ...r,
      category: r.category?.trim() || "Uncategorized"
    }));
    const galleries = (await db.select().from(maidGallery).orderBy(asc(maidGallery.id)))
      .map(g => ({ ...g, title: g.title || null }));
    const galleryImages = await db.select().from(maidGalleryImages).orderBy(asc(maidGalleryImages.id));
    const steps = await db.select().from(maidSteps).orderBy(asc(maidSteps.id));
    const faqs = await db.select().from(maidFaq).orderBy(asc(maidFaq.id));

    return { hero, reasons, galleries, galleryImages, steps, faqs };
  } catch (e) {
    console.error("Error loading maid data:", e);
    return fail(500, { error: "Failed to load maid data" });
  }
};

export const actions: Actions = {
  updateHero: async ({ request }) => {
    const formData = await request.formData();
    const id = Number(formData.get("id"));
    try {
      await db.update(maidHero)
        .set({
          bgImage: formData.get("bgImage") as string,
          mainHeading: formData.get("mainHeading") as string,
          subheading: formData.get("subheading") as string
        })
        .where(eq(maidHero.id, id));

      await logActivity("Maids - Hero");
      return { success: true, message: "Hero updated successfully!" };
    } catch (e) {
      console.error(e);
      return fail(500, { error: "Failed to update hero" });
    }
  },

  updateReasons: async ({ request }) => {
    const formData = await request.formData();
    const count = Number(formData.get("count"));

    try {
      for (let i = 0; i < count; i++) {
        const id = Number(formData.get(`id_${i}`));

        await db.update(maidReasons)
          .set({
            category: (formData.get(`category_${i}`) as string) ?? "",
            category_desc: (formData.get(`category_desc_${i}`) as string) ?? "",
            icon: (formData.get(`icon_${i}`) as string) ?? "",
            title: (formData.get(`title_${i}`) as string) ?? "",
            description: (formData.get(`description_${i}`) as string) ?? ""
          })
          .where(eq(maidReasons.id, id));
      }

      await logActivity("Maids - Reasons");
      return { success: true, message: "Reasons updated successfully!" };
    } catch (e) {
      console.error("updateReasons error:", e);
      return fail(500, { error: "Failed to update reasons" });
    }
  },


  updateGalleries: async ({ request }) => {
    const formData = await request.formData();
    const count = Number(formData.get("count"));
    try {
      for (let i = 0; i < count; i++) {
        const id = Number(formData.get(`id_${i}`));
        await db.update(maidGallery)
          .set({
            title: formData.get(`title_${i}`) as string,
            description: formData.get(`description_${i}`) as string
          })
          .where(eq(maidGallery.id, id));
      }

      await logActivity("Maids - Galleries");
      return { success: true, message: "Galleries updated successfully!" };
    } catch (e) {
      console.error(e);
      return fail(500, { error: "Failed to update galleries" });
    }
  },

  updateGalleryImages: async ({ request }) => {
    const formData = await request.formData();
    const count = Number(formData.get("count"));
    try {
      for (let i = 0; i < count; i++) {
        const id = Number(formData.get(`id_${i}`));
        await db.update(maidGalleryImages)
          .set({
            imageUrl: formData.get(`imageUrl_${i}`) as string,
            alt: formData.get(`alt_${i}`) as string
          })
          .where(eq(maidGalleryImages.id, id));
      }
      await logActivity("Maids - Gallery Images");
      return { success: true, message: "Gallery images updated successfully!" };
    } catch (e) {
      console.error(e);
      return fail(500, { error: "Failed to update gallery images" });
    }
  },

  updateSteps: async ({ request }) => {
    const formData = await request.formData();
    const count = Number(formData.get("count"));
    try {
      for (let i = 0; i < count; i++) {
        const id = Number(formData.get(`id_${i}`));
        await db.update(maidSteps)
          .set({
            stepNumber: formData.get(`stepNumber_${i}`) as string,
            title: formData.get(`title_${i}`) as string,
            description: formData.get(`description_${i}`) as string
          })
          .where(eq(maidSteps.id, id));
      }
      await logActivity("Maids - Steps");
      return { success: true, message: "Steps updated successfully!" };
    } catch (e) {
      console.error(e);
      return fail(500, { error: "Failed to update steps" });
    }
  },

  updateFaqs: async ({ request }) => {
    const formData = await request.formData();
    const count = Number(formData.get("count"));
    try {
      for (let i = 0; i < count; i++) {
        const id = Number(formData.get(`id_${i}`));
        await db.update(maidFaq)
          .set({
            sectiontitle: i === 0 ? (formData.get("sectiontitle") as string) : undefined,
            question: formData.get(`question_${i}`) as string,
            answer: formData.get(`answer_${i}`) as string
          })
          .where(eq(maidFaq.id, id));
      }
      await logActivity("Maids - FAQs");
      return { success: true, message: "FAQs updated successfully!" };
    } catch (e) {
      console.error(e);
      return fail(500, { error: "Failed to update FAQs" });
    }
  }
};
