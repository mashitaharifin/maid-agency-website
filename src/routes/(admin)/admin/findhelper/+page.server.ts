import { db } from "$lib/server/db";
import {
  helperHero,
  helperSteps,
  helperChoose,
  helperFaq,
  helperCta
} from "$lib/server/db/schema";
import { fail, type Actions, type ServerLoad } from "@sveltejs/kit";
import { eq } from "drizzle-orm";
import { logActivity } from "$lib/server/activityLogger";

export const load: ServerLoad = async () => {
  const hero = await db.query.helperHero.findFirst();
  const steps = await db.query.helperSteps.findMany({ orderBy: (t, { asc }) => [asc(t.id)] });
  const choose = await db.query.helperChoose.findMany({ orderBy: (t, { asc }) => [asc(t.id)] });
  const faqs = await db.query.helperFaq.findMany({ orderBy: (t, { asc }) => [asc(t.id)] });
  const cta = await db.query.helperCta.findFirst();

  return { hero, steps, choose, faqs, cta };
};

export const actions: Actions = {
  updateHero: async ({ request }) => {
    const data = await request.formData();
    const bgImage = data.get("bgImage") as string;
    const mainHeading = data.get("mainHeading") as string;
    const subheading = data.get("subheading") as string;

    await db.update(helperHero).set({ bgImage, mainHeading, subheading }).where(eq(helperHero.id, 1));
    await logActivity("Find Helper - Hero");
    return { success: true, message: "Hero updated successfully!" };
  },

  updateSteps: async ({ request }) => {
    const data = await request.formData();
    const ids = data.getAll("id") as string[];
    const stepNos = data.getAll("stepNo") as string[];
    const icons = data.getAll("icon") as string[];
    const titles = data.getAll("title") as string[];
    const descriptions = data.getAll("description") as string[];

    for (let i = 0; i < ids.length; i++) {
      await db.update(helperSteps).set({
        stepNo: stepNos[i],
        icon: icons[i],
        title: titles[i],
        description: descriptions[i]
      }).where(eq(helperSteps.id, Number(ids[i])));
    }
    await logActivity("Find Helper - Steps");
    return { success: true, message: "Steps updated successfully!" };
  },

  updateChoose: async ({ request }) => {
    const data = await request.formData();
    const ids = data.getAll("id") as string[];
    const icons = data.getAll("icon") as string[];
    const reasons = data.getAll("reason") as string[];
    const descriptions = data.getAll("description") as string[];

    for (let i = 0; i < ids.length; i++) {
      await db.update(helperChoose).set({
        icon: icons[i],
        reason: reasons[i],
        description: descriptions[i]
      }).where(eq(helperChoose.id, Number(ids[i])));
    }
    await logActivity("Find Helper - Why Choose Us");
    return { success: true, message: "Why Choose Us updated successfully!" };
  },

  updateFaqs: async ({ request }) => {
    const data = await request.formData();
    const ids = data.getAll("id") as string[];
    const questions = data.getAll("question") as string[];
    const answers = data.getAll("answer") as string[];

    for (let i = 0; i < ids.length; i++) {
      await db.update(helperFaq).set({
        question: questions[i],
        answer: answers[i]
      }).where(eq(helperFaq.id, Number(ids[i])));
    }
    await logActivity("Find Helper - FAQs");
    return { success: true, message: "FAQs updated successfully!" };
  },

  updateCta: async ({ request }) => {
    const data = await request.formData();
    const heading = data.get("title") as string;
    const subheading = data.get("description") as string;
    const buttonText = data.get("buttonText") as string;
    const buttonLink = data.get("buttonLink") as string;

    await db.update(helperCta).set({ heading, subheading, buttonText, buttonLink }).where(eq(helperCta.id, 1));
    await logActivity("Find Helper - CTA");
    return { success: true, message: "CTA updated successfully!" };
  }
};
