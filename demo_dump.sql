--
-- PostgreSQL database dump
--

-- Dumped from database version 14.18 (Ubuntu 14.18-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.18 (Ubuntu 14.18-0ubuntu0.22.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: about_corevalues; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.about_corevalues (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    emoji character varying(10),
    value character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.about_corevalues OWNER TO postgres;

--
-- Name: about_corevalues_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.about_corevalues_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.about_corevalues_id_seq OWNER TO postgres;

--
-- Name: about_corevalues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.about_corevalues_id_seq OWNED BY public.about_corevalues.id;


--
-- Name: about_findus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.about_findus (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    gmap_link text
);


ALTER TABLE public.about_findus OWNER TO postgres;

--
-- Name: about_findus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.about_findus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.about_findus_id_seq OWNER TO postgres;

--
-- Name: about_findus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.about_findus_id_seq OWNED BY public.about_findus.id;


--
-- Name: about_hero; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.about_hero (
    id integer NOT NULL,
    main_heading character varying(255),
    subheading text,
    bg_image character varying(255)
);


ALTER TABLE public.about_hero OWNER TO postgres;

--
-- Name: about_hero_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.about_hero_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.about_hero_id_seq OWNER TO postgres;

--
-- Name: about_hero_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.about_hero_id_seq OWNED BY public.about_hero.id;


--
-- Name: about_mission_vision; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.about_mission_vision (
    id integer NOT NULL,
    type character varying(50),
    title character varying(255),
    description text
);


ALTER TABLE public.about_mission_vision OWNER TO postgres;

--
-- Name: about_mission_vision_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.about_mission_vision_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.about_mission_vision_id_seq OWNER TO postgres;

--
-- Name: about_mission_vision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.about_mission_vision_id_seq OWNED BY public.about_mission_vision.id;


--
-- Name: activities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.activities (
    id integer NOT NULL,
    icon character varying(50),
    title text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.activities OWNER TO postgres;

--
-- Name: activities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.activities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activities_id_seq OWNER TO postgres;

--
-- Name: activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.activities_id_seq OWNED BY public.activities.id;


--
-- Name: global_content; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.global_content (
    id integer NOT NULL,
    email character varying(255),
    phone character varying(50),
    whatsapp_link character varying(255),
    facebook_link character varying(255),
    copyright character varying(255),
    license_no character varying(100),
    company_no character varying(100),
    emp_reg_no character varying(100),
    logo_url character varying(255),
    agency_name character varying(255)
);


ALTER TABLE public.global_content OWNER TO postgres;

--
-- Name: global_content_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.global_content_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.global_content_id_seq OWNER TO postgres;

--
-- Name: global_content_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.global_content_id_seq OWNED BY public.global_content.id;


--
-- Name: helper_choose; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.helper_choose (
    id integer NOT NULL,
    section_title character varying(255) NOT NULL,
    reason character varying(255) NOT NULL,
    description text,
    icon character varying(255)
);


ALTER TABLE public.helper_choose OWNER TO postgres;

--
-- Name: helper_choose_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.helper_choose_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.helper_choose_id_seq OWNER TO postgres;

--
-- Name: helper_choose_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.helper_choose_id_seq OWNED BY public.helper_choose.id;


--
-- Name: helper_cta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.helper_cta (
    id integer NOT NULL,
    heading character varying(255),
    subheading text,
    button_text character varying(100),
    button_link character varying(255)
);


ALTER TABLE public.helper_cta OWNER TO postgres;

--
-- Name: helper_cta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.helper_cta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.helper_cta_id_seq OWNER TO postgres;

--
-- Name: helper_cta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.helper_cta_id_seq OWNED BY public.helper_cta.id;


--
-- Name: helper_faq; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.helper_faq (
    id integer NOT NULL,
    question text,
    answer text,
    section_title character varying(10)
);


ALTER TABLE public.helper_faq OWNER TO postgres;

--
-- Name: helper_faq_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.helper_faq_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.helper_faq_id_seq OWNER TO postgres;

--
-- Name: helper_faq_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.helper_faq_id_seq OWNED BY public.helper_faq.id;


--
-- Name: helper_hero; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.helper_hero (
    id integer NOT NULL,
    main_heading character varying(255),
    subheading text,
    bg_image character varying(255)
);


ALTER TABLE public.helper_hero OWNER TO postgres;

--
-- Name: helper_hero_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.helper_hero_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.helper_hero_id_seq OWNER TO postgres;

--
-- Name: helper_hero_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.helper_hero_id_seq OWNED BY public.helper_hero.id;


--
-- Name: helper_steps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.helper_steps (
    id integer NOT NULL,
    step_title text,
    step_description text,
    icon character varying(10),
    step_no text,
    section_title text
);


ALTER TABLE public.helper_steps OWNER TO postgres;

--
-- Name: helper_steps_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.helper_steps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.helper_steps_id_seq OWNER TO postgres;

--
-- Name: helper_steps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.helper_steps_id_seq OWNED BY public.helper_steps.id;


--
-- Name: homepage_hero; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.homepage_hero (
    id integer NOT NULL,
    main_heading character varying(255),
    subheading text,
    bg_image character varying(255)
);


ALTER TABLE public.homepage_hero OWNER TO postgres;

--
-- Name: homepage_hero_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.homepage_hero_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.homepage_hero_id_seq OWNER TO postgres;

--
-- Name: homepage_hero_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.homepage_hero_id_seq OWNED BY public.homepage_hero.id;


--
-- Name: homepage_recognitions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.homepage_recognitions (
    id integer NOT NULL,
    section_title character varying(255),
    image_url character varying(255),
    caption character varying(255)
);


ALTER TABLE public.homepage_recognitions OWNER TO postgres;

--
-- Name: homepage_recognitions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.homepage_recognitions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.homepage_recognitions_id_seq OWNER TO postgres;

--
-- Name: homepage_recognitions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.homepage_recognitions_id_seq OWNED BY public.homepage_recognitions.id;


--
-- Name: homepage_reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.homepage_reviews (
    id integer NOT NULL,
    section_title character varying(255),
    reviewer_name character varying(100),
    review_text text
);


ALTER TABLE public.homepage_reviews OWNER TO postgres;

--
-- Name: homepage_reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.homepage_reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.homepage_reviews_id_seq OWNER TO postgres;

--
-- Name: homepage_reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.homepage_reviews_id_seq OWNED BY public.homepage_reviews.id;


--
-- Name: homepage_services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.homepage_services (
    id integer NOT NULL,
    section_title character varying(255),
    maid_type character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.homepage_services OWNER TO postgres;

--
-- Name: homepage_services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.homepage_services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.homepage_services_id_seq OWNER TO postgres;

--
-- Name: homepage_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.homepage_services_id_seq OWNED BY public.homepage_services.id;


--
-- Name: homepage_welcome; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.homepage_welcome (
    id integer NOT NULL,
    description text
);


ALTER TABLE public.homepage_welcome OWNER TO postgres;

--
-- Name: homepage_welcome_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.homepage_welcome_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.homepage_welcome_id_seq OWNER TO postgres;

--
-- Name: homepage_welcome_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.homepage_welcome_id_seq OWNED BY public.homepage_welcome.id;


--
-- Name: insurance_hero; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.insurance_hero (
    id integer NOT NULL,
    main_heading character varying(255),
    subheading text,
    bg_image character varying(255)
);


ALTER TABLE public.insurance_hero OWNER TO postgres;

--
-- Name: insurance_hero_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.insurance_hero_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.insurance_hero_id_seq OWNER TO postgres;

--
-- Name: insurance_hero_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.insurance_hero_id_seq OWNED BY public.insurance_hero.id;


--
-- Name: insurance_plans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.insurance_plans (
    id integer NOT NULL,
    plan_title character varying(255),
    plan_description text,
    icon character varying(10)
);


ALTER TABLE public.insurance_plans OWNER TO postgres;

--
-- Name: insurance_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.insurance_plans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.insurance_plans_id_seq OWNER TO postgres;

--
-- Name: insurance_plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.insurance_plans_id_seq OWNED BY public.insurance_plans.id;


--
-- Name: insurance_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.insurance_table (
    id integer NOT NULL,
    feature text NOT NULL,
    standard text NOT NULL,
    enhanced text NOT NULL
);


ALTER TABLE public.insurance_table OWNER TO postgres;

--
-- Name: insurance_table_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.insurance_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.insurance_table_id_seq OWNER TO postgres;

--
-- Name: insurance_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.insurance_table_id_seq OWNED BY public.insurance_table.id;


--
-- Name: maid_faq; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.maid_faq (
    id integer NOT NULL,
    section_title character varying(255),
    question text,
    answer text
);


ALTER TABLE public.maid_faq OWNER TO postgres;

--
-- Name: maid_faq_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.maid_faq_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.maid_faq_id_seq OWNER TO postgres;

--
-- Name: maid_faq_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.maid_faq_id_seq OWNED BY public.maid_faq.id;


--
-- Name: maid_gallery; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.maid_gallery (
    id integer NOT NULL,
    section_title character varying(255),
    description text
);


ALTER TABLE public.maid_gallery OWNER TO postgres;

--
-- Name: maid_gallery_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.maid_gallery_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.maid_gallery_id_seq OWNER TO postgres;

--
-- Name: maid_gallery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.maid_gallery_id_seq OWNED BY public.maid_gallery.id;


--
-- Name: maid_gallery_images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.maid_gallery_images (
    id integer NOT NULL,
    alt text NOT NULL,
    image_url text NOT NULL
);


ALTER TABLE public.maid_gallery_images OWNER TO postgres;

--
-- Name: maid_gallery_images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.maid_gallery_images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.maid_gallery_images_id_seq OWNER TO postgres;

--
-- Name: maid_gallery_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.maid_gallery_images_id_seq OWNED BY public.maid_gallery_images.id;


--
-- Name: maid_hero; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.maid_hero (
    id integer NOT NULL,
    main_heading character varying(255),
    subheading text,
    bg_image character varying(255)
);


ALTER TABLE public.maid_hero OWNER TO postgres;

--
-- Name: maid_hero_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.maid_hero_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.maid_hero_id_seq OWNER TO postgres;

--
-- Name: maid_hero_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.maid_hero_id_seq OWNED BY public.maid_hero.id;


--
-- Name: maid_nationalities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.maid_nationalities (
    id integer NOT NULL,
    flag character varying(10),
    title character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.maid_nationalities OWNER TO postgres;

--
-- Name: maid_nationalities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.maid_nationalities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.maid_nationalities_id_seq OWNER TO postgres;

--
-- Name: maid_nationalities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.maid_nationalities_id_seq OWNED BY public.maid_nationalities.id;


--
-- Name: maid_nationality_points; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.maid_nationality_points (
    id integer NOT NULL,
    nationality_id integer NOT NULL,
    point text NOT NULL
);


ALTER TABLE public.maid_nationality_points OWNER TO postgres;

--
-- Name: maid_nationality_points_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.maid_nationality_points_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.maid_nationality_points_id_seq OWNER TO postgres;

--
-- Name: maid_nationality_points_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.maid_nationality_points_id_seq OWNED BY public.maid_nationality_points.id;


--
-- Name: maid_reasons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.maid_reasons (
    id integer NOT NULL,
    category character varying(50) NOT NULL,
    icon character varying(10),
    title character varying(255) NOT NULL,
    description text,
    category_desc text
);


ALTER TABLE public.maid_reasons OWNER TO postgres;

--
-- Name: maid_reasons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.maid_reasons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.maid_reasons_id_seq OWNER TO postgres;

--
-- Name: maid_reasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.maid_reasons_id_seq OWNED BY public.maid_reasons.id;


--
-- Name: maid_steps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.maid_steps (
    id integer NOT NULL,
    section_title character varying(255),
    step_number character varying(10),
    step_title character varying(255),
    step_description text
);


ALTER TABLE public.maid_steps OWNER TO postgres;

--
-- Name: maid_steps_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.maid_steps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.maid_steps_id_seq OWNER TO postgres;

--
-- Name: maid_steps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.maid_steps_id_seq OWNED BY public.maid_steps.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id text NOT NULL,
    user_id text NOT NULL,
    expires_at timestamp with time zone NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: training_hero; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.training_hero (
    id integer NOT NULL,
    main_heading character varying(255),
    subheading text,
    bg_image character varying(255)
);


ALTER TABLE public.training_hero OWNER TO postgres;

--
-- Name: training_hero_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.training_hero_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.training_hero_id_seq OWNER TO postgres;

--
-- Name: training_hero_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.training_hero_id_seq OWNED BY public.training_hero.id;


--
-- Name: training_plans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.training_plans (
    id integer NOT NULL,
    training_title character varying(255),
    training_description text,
    section_title character varying(255)
);


ALTER TABLE public.training_plans OWNER TO postgres;

--
-- Name: training_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.training_plans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.training_plans_id_seq OWNER TO postgres;

--
-- Name: training_plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.training_plans_id_seq OWNED BY public.training_plans.id;


--
-- Name: trainings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trainings (
    id integer NOT NULL,
    section_title character varying(255),
    icon character varying(255),
    title character varying(255),
    description text
);


ALTER TABLE public.trainings OWNER TO postgres;

--
-- Name: trainings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trainings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trainings_id_seq OWNER TO postgres;

--
-- Name: trainings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trainings_id_seq OWNED BY public.trainings.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id text NOT NULL,
    username text NOT NULL,
    password_hash text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    last_login timestamp without time zone,
    is_active boolean DEFAULT true NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: about_corevalues id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.about_corevalues ALTER COLUMN id SET DEFAULT nextval('public.about_corevalues_id_seq'::regclass);


--
-- Name: about_findus id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.about_findus ALTER COLUMN id SET DEFAULT nextval('public.about_findus_id_seq'::regclass);


--
-- Name: about_hero id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.about_hero ALTER COLUMN id SET DEFAULT nextval('public.about_hero_id_seq'::regclass);


--
-- Name: about_mission_vision id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.about_mission_vision ALTER COLUMN id SET DEFAULT nextval('public.about_mission_vision_id_seq'::regclass);


--
-- Name: activities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities ALTER COLUMN id SET DEFAULT nextval('public.activities_id_seq'::regclass);


--
-- Name: global_content id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.global_content ALTER COLUMN id SET DEFAULT nextval('public.global_content_id_seq'::regclass);


--
-- Name: helper_choose id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.helper_choose ALTER COLUMN id SET DEFAULT nextval('public.helper_choose_id_seq'::regclass);


--
-- Name: helper_cta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.helper_cta ALTER COLUMN id SET DEFAULT nextval('public.helper_cta_id_seq'::regclass);


--
-- Name: helper_faq id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.helper_faq ALTER COLUMN id SET DEFAULT nextval('public.helper_faq_id_seq'::regclass);


--
-- Name: helper_hero id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.helper_hero ALTER COLUMN id SET DEFAULT nextval('public.helper_hero_id_seq'::regclass);


--
-- Name: helper_steps id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.helper_steps ALTER COLUMN id SET DEFAULT nextval('public.helper_steps_id_seq'::regclass);


--
-- Name: homepage_hero id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homepage_hero ALTER COLUMN id SET DEFAULT nextval('public.homepage_hero_id_seq'::regclass);


--
-- Name: homepage_recognitions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homepage_recognitions ALTER COLUMN id SET DEFAULT nextval('public.homepage_recognitions_id_seq'::regclass);


--
-- Name: homepage_reviews id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homepage_reviews ALTER COLUMN id SET DEFAULT nextval('public.homepage_reviews_id_seq'::regclass);


--
-- Name: homepage_services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homepage_services ALTER COLUMN id SET DEFAULT nextval('public.homepage_services_id_seq'::regclass);


--
-- Name: homepage_welcome id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homepage_welcome ALTER COLUMN id SET DEFAULT nextval('public.homepage_welcome_id_seq'::regclass);


--
-- Name: insurance_hero id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insurance_hero ALTER COLUMN id SET DEFAULT nextval('public.insurance_hero_id_seq'::regclass);


--
-- Name: insurance_plans id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insurance_plans ALTER COLUMN id SET DEFAULT nextval('public.insurance_plans_id_seq'::regclass);


--
-- Name: insurance_table id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insurance_table ALTER COLUMN id SET DEFAULT nextval('public.insurance_table_id_seq'::regclass);


--
-- Name: maid_faq id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maid_faq ALTER COLUMN id SET DEFAULT nextval('public.maid_faq_id_seq'::regclass);


--
-- Name: maid_gallery id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maid_gallery ALTER COLUMN id SET DEFAULT nextval('public.maid_gallery_id_seq'::regclass);


--
-- Name: maid_gallery_images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maid_gallery_images ALTER COLUMN id SET DEFAULT nextval('public.maid_gallery_images_id_seq'::regclass);


--
-- Name: maid_hero id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maid_hero ALTER COLUMN id SET DEFAULT nextval('public.maid_hero_id_seq'::regclass);


--
-- Name: maid_nationalities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maid_nationalities ALTER COLUMN id SET DEFAULT nextval('public.maid_nationalities_id_seq'::regclass);


--
-- Name: maid_nationality_points id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maid_nationality_points ALTER COLUMN id SET DEFAULT nextval('public.maid_nationality_points_id_seq'::regclass);


--
-- Name: maid_reasons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maid_reasons ALTER COLUMN id SET DEFAULT nextval('public.maid_reasons_id_seq'::regclass);


--
-- Name: maid_steps id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maid_steps ALTER COLUMN id SET DEFAULT nextval('public.maid_steps_id_seq'::regclass);


--
-- Name: training_hero id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.training_hero ALTER COLUMN id SET DEFAULT nextval('public.training_hero_id_seq'::regclass);


--
-- Name: training_plans id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.training_plans ALTER COLUMN id SET DEFAULT nextval('public.training_plans_id_seq'::regclass);


--
-- Name: trainings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainings ALTER COLUMN id SET DEFAULT nextval('public.trainings_id_seq'::regclass);


--
-- Data for Name: about_corevalues; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.about_corevalues (id, title, emoji, value, description) FROM stdin;
1	Core Values	💖	Care	We put people first, ensuring both families and helpers feel supported and valued.
3	Core Values	🤝	Respect	We foster mutual respect, ensuring fairness and dignity in every relationship we build.
4	Core Values	📋	Professional	We uphold high standards of professionalism, ensuring reliable and transparent services.
\.


--
-- Data for Name: about_findus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.about_findus (id, title, description, gmap_link) FROM stdin;
1	Find Us Here	Visit our headquarters in Singapore to learn more about how we can serve your family’s needs.	https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3988.7402083446386!2d103.87653747573844!3d1.3319955986553826!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31da19df4c5e7daf%3A0x4cceada1d07109da!2sMaid%20Search%20Singapore%20Pte%20Ltd!5e0!3m2!1sen!2smy!4v1755750188719!5m2!1sen!2smy
\.


--
-- Data for Name: about_hero; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.about_hero (id, main_heading, subheading, bg_image) FROM stdin;
1	About Us	At Maid Search Singapore Pte Ltd, we are committed to connecting families with trusted and well-trained domestic helpers. Guided by our values of care, respect, and professionalism, we meticulously match each family's unique needs with the right helper, ensuring a harmonious and supportive home environment for everyone.	/images/header7.jpg
\.


--
-- Data for Name: about_mission_vision; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.about_mission_vision (id, type, title, description) FROM stdin;
2	vision	Our Vision	To be Singapore’s most trusted maid agency, recognized for raising industry standards and creating lasting, positive relationships between families and helpers.
1	mission	Our Mission	To provide families with dependable, caring, and well-trained domestic helpers who enrich households with trust, compassion, and efficiency.
\.


--
-- Data for Name: activities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.activities (id, icon, title, created_at) FROM stdin;
1	user-plus	New maid added	2025-09-10 16:08:04.577105
2	edit	Home page updated	2025-09-10 16:08:04.577105
3	cog	System settings updated	2025-09-10 16:08:04.577105
5	home	Home - Reviews page updated	2025-09-10 16:59:25.772786
4	home	Home - Welcome page updated	2025-09-10 16:38:51.379071
6	info-circle	About Us - Mission & Vission page updated	2025-09-10 17:07:17.087578
7	hands-helping	Find Helper - FAQs page updated	2025-09-10 17:10:52.955351
8	shield-alt	Insurance - Insurance Plans page updated	2025-09-11 11:21:21.670995
9	graduation-cap	Training - Hero page updated	2025-09-11 11:23:00.213016
10	cog	Settings - Footer page updated	2025-09-11 11:52:39.698236
11	home	Home - Hero page updated	2025-09-11 11:57:51.459915
12	home	Home - Hero page updated	2025-09-11 12:00:35.754134
13	user-md	Maids - Hero page updated	2025-09-11 12:08:34.226646
14	info-circle	About Us - Hero page updated	2025-09-12 14:55:29.939459
15	hands-helping	Find Helper - Hero page updated	2025-09-12 14:56:36.190064
16	home	Home - Welcome page updated	2025-09-12 18:05:02.914135
17	home	Home - Hero page updated	2025-09-15 16:39:21.039085
18	home	Home - Hero page updated	2025-09-15 16:39:59.129205
19	home	Home - Hero page updated	2025-09-15 16:40:03.311933
20	home	Home - Welcome page updated	2025-09-18 18:43:19.046804
21	home	Home - Hero page updated	2025-09-19 11:05:21.927157
22	cog	Settings - Navbar page updated	2025-09-19 17:12:58.886516
23	cog	Settings - Navbar page updated	2025-09-19 17:14:36.432457
24	cog	Settings - Navbar page updated	2025-09-19 17:16:35.953909
25	cog	Settings - Navbar page updated	2025-09-19 17:37:59.339206
\.


--
-- Data for Name: global_content; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.global_content (id, email, phone, whatsapp_link, facebook_link, copyright, license_no, company_no, emp_reg_no, logo_url, agency_name) FROM stdin;
1	maidsearchsg@gmail.com	+65 9682 5955 (Guo Siling Dior)	https://wa.me/6596825955	https://www.facebook.com/maidsearch	© 2025 Maid Search Singapore Pte Ltd. All Rights Reserved.	L13C8379	201303653G	R1327454	/images/1758274679296-logo.png	Maid Search Singapore Pte Ltd
\.


--
-- Data for Name: helper_choose; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.helper_choose (id, section_title, reason, description, icon) FROM stdin;
1	Why Choose Us	Licensed & MOM-Compliant	Fully registered and compliant with Singapore’s regulations for your peace of mind.	✅
2	-	Curated, Quality Matches	We shortlist helpers based on skills, experience, language, and your unique needs.	⭐
3	-	Support That Cares	From interviews to aftercare, our team is here to make the journey smooth.	🤝
\.


--
-- Data for Name: helper_cta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.helper_cta (id, heading, subheading, button_text, button_link) FROM stdin;
1	Ready to find a helper you can trust?	Start with a quick consultation or browse profiles right away.	Talk To Us	https://wa.me/6596825955
\.


--
-- Data for Name: helper_faq; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.helper_faq (id, question, answer, section_title) FROM stdin;
1	How long does matching usually take	It depends on your requirements and availability of candidates. Many families complete matching within 1–3 weeks.	FAQs
2	Can we interview helpers before deciding?	Yes—via video call or in person. We’ll help schedule and guide the conversation.	\N
3	Do you handle insurance and MOM paperwork?	Absolutely. We cover medical/PAI insurance, Work Permit processing, and pre-deployment steps.	\N
\.


--
-- Data for Name: helper_hero; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.helper_hero (id, main_heading, subheading, bg_image) FROM stdin;
1	Find Your Helper	A smooth, guided process to match your family with a caring, well-trained domestic helper— allowing you to focus on what matters most: your family's well-being.	/images/header6.jpg
\.


--
-- Data for Name: helper_steps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.helper_steps (id, step_title, step_description, icon, step_no, section_title) FROM stdin;
1	Tell Us Your Needs	Share your household requirements, preferences, and schedule.	📝	STEP 1	How It Works
2	Shortlisted Profiles	We curate suitable candidates aligned to your requirements.	🧾	STEP 2	\N
3	Interview & Assess	Meet candidates via video call or in-person sessions.	🎥	STEP 3	\N
4	Paperwork & Training	We handle MOM requirements, insurance, and pre-deployment training.	📄	STEP 4	\N
5	Deployment & Support	Your chosen helper joins your family—we stay available for aftercare.	🏠	STEP 5	\N
\.


--
-- Data for Name: homepage_hero; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.homepage_hero (id, main_heading, subheading, bg_image) FROM stdin;
1	Maid Search Singapore: "We Care"	Care ● Respect ● Professional	/images/home.jpg
\.


--
-- Data for Name: homepage_recognitions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.homepage_recognitions (id, section_title, image_url, caption) FROM stdin;
1	Recognitions	/images/certificate.jpg	Proud recipient of the Top 100 Singapore Excellence Award (2015), a testament to our commitment to professionalism and trusted service.
\.


--
-- Data for Name: homepage_reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.homepage_reviews (id, section_title, reviewer_name, review_text) FROM stdin;
3	\N	Yasmine	Professional agency with great follow-up and friendly staff.
2	\N	Michel Sim	Very satisfied especially with quick service and support.
1	Our Reviews	Medina	Highly recommend for affordable, outstanding service.
\.


--
-- Data for Name: homepage_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.homepage_services (id, section_title, maid_type, description) FROM stdin;
2	Services	Myanmarese Maids	Known for their hardworking nature and caring spirit, our Myanmar maids adapt quickly to family needs. Trained to meet local household standards, they bring reliable and efficient assistance to everyday living.
3	\N	Indonesian Maids	Known for their friendly personalities and strong skills in childcare, elderly care, and housekeeping, our Indonesian maids bring both care and efficiency to your home. Their nurturing nature ensures your loved ones are well looked after, while keeping your household neat and orderly.
\.


--
-- Data for Name: homepage_welcome; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.homepage_welcome (id, description) FROM stdin;
1	Maid Search Singapore Pte Ltd is a licensed employment agency since 2013 dedicated to helping families find reliable, caring, and well-trained helpers. With years of experience and a strong commitment to excellence, we provide personalized matching services that meet every household’s unique needs. 
\.


--
-- Data for Name: insurance_hero; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.insurance_hero (id, main_heading, subheading, bg_image) FROM stdin;
1	Insurance Requirements for Foreign Domestic Worker (FDWs)	Your helper’s well-being is important. With proper medical and accident insurance, you can be assured that she is covered in times of need, giving both your family and your helper the confidence to focus on what truly matters—creating a safe and harmonious home. 	/images/header5.jpg
\.


--
-- Data for Name: insurance_plans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.insurance_plans (id, plan_title, plan_description, icon) FROM stdin;
2		Minimum Annual Limit: S$60,000	
3		Enhanced Requirements:	
4		Co-payment: 75% insurer, 25% employer above S$15,000	
5		Standardised exclusion clauses	
6		Age-differentiated premiums (≤50 & >50)	
7		Direct payment to hospitals	
8	Personal Accident Insurance (PAI)	Covers permanent disability & death from accidents	🛡️
9		Minimum Sum Assured: S$60,000 per year	
10		Must comply with Employment of Foreign Manpower Regulations	
1	Medical Insurance (MI)	Coverage: Inpatient care & day surgery	🏥
\.


--
-- Data for Name: insurance_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.insurance_table (id, feature, standard, enhanced) FROM stdin;
1	Feature	Standard MI	Enhanced MI
2	Annual Limit	S$60,000	S$60,000 (direct payment & co-payment)
3	Co-payment	N/A	75% insurer / 25% employer above S$15,000
4	Exclusion Clauses	Varies by insurer	Standardised by MOM
5	Age Bands	N/A	≤50 years & >50 years
\.


--
-- Data for Name: maid_faq; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.maid_faq (id, section_title, question, answer) FROM stdin;
1	Frequently Asked Questions	Who can apply?	Myanmarese and Indonesian helpers aged 23–50 with a valid passport and good health are welcome. If you are outside this range, contact us and we will advise.
2	\N	Do you provide training?	Yes. We offer pre-employment training focusing on safety, hygiene, childcare/eldercare, and basic household management.
3	\N	Is accommodation provided?	Live-in arrangements are standard in Singapore. Families provide accommodation and meals as part of employment.
4	\N	What support do I get after placement	We stay in touch to ensure you are treated fairly and help with any documentation or mediation if needed.
\.


--
-- Data for Name: maid_gallery; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.maid_gallery (id, section_title, description) FROM stdin;
1	Gallery Highlight	Discover moments that reflect our dedication and values. From training sessions and family matches to agency events, our gallery showcases the people and stories behind 
2		Maid Search Singapore Pte Ltd
3		Each highlight captures our commitment to professionalism, care, and building trusted relationships between  families and helpers.
\.


--
-- Data for Name: maid_gallery_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.maid_gallery_images (id, alt, image_url) FROM stdin;
1	Image 1	/images/gallery1.jpg
2	Image 2	/images/gallery2.jpg
3	Image 3	/images/gallery3.jpg
4	Image 4	/images/gallery4.jpg
5	Image 5	/images/gallery5.jpg
6	Image 6	/images/gallery6.jpg
7	Image 7	/images/gallery7.jpg
\.


--
-- Data for Name: maid_hero; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.maid_hero (id, main_heading, subheading, bg_image) FROM stdin;
1	Maids	Searching for a friendly family to work for? Singapore provides a great opportunity with supportive employers and a culture you can feel at home with.	/images/header2.jpg
\.


--
-- Data for Name: maid_nationalities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.maid_nationalities (id, flag, title, description) FROM stdin;
1	🇲🇲	Myanmarese Maids	Known for adaptability and dedication. Many are quick learners and adjust well to Singaporean households.
2	🇮🇩	Indonesian Maids	Experienced, caring, and often able to communicate in Malay. Trusted for childcare and elderly support.
\.


--
-- Data for Name: maid_nationality_points; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.maid_nationality_points (id, nationality_id, point) FROM stdin;
1	1	Strong work ethic and patience
2	1	Willing to learn languages and routines
3	1	Suitable for childcare and general housework
4	2	Warm personality and reliability
5	2	Familiar with Southeast Asian cuisine
6	2	Strong experience in caregiving
\.


--
-- Data for Name: maid_reasons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.maid_reasons (id, category, icon, title, description, category_desc) FROM stdin;
2	Why Work in Singapore?	🏡	Safe & Supportive	Live with caring families in a safe city.	
3	Why Work in Singapore?	📚	Learn New Skills	Childcare, eldercare, cooking, and more.	
4	Why Work in Singapore?	🌏	Welcoming Community	Meet friends from many cultures.	
6	Why Work With Us?	🤝	Fair & Respectful	We advocate for your rights and wellbeing.	
7	Why Work With Us?	🎓	Pre-Employment Training	Get prepared for success before your first day.	
8	Why Work With Us?	🛡️	Documents & Insurance	We handle the paperwork so you don’t have to.	
1	Why Work in Singapore?	💰	Competitive Salary	Earn more than typical local opportunities.	Helpers in Singapore benefit from reliable employers, strong protections, and a multicultural community.
5	Why Work With Us?	✅	Trusted Placements	Proven track record with caring employers.	A trusted agency that supports you before and after placement.
\.


--
-- Data for Name: maid_steps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.maid_steps (id, section_title, step_number, step_title, step_description) FROM stdin;
1	How It Works	Step 1	Say Hello on WhatsApp	Message us at +65 9682 5955.
2	\N	Step 2	Short Interview	We understand your skills and preferences.
3	\N	Step 3	Training & Documents	We guide you through every requirement.
4	\N	Step 4	Placement	Join a respectful family in Singapore.
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, user_id, expires_at) FROM stdin;
vjo6nk7ezrcku3uvi6rk4ggbehe4yyx5cypvlpz4	350-51a6645486965064567966725729	2025-10-11 14:27:01.314+08
twghppiwan4j6niqjpr6bp4m3un6oxfkvf4ukiqt	350-51a6645486965064567966725729	2025-10-11 14:27:20.912+08
hnj5cvyhge4yqvwyl5s2ld6wc7qpvfngaxqmri4s	350-51a6645486965064567966725729	2025-10-11 14:27:59.181+08
oqulb5pbr2ucfl5qkdxvelk4zjccwpggbthm6dpd	350-51a6645486965064567966725729	2025-10-15 16:36:00.959+08
6ievxnpl3iftjrsscpwja4e2emobpsop4pftqx3t	350-51a6645486965064567966725729	2025-10-18 00:03:06.972+08
vxnr46nsjdj336whppakn74knbmsleweqg7acw5d	350-51a6645486965064567966725729	2025-10-19 11:03:01.606+08
kyotbxaqt5hjsxwdvdtu56o7mvti6culh7dsxewe	350-51a6645486965064567966725729	2025-10-19 14:52:48.941+08
k5jtr6ruyojhf5qeuvmmnqxajszffahzdlx5ygik	350-51a6645486965064567966725729	2025-10-26 11:26:56.227+08
\.


--
-- Data for Name: training_hero; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.training_hero (id, main_heading, subheading, bg_image) FROM stdin;
1	Pre-Employment Training	At Maid Search Singapore, we believe proper training builds confidence, skills, and trust. Our Pre-Employment Training programs prepare helpers with essential knowledge in infant care, elderly care, and housekeeping —ensuring they’re ready to provide safe, reliable, and professional support for your home.	/images/header4.jpg
\.


--
-- Data for Name: training_plans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.training_plans (id, training_title, training_description, section_title) FROM stdin;
1	Comprehensive Courses	Designed for real-world caregiving skills.	Why Choose Our Training
2	Experienced Trainers	Guidance from professionals in caregiving.	
3	Confidence & Trust	Peace of mind for both helpers & families.	
\.


--
-- Data for Name: trainings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trainings (id, section_title, icon, title, description) FROM stdin;
2	\N	\N	\N	✔ Preparing & sterilizing milk bottles
3	\N	\N	\N	✔ Safe feeding practices & hygiene
4	\N	\N	\N	✔ Recognizing signs of discomfort
5	\N	\N	\N	✔ Emotional bonding & comfort
7	\N	\N	\N	✔ Administering medication under guidance
8	\N	\N	\N	✔ Companionship & emotional support
9	\N	\N	\N	✔ Emergency response training
10	\N	\N	\N	✔ Respectful communication
12	\N	\N	\N	✔ Laundry & ironing care
13	\N	\N	\N	✔ Safe use of cleaning equipment
14	\N	\N	\N	✔ Meal preparation & cooking basics
15	\N	\N	\N	✔ Maintaining a hygienic home
1	Provided Trainings	👶	Infant Care	✔ Gentle handling & bathing of babies
6	\N	👵	Elderly Care	✔ Preparing & sterilizing milk bottles
11	\N	🏡	Housekeeping	✔ Safe feeding practices & hygiene
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, password_hash, created_at, last_login, is_active) FROM stdin;
1	admin	$2b$10$k0OHjl9F5FPrUB2OXg8k7ukURgiDfuEg53UHokOek.55IvB95LPee	2025-08-27 11:59:26.20967	\N	t
350-51a6645486965064567966725729	adminX	$argon2id$v=19$m=19456,t=2,p=1$ErSsXVFZDxb/xv1+oEY+fg$2DYpZh0gI/FK49lrAhW5Qa+I+GSued0ulsu+RfknlO0	2025-09-11 14:12:27.013649	\N	t
\.


--
-- Name: about_corevalues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.about_corevalues_id_seq', 4, true);


--
-- Name: about_findus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.about_findus_id_seq', 1, true);


--
-- Name: about_hero_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.about_hero_id_seq', 1, true);


--
-- Name: about_mission_vision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.about_mission_vision_id_seq', 2, true);


--
-- Name: activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.activities_id_seq', 25, true);


--
-- Name: global_content_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.global_content_id_seq', 1, true);


--
-- Name: helper_choose_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.helper_choose_id_seq', 2, true);


--
-- Name: helper_cta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.helper_cta_id_seq', 1, true);


--
-- Name: helper_faq_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.helper_faq_id_seq', 3, true);


--
-- Name: helper_hero_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.helper_hero_id_seq', 1, true);


--
-- Name: helper_steps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.helper_steps_id_seq', 5, true);


--
-- Name: homepage_hero_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.homepage_hero_id_seq', 1, true);


--
-- Name: homepage_recognitions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.homepage_recognitions_id_seq', 1, true);


--
-- Name: homepage_reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.homepage_reviews_id_seq', 3, true);


--
-- Name: homepage_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.homepage_services_id_seq', 3, true);


--
-- Name: homepage_welcome_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.homepage_welcome_id_seq', 1, true);


--
-- Name: insurance_hero_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.insurance_hero_id_seq', 1, true);


--
-- Name: insurance_plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.insurance_plans_id_seq', 10, true);


--
-- Name: insurance_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.insurance_table_id_seq', 5, true);


--
-- Name: maid_faq_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.maid_faq_id_seq', 4, true);


--
-- Name: maid_gallery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.maid_gallery_id_seq', 3, true);


--
-- Name: maid_gallery_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.maid_gallery_images_id_seq', 7, true);


--
-- Name: maid_hero_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.maid_hero_id_seq', 1, true);


--
-- Name: maid_nationalities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.maid_nationalities_id_seq', 2, true);


--
-- Name: maid_nationality_points_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.maid_nationality_points_id_seq', 6, true);


--
-- Name: maid_reasons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.maid_reasons_id_seq', 9, true);


--
-- Name: maid_steps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.maid_steps_id_seq', 5, true);


--
-- Name: training_hero_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.training_hero_id_seq', 5, true);


--
-- Name: training_plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.training_plans_id_seq', 3, true);


--
-- Name: trainings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trainings_id_seq', 15, true);


--
-- Name: about_corevalues about_corevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.about_corevalues
    ADD CONSTRAINT about_corevalues_pkey PRIMARY KEY (id);


--
-- Name: about_findus about_findus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.about_findus
    ADD CONSTRAINT about_findus_pkey PRIMARY KEY (id);


--
-- Name: about_hero about_hero_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.about_hero
    ADD CONSTRAINT about_hero_pkey PRIMARY KEY (id);


--
-- Name: about_mission_vision about_mission_vision_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.about_mission_vision
    ADD CONSTRAINT about_mission_vision_pkey PRIMARY KEY (id);


--
-- Name: activities activities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);


--
-- Name: global_content global_content_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.global_content
    ADD CONSTRAINT global_content_pkey PRIMARY KEY (id);


--
-- Name: helper_choose helper_choose_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.helper_choose
    ADD CONSTRAINT helper_choose_pkey PRIMARY KEY (id);


--
-- Name: helper_cta helper_cta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.helper_cta
    ADD CONSTRAINT helper_cta_pkey PRIMARY KEY (id);


--
-- Name: helper_faq helper_faq_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.helper_faq
    ADD CONSTRAINT helper_faq_pkey PRIMARY KEY (id);


--
-- Name: helper_hero helper_hero_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.helper_hero
    ADD CONSTRAINT helper_hero_pkey PRIMARY KEY (id);


--
-- Name: helper_steps helper_steps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.helper_steps
    ADD CONSTRAINT helper_steps_pkey PRIMARY KEY (id);


--
-- Name: homepage_hero homepage_hero_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homepage_hero
    ADD CONSTRAINT homepage_hero_pkey PRIMARY KEY (id);


--
-- Name: homepage_recognitions homepage_recognitions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homepage_recognitions
    ADD CONSTRAINT homepage_recognitions_pkey PRIMARY KEY (id);


--
-- Name: homepage_reviews homepage_reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homepage_reviews
    ADD CONSTRAINT homepage_reviews_pkey PRIMARY KEY (id);


--
-- Name: homepage_services homepage_services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homepage_services
    ADD CONSTRAINT homepage_services_pkey PRIMARY KEY (id);


--
-- Name: homepage_welcome homepage_welcome_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homepage_welcome
    ADD CONSTRAINT homepage_welcome_pkey PRIMARY KEY (id);


--
-- Name: insurance_hero insurance_hero_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insurance_hero
    ADD CONSTRAINT insurance_hero_pkey PRIMARY KEY (id);


--
-- Name: insurance_plans insurance_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insurance_plans
    ADD CONSTRAINT insurance_plans_pkey PRIMARY KEY (id);


--
-- Name: insurance_table insurance_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insurance_table
    ADD CONSTRAINT insurance_table_pkey PRIMARY KEY (id);


--
-- Name: maid_faq maid_faq_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maid_faq
    ADD CONSTRAINT maid_faq_pkey PRIMARY KEY (id);


--
-- Name: maid_gallery_images maid_gallery_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maid_gallery_images
    ADD CONSTRAINT maid_gallery_images_pkey PRIMARY KEY (id);


--
-- Name: maid_gallery maid_gallery_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maid_gallery
    ADD CONSTRAINT maid_gallery_pkey PRIMARY KEY (id);


--
-- Name: maid_hero maid_hero_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maid_hero
    ADD CONSTRAINT maid_hero_pkey PRIMARY KEY (id);


--
-- Name: maid_nationalities maid_nationalities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maid_nationalities
    ADD CONSTRAINT maid_nationalities_pkey PRIMARY KEY (id);


--
-- Name: maid_nationality_points maid_nationality_points_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maid_nationality_points
    ADD CONSTRAINT maid_nationality_points_pkey PRIMARY KEY (id);


--
-- Name: maid_reasons maid_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maid_reasons
    ADD CONSTRAINT maid_reasons_pkey PRIMARY KEY (id);


--
-- Name: maid_steps maid_steps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maid_steps
    ADD CONSTRAINT maid_steps_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: training_hero training_hero_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.training_hero
    ADD CONSTRAINT training_hero_pkey PRIMARY KEY (id);


--
-- Name: training_plans training_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.training_plans
    ADD CONSTRAINT training_plans_pkey PRIMARY KEY (id);


--
-- Name: trainings trainings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainings
    ADD CONSTRAINT trainings_pkey PRIMARY KEY (id);


--
-- Name: users user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: users user_username_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_username_unique UNIQUE (username);


--
-- Name: maid_nationality_points maid_nationality_points_nationality_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maid_nationality_points
    ADD CONSTRAINT maid_nationality_points_nationality_id_fkey FOREIGN KEY (nationality_id) REFERENCES public.maid_nationalities(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

