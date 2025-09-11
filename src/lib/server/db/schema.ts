import { sql } from 'drizzle-orm';
import { pgTable, serial, integer, text, timestamp, varchar, boolean } 
from 'drizzle-orm/pg-core';

export const users = pgTable('users', {
	id: text("id").primaryKey().default(sql`gen_random_uuid()::text`),
	username: text("username").notNull().unique(),
	passwordHash: text("password_hash").notNull(),
  createdAt: timestamp("created_at").defaultNow().notNull(),
  lastLogin: timestamp("last_login"),
  isActive: boolean("is_active").default(true).notNull(),
});

export const sessions = pgTable('sessions', {
	id: text("id").primaryKey().notNull(),
	userId: text("user_id").notNull().references(() => users.id),
	expiresAt: timestamp('expires_at', { withTimezone: true, mode: 'date' }).notNull()
});

// ========== 1. GLOBAL CONTENT ==========
export const globalContent = pgTable("global_content", {
  id: serial("id").primaryKey(),
  logoUrl: varchar("logo_url", { length: 255 }),
  agencyName: varchar("agency_name", { length: 255 }),
  email: varchar("email", { length: 255 }),
  phone: varchar("phone", { length: 50 }),
  whatsappLink: varchar("whatsapp_link", { length: 255 }),
  facebookLink: varchar("facebook_link", { length: 255 }),
  copyright: varchar("copyright", { length: 255 }),
  licenseNo: varchar("license_no", { length: 100 }),
  companyNo: varchar("company_no", { length: 100 }),
  empRegNo: varchar("emp_reg_no", { length: 100 }),
});

// ========== 2. HOMEPAGE ==========
export const homepageHero = pgTable("homepage_hero", {
  id: serial("id").primaryKey(),
  mainHeading: varchar("main_heading", { length: 255 }),
  subheading: text("subheading"),
  bgImage: varchar("bg_image", { length: 255 }),
});

export const homepageWelcome = pgTable("homepage_welcome", {
  id: serial("id").primaryKey(),
  description: text("description"),
});

export const homepageRecognitions = pgTable("homepage_recognitions", {
  id: serial("id").primaryKey(),
  sectionTitle: varchar("section_title", { length: 255 }),
  urlImage: varchar("image_url", { length: 255 }),
  caption: varchar("caption", { length: 255 }),
});

export const homepageServices = pgTable("homepage_services", {
  id: serial("id").primaryKey(),
  title: varchar("section_title", { length: 255 }),
  maidType: varchar("maid_type", { length: 50 }), 
  description: text("description"),
});

export const homepageReviews = pgTable("homepage_reviews", {
  id: serial("id").primaryKey(),
  title: varchar("section_title", { length: 255 }),
  reviewerName: varchar("reviewer_name", { length: 255 }),
  reviewText: text("review_text"),
});

// ========== 3. MAID ==========
export const maidHero = pgTable("maid_hero", {
  id: serial("id").primaryKey(),
  mainHeading: varchar("main_heading", { length: 255 }),
  subheading: text("subheading"),
  bgImage: varchar("bg_image", { length: 255 }),
});

export const maidReasons = pgTable("maid_reasons", {
  id: serial("id").primaryKey(),
  category: varchar("category", { length: 50 }), // "why-singapore" | "why-us"
  category_desc: text("category_desc"),
  icon: varchar("icon", { length: 10 }), // store emoji or icon class
  title: varchar("title", { length: 255 }),
  description: text("description"),
});

export const maidGallery = pgTable("maid_gallery", {
  id: serial("id").primaryKey(),
  title: varchar("section_title", { length: 255 }),
  description: text("description"),
});

export const maidGalleryImages = pgTable("maid_gallery_images", {
  id: serial("id").primaryKey(),
  alt: text("alt"),
  imageUrl: text("image_url").notNull(),
});

export const maidNationalities = pgTable("maid_nationalities", {
  id: serial("id").primaryKey(),
  flag: varchar("flag", { length: 10 }), 
  title: varchar("title", { length: 255 }), 
  description: text("description"),
});

export const maidNationalityPoints = pgTable("maid_nationality_points", {
  id: serial("id").primaryKey(),
  nationalityId: integer("nationality_id").references(() => maidNationalities.id, {
    onDelete: "cascade",
  }),
  point: text("point"),
});

export const maidSteps = pgTable("maid_steps", {
  id: serial("id").primaryKey(),
  sectiontitle: varchar("section_title", { length: 255 }),
  stepNumber: varchar("step_number", {  length: 10  }),
  title: text("step_title"),
  description: text("step_description"),
});

