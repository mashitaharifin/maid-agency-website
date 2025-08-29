import { pgTable, serial, integer, text, timestamp, varchar, boolean } 
from 'drizzle-orm/pg-core';

export const user = pgTable('user', {
	id: serial("id").primaryKey(),
	username: text("username").notNull().unique(),
	passwordHash: text("password_hash").notNull(),
  createdAt: timestamp("created_at").defaultNow().notNull(),
  lastLogin: timestamp("last_login"),
  isActive: boolean("is_active").default(true).notNull(),
});

export const session = pgTable('session', {
	sessionId: text("session_id").primaryKey(),
	userId: integer("user_id").notNull().references(() => user.id),
	expiresAt: timestamp('expires_at', { withTimezone: true, mode: 'date' }).notNull()
});

// ========== 1. GLOBAL CONTENT ==========
export const globalContent = pgTable("global_content", {
  id: serial("id").primaryKey(),
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

export type Session = typeof session.$inferSelect;

export type User = typeof user.$inferSelect;