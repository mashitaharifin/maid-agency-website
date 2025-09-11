import { db } from "$lib/server/db";
import { maidHero, maidReasons, maidGallery, maidGalleryImages, maidNationalities, maidNationalityPoints, maidSteps, maidFaq } from "$lib/server/db/schema";
import type { PageServerLoad } from "./$types";

export const load: PageServerLoad = async () => {
  const hero = await db.select().from(maidHero).limit(1);
  const reasons = await db.select().from(maidReasons).orderBy(maidReasons.id);
  const galleries = await db.select().from(maidGallery).orderBy(maidGallery.id);
  const galleryImages = await db.select().from(maidGalleryImages).orderBy(maidGalleryImages.id);
  const steps = await db.select().from(maidSteps).orderBy(maidSteps.id);
  const faqs = await db.select().from(maidFaq);
  const nationalities = await db.select().from(maidNationalities).orderBy(maidNationalities.id);
  const nationalityPoints = await db.select().from(maidNationalityPoints);
  
  const reasonsCategory = Array.from(
    new Map(
      reasons.map(r => [r.category, { category: r.category, category_desc: r.category_desc || '' }])
    ).values()
  );

  return {
    hero: hero[0] ?? null,
    reasons,
    reasonsCategory,
    galleries,
    galleryImages,
    nationalities,
    nationalityPoints,
    steps,
    faqs,
  };
};
