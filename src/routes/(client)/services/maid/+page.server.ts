import { db } from "$lib/server/db";
import { maidHero, maidGallery, maidGalleryImages, maidSteps, maidFaq } from "$lib/server/db/schema";
import type { PageServerLoad } from "./$types";

export const load: PageServerLoad = async () => {
  const hero = await db.select().from(maidHero).limit(1);
  const galleries = await db.select().from(maidGallery).orderBy(maidGallery.id);
  const galleryImages = await db.select().from(maidGalleryImages).orderBy(maidGalleryImages.id);
  const steps = await db.select().from(maidSteps).orderBy(maidSteps.id);
  const faqs = await db.select().from(maidFaq);

  return {
    hero: hero[0] ?? null,
    galleries,
    galleryImages,
    steps,
    faqs,
  };
};
