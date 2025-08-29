import { db } from "$lib/server/db";
import { globalContent } from "$lib/server/db/schema";
import type { LayoutServerLoad } from "./$types";

export const load: LayoutServerLoad = async () => {
  const content = await db.select().from(globalContent).limit(1);

  return {
    globalContent: content[0] ?? null
  };
};
