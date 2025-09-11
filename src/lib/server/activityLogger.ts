// src/lib/server/activityLogger.ts
import { db } from "$lib/server/db";
import { activities } from "$lib/server/db/schema";

export async function logActivity(pageName: string) {
    let icon = "edit";

    if (pageName.startsWith("Home")) icon = "home";
    else if (pageName.startsWith("About")) icon = "info-circle";
    else if (pageName.startsWith("Settings")) icon = "cog";
    else if (pageName.startsWith("Training")) icon = "graduation-cap";
    else if (pageName.startsWith("Maids")) icon = "user-md";
    else if (pageName.startsWith("Insurance")) icon = "shield-alt";
    else if (pageName.startsWith("Find")) icon = "hands-helping";

    await db.insert(activities).values({
    icon,
    title: `${pageName} page updated`
  });
}
