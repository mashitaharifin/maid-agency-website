// scripts/create-user.ts
import { Argon2id } from "oslo/password";
import { drizzle } from "drizzle-orm/postgres-js";
import postgres from "postgres";
import * as schema from "../src/lib/server/db/schema";
import { config } from "dotenv";
import { generateRandomString, alphabet } from "oslo/crypto";

// Load environment variables from .env file
config({ path: ".env" });

// Generate a random UUID-like string
function generateUUID(): string {
    return generateRandomString(32, alphabet("a-f", "0-9"));
}

async function createUser() {
    // Get your database URL from .env
    const databaseUrl = process.env.DATABASE_URL;
    if (!databaseUrl) {
        console.error("DATABASE_URL not found in environment variables");
        process.exit(1);
    }

    const client = postgres(databaseUrl);
    const db = drizzle(client, { schema });

    const username = "adminX"; // change to your username
    const password = "maidsearchSG2013"; // change to your password
    const userId = generateUUID(); // Generate a UUID manually
    
    const argon2id = new Argon2id();
    const passwordHash = await argon2id.hash(password);
    
    try {
        await db.insert(schema.users).values({
            id: userId, // Provide the manually generated ID
            username,
            passwordHash,
            isActive: true
        });
        
        console.log(`✅ User "${username}" created successfully with Argon2id hash`);
        console.log(`User ID: ${userId}`);
        console.log(`Password: ${password}`);
        console.log(`You can now login with these credentials`);
        
    } catch (error) {
        console.error("❌ Error creating user:", error);
    } finally {
        await client.end();
        process.exit(0);
    }
}

createUser().catch(console.error);