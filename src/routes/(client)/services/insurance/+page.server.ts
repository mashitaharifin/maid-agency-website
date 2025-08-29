import { db } from "$lib/server/db";
import type { PageServerLoad } from "./$types";
import { insuranceHero, insurancePlans, insuranceTable } from "$lib/server/db/schema";

export const load: PageServerLoad = async () => {
  
  const hero = await db.select().from(insuranceHero);
  const plans = await db.select().from(insurancePlans).orderBy(insurancePlans.id);
  const comparisonTable = await db.select().from(insuranceTable);

  return {
    hero: hero[0] ?? null, 
    plans,
    comparisonTable,
  };
};
