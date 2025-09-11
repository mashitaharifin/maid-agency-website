import { db } from "$lib/server/db";
import { trainingHero, trainingPlans, trainings } from "$lib/server/db/schema";
import type { PageServerLoad } from "./$types";

export const load: PageServerLoad = async () => {
  
  const [hero] = await db.select().from(trainingHero).orderBy(trainingHero.id).limit(1);
  const plans = await db.select().from(trainingPlans);
  const trainingsData = await db.select().from(trainings).orderBy(trainings.id)

  return {
    hero,
    plans,
    trainingsData,
  };
};
