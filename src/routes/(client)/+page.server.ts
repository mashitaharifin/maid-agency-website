import { db } from "$lib/server/db";
import { eq } from "drizzle-orm";
import type { PageServerLoad } from "./$types";
import { user } from "$lib/server/db/schema";

export let load: PageServerLoad = async () => {
    let user_ = await db.query.user.findFirst({
        where: eq(user.id, "1")
    })

    return user_
}