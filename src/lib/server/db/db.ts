// src/lib/server/db.ts
import { Pool } from "pg";
import { drizzle } from "drizzle-orm/node-postgres";

const pool = new Pool({
  connectionString: process.env.DATABASE_URL, // your existing .env URL
});

export const db = drizzle(pool);
