CREATE TABLE "about_hero" (
	"id" serial PRIMARY KEY NOT NULL,
	"main_heading" varchar(255),
	"subheading" varchar(255),
	"bg_image" varchar(255)
);
--> statement-breakpoint
CREATE TABLE "about_mission_vision" (
	"id" serial PRIMARY KEY NOT NULL,
	"type" varchar(50),
	"title" varchar(255),
	"description" text
);
--> statement-breakpoint
CREATE TABLE "global_content" (
	"id" serial PRIMARY KEY NOT NULL,
	"email" varchar(255),
	"phone" varchar(50),
	"whatsapp_link" varchar(255),
	"facebook_link" varchar(255),
	"copyright" varchar(255)
);
--> statement-breakpoint
CREATE TABLE "helper_faq" (
	"id" serial PRIMARY KEY NOT NULL,
	"question" text,
	"answer" text
);
--> statement-breakpoint
CREATE TABLE "helper_hero" (
	"id" serial PRIMARY KEY NOT NULL,
	"main_heading" varchar(255),
	"subheading" varchar(255),
	"bg_image" varchar(255)
);
--> statement-breakpoint
CREATE TABLE "helper_steps" (
	"id" serial PRIMARY KEY NOT NULL,
	"title" varchar(255),
	"description" text
);
--> statement-breakpoint
CREATE TABLE "homepage_hero" (
	"id" serial PRIMARY KEY NOT NULL,
	"main_heading" varchar(255),
	"subheading" text,
	"bg_image" varchar(255)
);
--> statement-breakpoint
CREATE TABLE "homepage_recognition" (
	"id" serial PRIMARY KEY NOT NULL,
	"title" varchar(255)
);
--> statement-breakpoint
CREATE TABLE "homepage_reviews" (
	"id" serial PRIMARY KEY NOT NULL,
	"title" varchar(255),
	"reviewer_name" varchar(255),
	"review_text" text,
	"rating" integer
);
--> statement-breakpoint
CREATE TABLE "homepage_services" (
	"id" serial PRIMARY KEY NOT NULL,
	"title" varchar(255),
	"maid_type" varchar(50),
	"description" text
);
--> statement-breakpoint
CREATE TABLE "homepage_welcome" (
	"id" serial PRIMARY KEY NOT NULL,
	"description" text
);
--> statement-breakpoint
CREATE TABLE "insurance_hero" (
	"id" serial PRIMARY KEY NOT NULL,
	"main_heading" varchar(255),
	"subheading" varchar(255),
	"bg_image" varchar(255)
);
--> statement-breakpoint
CREATE TABLE "insurance_plans" (
	"id" serial PRIMARY KEY NOT NULL,
	"title" varchar(255),
	"description" text
);
--> statement-breakpoint
CREATE TABLE "maid_apply_steps" (
	"id" serial PRIMARY KEY NOT NULL,
	"step_number" integer,
	"title" varchar(255),
	"description" text
);
--> statement-breakpoint
CREATE TABLE "maid_faq" (
	"id" serial PRIMARY KEY NOT NULL,
	"question" text,
	"answer" text
);
--> statement-breakpoint
CREATE TABLE "maid_gallery" (
	"id" serial PRIMARY KEY NOT NULL,
	"title" varchar(255),
	"description" text
);
--> statement-breakpoint
CREATE TABLE "maid_gallery_images" (
	"id" serial PRIMARY KEY NOT NULL,
	"gallery_id" integer,
	"image_url" varchar(255)
);
--> statement-breakpoint
CREATE TABLE "maid_hero" (
	"id" serial PRIMARY KEY NOT NULL,
	"main_heading" varchar(255),
	"subheading" varchar(255),
	"bg_image" varchar(255)
);
--> statement-breakpoint
CREATE TABLE "recognition_images" (
	"id" serial PRIMARY KEY NOT NULL,
	"recognition_id" integer,
	"image_url" varchar(255),
	"caption" varchar(255)
);
--> statement-breakpoint
CREATE TABLE "session" (
	"id" text PRIMARY KEY NOT NULL,
	"user_id" text NOT NULL,
	"expires_at" timestamp with time zone NOT NULL
);
--> statement-breakpoint
CREATE TABLE "training_hero" (
	"id" serial PRIMARY KEY NOT NULL,
	"main_heading" varchar(255),
	"subheading" varchar(255),
	"bg_image" varchar(255)
);
--> statement-breakpoint
CREATE TABLE "training_plans" (
	"id" serial PRIMARY KEY NOT NULL,
	"title" varchar(255),
	"description" text
);
--> statement-breakpoint
CREATE TABLE "user" (
	"id" text PRIMARY KEY NOT NULL,
	"age" integer,
	"username" text NOT NULL,
	"password_hash" text NOT NULL,
	CONSTRAINT "user_username_unique" UNIQUE("username")
);
--> statement-breakpoint
ALTER TABLE "maid_gallery_images" ADD CONSTRAINT "maid_gallery_images_gallery_id_maid_gallery_id_fk" FOREIGN KEY ("gallery_id") REFERENCES "public"."maid_gallery"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "recognition_images" ADD CONSTRAINT "recognition_images_recognition_id_homepage_recognition_id_fk" FOREIGN KEY ("recognition_id") REFERENCES "public"."homepage_recognition"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "session" ADD CONSTRAINT "session_user_id_user_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;