import { db } from "$lib/server/db";
import { eq } from "drizzle-orm";
import type { PageServerLoad } from "./$types";
import { users, globalContent, homepageHero, homepageWelcome, homepageRecognitions, homepageServices, homepageReviews } from "$lib/server/db/schema";

export const load: PageServerLoad = async () => {
  // fetch a user (optional)
  const user_ = await db.select().from(users).where(eq(users.id, "1")).limit(1);
  // fetch global content
  const content = await db.select().from(globalContent).limit(1);
  // fetch homepage hero
  const hero = await db.select().from(homepageHero).limit(1);
  const welcome = await db.select().from(homepageWelcome).limit(1);
  const recognitions = await db.select().from(homepageRecognitions).limit(1);
  const services = await db.select().from(homepageServices);
  const reviews = await db.select().from(homepageReviews);
  

  return {
    user: user_[0] ?? null,
    globalContent: content[0] ?? null,
    hero: hero[0] ?? null,
    welcome: welcome[0] ?? null,
    recognitions: recognitions[0] ?? null,
    services,
    reviews,
  };
};
