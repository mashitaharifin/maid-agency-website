import { db } from "$lib/server/db";
import { aboutHero, aboutMissionVision, aboutCoreValues, aboutFindUs } from "$lib/server/db/schema";
import type { PageServerLoad } from "./$types";

export const load: PageServerLoad = async () => {
  const hero = await db.select().from(aboutHero).limit(1);
  const missionVision = await db.select().from(aboutMissionVision);
  const coreValues = await db.select().from(aboutCoreValues);
  const findUs = await db.select().from(aboutFindUs).limit(1);

  return {
    hero: hero[0] ?? null,
    missionVision,
    coreValues,
    findUs: findUs[0] ?? null,
  };
};