export const maidFaq = pgTable("maid_faq", {
  id: serial("id").primaryKey(),
  sectiontitle: varchar("section_title", { length: 255 }),
  question: text("question"),
  answer: text("answer"),
});

// ========== 4. PRE-EMPLOYMENT TRAINING ==========
export const trainingHero = pgTable("training_hero", {
  id: serial("id").primaryKey(),
  mainHeading: varchar("main_heading", { length: 255 }),
  subheading: text("subheading"),
  bgImage: varchar("bg_image", { length: 255 }),
});

export const trainingPlans = pgTable("training_plans", {
  id: serial("id").primaryKey(),
  sectiontitle: varchar("section_title", { length: 255 }),
  title: varchar("training_title", { length: 255 }),
  description: text("training_description"),
});

export const trainings = pgTable("trainings", {
  id: serial("id").primaryKey(),
  sectionTitle: varchar("section_title", { length: 255 }),
  icon: varchar("icon", { length: 255 }),
  title: varchar("title", { length: 255 }),
  description: text("description"),
});

// ========== 5. INSURANCE ==========
export const insuranceHero = pgTable("insurance_hero", {
  id: serial("id").primaryKey(),
  mainHeading: varchar("main_heading", { length: 255 }),
  subheading: text("subheading"),
  bgImage: varchar("bg_image", { length: 255 }),
});

export const insurancePlans = pgTable("insurance_plans", {
  id: serial("id").primaryKey(),
  icon: varchar("icon", { length: 10 }),
  title: varchar("plan_title", { length: 255 }),
  description: text("plan_description"),
});

export const insuranceTable = pgTable("insurance_table", {
  id: serial("id").primaryKey(),
  feature: text("feature").notNull(),
  standard: text("standard").notNull(),
  enhanced: text("enhanced").notNull(),
});

// ========== 6. ABOUT US ==========
export const aboutHero = pgTable("about_hero", {
  id: serial("id").primaryKey(),
  mainHeading: varchar("main_heading", { length: 255 }),
  subheading: text("subheading"),
  bgImage: varchar("bg_image", { length: 255 }),
});

export const aboutMissionVision = pgTable("about_mission_vision", {
  id: serial("id").primaryKey(),
  type: varchar("type", { length: 50 }), // "mission" or "vision"
  title: varchar("title", { length: 255 }),
  description: text("description"),
});

export const aboutCoreValues = pgTable("about_corevalues", {
  id: serial("id").primaryKey(),
  title: varchar("title", { length: 255 }),
  emoji: varchar("emoji", { length: 10 }), 
  value: varchar("value", { length: 255 }), 
  description: text("description"),
});

export const aboutFindUs = pgTable("about_findus", {
  id: serial("id").primaryKey(),
  title: varchar("title", { length: 255 }).notNull(),
  description: text("description"),
  gmapLink: text("gmap_link"), 
});

// ========== 7. FIND YOUR HELPER ==========
export const helperHero = pgTable("helper_hero", {
  id: serial("id").primaryKey(),
  mainHeading: varchar("main_heading", { length: 255 }),
  subheading: text("subheading"),
  bgImage: varchar("bg_image", { length: 255 }),
});

export const helperSteps = pgTable("helper_steps", {
  id: serial("id").primaryKey(),
  sectionTitle: varchar("section_title", { length: 255 }),
  stepNo: text("step_no"),
  icon: varchar("icon", { length: 10 }),
  title: varchar("step_title", { length: 255 }),
  description: text("step_description"),
});

export const helperChoose = pgTable("helper_choose", {
  id: serial("id").primaryKey(),
  sectionTitle: varchar("section_title", { length: 255 }).notNull(),
  reason: varchar("reason", { length: 255 }).notNull(),
  description: text("description"),
  icon: varchar("icon", { length: 255 }),
});

export const helperFaq = pgTable("helper_faq", {
  id: serial("id").primaryKey(),
  sectionTitle: varchar("section_title", { length: 255 }),
  question: text("question"),
  answer: text("answer"),
});

export const helperCta = pgTable("helper_cta", {
  id: serial("id").primaryKey(),
  heading: varchar("heading", { length: 255 }),
  subheading: text("subheading"),
  buttonText: varchar("button_text", { length: 100 }),
  buttonLink: varchar("button_link", { length: 255 })
});

// ========== 8. RECENT ACTIVITIES (DASHBOARD) ==========
export const activities = pgTable("activities", {
  id: serial("id").primaryKey(),
  icon: varchar("icon", { length: 50 }).notNull(),   
  title: text("title").notNull(),                   
  createdAt: timestamp("created_at").defaultNow().notNull(),
});

export type Session = typeof sessions.$inferSelect;

export type User = typeof users.$inferSelect;