import { db } from "$lib/server/db";
import { helperHero, helperSteps, helperChoose, helperFaq } from "$lib/server/db/schema";
import { asc } from "drizzle-orm";

export const load = async () => {
  const hero = await db.select().from(helperHero).limit(1);
  const steps = await db.select().from(helperSteps).orderBy(asc(helperSteps.stepNo));
  const faqs = await db.select().from(helperFaq).orderBy(asc(helperFaq.id));
  const choose = await db.select().from(helperChoose).orderBy(asc(helperChoose.id));

  return {
    hero: hero[0],
    steps,
    faqs,
    choose,
  };
};
