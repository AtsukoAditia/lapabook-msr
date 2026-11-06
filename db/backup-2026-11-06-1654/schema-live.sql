--
-- PostgreSQL database dump
--

\restrict CMJe3kxLhFA4v95HOlLWPiou7zcNIncRYpASOZCMtKg2uJfysSxMK7cZlcCJBfa

-- Dumped from database version 16.14 (Debian 16.14-1.pgdg13+1)
-- Dumped by pg_dump version 16.14 (Debian 16.14-1.pgdg13+1)

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
-- Name: btree_gist; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS btree_gist WITH SCHEMA public;


--
-- Name: EXTENSION btree_gist; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION btree_gist IS 'support for indexing common datatypes in GiST';


--
-- Name: citext; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


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
-- Name: achievements; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.achievements (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    code character varying(50) NOT NULL,
    name character varying(100) NOT NULL,
    name_en character varying(100),
    description text,
    description_en text,
    category character varying(30) NOT NULL,
    icon character varying(50),
    points_reward integer DEFAULT 0,
    badge_tier character varying(20),
    criteria jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.achievements OWNER TO brodit;

--
-- Name: admins; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.admins (
    id character varying(50) NOT NULL,
    username text NOT NULL,
    name text NOT NULL,
    email public.citext NOT NULL,
    password_hash text NOT NULL,
    role text NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    last_login_at timestamp with time zone,
    CONSTRAINT admins_role_check CHECK ((role = ANY (ARRAY['super_admin'::text, 'admin'::text, 'staff'::text, 'owner'::text])))
);


ALTER TABLE public.admins OWNER TO brodit;

--
-- Name: areas; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.areas (
    id character varying(50) NOT NULL,
    province character varying(100) NOT NULL,
    city character varying(100) NOT NULL,
    district character varying(100) NOT NULL,
    village character varying(100) DEFAULT ''::character varying NOT NULL,
    slug character varying(150) NOT NULL,
    label character varying(500) DEFAULT ''::character varying NOT NULL,
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.areas OWNER TO brodit;

--
-- Name: audit_logs; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.audit_logs (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "timestamp" timestamp with time zone DEFAULT now() NOT NULL,
    action text NOT NULL,
    target_type text NOT NULL,
    target_id text NOT NULL,
    actor_type text NOT NULL,
    actor_id text,
    details text DEFAULT ''::text NOT NULL,
    previous_value text,
    new_value text,
    CONSTRAINT audit_logs_actor_type_check CHECK ((actor_type = ANY (ARRAY['customer'::text, 'admin'::text, 'system'::text])))
);


ALTER TABLE public.audit_logs OWNER TO brodit;

--
-- Name: blocked_slots; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.blocked_slots (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    court_id character varying(50) NOT NULL,
    date date NOT NULL,
    start_time time without time zone NOT NULL,
    end_time time without time zone NOT NULL,
    reason text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT blocked_slots_check CHECK ((end_time > start_time))
);


ALTER TABLE public.blocked_slots OWNER TO brodit;

--
-- Name: bookings; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.bookings (
    id character varying(50) NOT NULL,
    booking_code text NOT NULL,
    customer_name text NOT NULL,
    customer_phone text NOT NULL,
    customer_email public.citext,
    user_id uuid,
    venue_id character varying(50) NOT NULL,
    court_id character varying(50) NOT NULL,
    sport_id character varying(50) NOT NULL,
    booking_date date NOT NULL,
    start_time time without time zone NOT NULL,
    end_time time without time zone NOT NULL,
    duration_minutes integer NOT NULL,
    total_price integer NOT NULL,
    booking_status text NOT NULL,
    payment_status text NOT NULL,
    expires_at timestamp with time zone,
    payment_proof_url text,
    payment_submitted_at timestamp with time zone,
    payment_verified_at timestamp with time zone,
    payment_rejected_at timestamp with time zone,
    payment_rejection_reason text,
    verified_by_admin_id character varying(50),
    notes text,
    points_awarded_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    commission_amount integer DEFAULT 0 NOT NULL,
    owner_payout integer DEFAULT 0 NOT NULL,
    payment_method text DEFAULT 'manual'::text,
    midtrans_order_id text,
    midtrans_transaction_id text,
    recurring_group_id text,
    recurrence_type text,
    recurrence_end_date date,
    voucher_code character varying,
    down_payment_amount integer DEFAULT 0 NOT NULL,
    paid_amount integer DEFAULT 0 NOT NULL,
    rescheduled_from jsonb,
    reschedule_count integer DEFAULT 0 NOT NULL,
    refund_reason text,
    refund_requested_at timestamp with time zone,
    CONSTRAINT bookings_booking_status_check CHECK ((booking_status = ANY (ARRAY['pending'::text, 'waiting_payment'::text, 'waiting_verification'::text, 'paid'::text, 'confirmed'::text, 'rejected'::text, 'expired'::text, 'cancelled'::text, 'completed'::text, 'no_show'::text]))),
    CONSTRAINT bookings_check CHECK ((end_time > start_time)),
    CONSTRAINT bookings_duration_minutes_check CHECK ((duration_minutes > 0)),
    CONSTRAINT bookings_payment_method_check CHECK ((payment_method = ANY (ARRAY['manual'::text, 'midtrans'::text]))),
    CONSTRAINT bookings_payment_status_check CHECK ((payment_status = ANY (ARRAY['unpaid'::text, 'waiting_confirmation'::text, 'dp_paid'::text, 'paid'::text, 'rejected'::text, 'refunded'::text, 'refund_requested'::text]))),
    CONSTRAINT bookings_recurrence_type_check CHECK ((recurrence_type = ANY (ARRAY['weekly'::text, 'biweekly'::text, 'monthly'::text]))),
    CONSTRAINT bookings_total_price_check CHECK ((total_price >= 0))
);


ALTER TABLE public.bookings OWNER TO brodit;

--
-- Name: cms_content; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.cms_content (
    key text NOT NULL,
    title text DEFAULT ''::text NOT NULL,
    body text DEFAULT ''::text NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_by text
);


ALTER TABLE public.cms_content OWNER TO brodit;

--
-- Name: court_photos; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.court_photos (
    id text NOT NULL,
    court_id text NOT NULL,
    url text NOT NULL,
    caption text DEFAULT ''::text,
    sort_order integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.court_photos OWNER TO brodit;

--
-- Name: courts; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.courts (
    id character varying(50) NOT NULL,
    venue_id character varying(50) NOT NULL,
    sport_id character varying(50) NOT NULL,
    name text NOT NULL,
    slug text NOT NULL,
    surface_type text DEFAULT ''::text NOT NULL,
    indoor_type text NOT NULL,
    capacity integer DEFAULT 0 NOT NULL,
    base_price integer DEFAULT 0 NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT courts_base_price_check CHECK ((base_price >= 0)),
    CONSTRAINT courts_indoor_type_check CHECK ((indoor_type = ANY (ARRAY['indoor'::text, 'outdoor'::text, 'semi_outdoor'::text])))
);


ALTER TABLE public.courts OWNER TO brodit;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.customers (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    email public.citext,
    phone text NOT NULL,
    password_hash text NOT NULL,
    avatar text,
    is_verified boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    loyalty_points integer DEFAULT 0 NOT NULL,
    total_spent integer DEFAULT 0 NOT NULL,
    member_since timestamp with time zone DEFAULT now() NOT NULL,
    last_login_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT customers_loyalty_points_check CHECK ((loyalty_points >= 0)),
    CONSTRAINT customers_total_spent_check CHECK ((total_spent >= 0))
);


ALTER TABLE public.customers OWNER TO brodit;

--
-- Name: group_booking_participants; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.group_booking_participants (
    id character varying(50) NOT NULL,
    group_booking_id character varying(50) NOT NULL,
    customer_id uuid NOT NULL,
    status character varying(20) DEFAULT 'invited'::character varying NOT NULL,
    availability_json jsonb DEFAULT '[]'::jsonb,
    vote_slot_id character varying(50),
    split_amount integer DEFAULT 0,
    is_organizer boolean DEFAULT false,
    joined_at timestamp with time zone DEFAULT now(),
    confirmed_at timestamp with time zone,
    CONSTRAINT group_booking_participants_status_check CHECK (((status)::text = ANY ((ARRAY['invited'::character varying, 'accepted'::character varying, 'declined'::character varying, 'confirmed'::character varying, 'no_show'::character varying])::text[])))
);


ALTER TABLE public.group_booking_participants OWNER TO brodit;

--
-- Name: group_booking_time_slots; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.group_booking_time_slots (
    id character varying(50) NOT NULL,
    group_booking_id character varying(50) NOT NULL,
    slot_date date NOT NULL,
    start_time time without time zone NOT NULL,
    end_time time without time zone NOT NULL,
    vote_count integer DEFAULT 0,
    is_winner boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.group_booking_time_slots OWNER TO brodit;

--
-- Name: group_bookings; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.group_bookings (
    id character varying(50) NOT NULL,
    organizer_id uuid NOT NULL,
    venue_id character varying(50) NOT NULL,
    court_id character varying(50) NOT NULL,
    sport_id character varying(50) NOT NULL,
    title text NOT NULL,
    description text DEFAULT ''::text,
    booking_date date,
    start_time time without time zone,
    end_time time without time zone,
    duration_minutes integer DEFAULT 60,
    min_participants integer DEFAULT 4 NOT NULL,
    max_participants integer DEFAULT 10 NOT NULL,
    price_per_slot integer DEFAULT 0,
    status character varying(30) DEFAULT 'draft'::character varying NOT NULL,
    deadline timestamp with time zone,
    final_booking_id character varying(50),
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    CONSTRAINT group_bookings_status_check CHECK (((status)::text = ANY ((ARRAY['draft'::character varying, 'voting'::character varying, 'confirmed'::character varying, 'cancelled'::character varying, 'expired'::character varying])::text[])))
);


ALTER TABLE public.group_bookings OWNER TO brodit;

--
-- Name: holidays; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.holidays (
    id character varying(50) NOT NULL,
    date date NOT NULL,
    name text NOT NULL,
    type text NOT NULL,
    description text DEFAULT ''::text,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT holidays_type_check CHECK ((type = ANY (ARRAY['national'::text, 'religious'::text, 'joint_leave'::text])))
);


ALTER TABLE public.holidays OWNER TO brodit;

--
-- Name: loyalty_tiers; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.loyalty_tiers (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying(50) NOT NULL,
    min_points integer NOT NULL,
    multiplier numeric(3,2) DEFAULT 1.00 NOT NULL,
    benefits jsonb DEFAULT '{}'::jsonb,
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.loyalty_tiers OWNER TO brodit;

--
-- Name: loyalty_transactions; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.loyalty_transactions (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    customer_id uuid NOT NULL,
    booking_id character varying(50),
    booking_code text,
    type text NOT NULL,
    points integer NOT NULL,
    description text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    expires_at timestamp with time zone,
    CONSTRAINT loyalty_transactions_type_check CHECK ((type = ANY (ARRAY['earned'::text, 'redeemed'::text, 'bonus'::text, 'expired'::text, 'adjusted'::text])))
);


ALTER TABLE public.loyalty_transactions OWNER TO brodit;

--
-- Name: notification_logs; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.notification_logs (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    type text NOT NULL,
    channel text NOT NULL,
    recipient text NOT NULL,
    subject text,
    message text NOT NULL,
    status text NOT NULL,
    booking_id character varying(50),
    booking_code text,
    error_message text,
    sent_at timestamp with time zone,
    read_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT notification_logs_status_check CHECK ((status = ANY (ARRAY['pending'::text, 'sent'::text, 'failed'::text, 'read'::text])))
);


ALTER TABLE public.notification_logs OWNER TO brodit;

--
-- Name: notification_preferences; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.notification_preferences (
    id text NOT NULL,
    customer_id uuid NOT NULL,
    fcm_token text DEFAULT ''::text,
    push_enabled boolean DEFAULT false NOT NULL,
    email_enabled boolean DEFAULT true NOT NULL,
    whatsapp_enabled boolean DEFAULT false NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.notification_preferences OWNER TO brodit;

--
-- Name: operating_hours; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.operating_hours (
    id character varying(50) NOT NULL,
    court_id character varying(50) NOT NULL,
    day_of_week integer NOT NULL,
    open_time time without time zone NOT NULL,
    close_time time without time zone NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT operating_hours_day_of_week_check CHECK (((day_of_week >= 0) AND (day_of_week <= 6)))
);


ALTER TABLE public.operating_hours OWNER TO brodit;

--
-- Name: payment_methods; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.payment_methods (
    id character varying(50) NOT NULL,
    name text NOT NULL,
    label text NOT NULL,
    type text NOT NULL,
    account_name text DEFAULT ''::text NOT NULL,
    account_number text,
    bank_name text,
    provider text DEFAULT ''::text NOT NULL,
    details text DEFAULT ''::text NOT NULL,
    instructions text DEFAULT ''::text NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT payment_methods_type_check CHECK ((type = ANY (ARRAY['bank_transfer'::text, 'e_wallet'::text, 'qris'::text, 'cash'::text])))
);


ALTER TABLE public.payment_methods OWNER TO brodit;

--
-- Name: payouts; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.payouts (
    id character varying(50) NOT NULL,
    owner_id character varying(50) NOT NULL,
    venue_id character varying(50),
    amount integer NOT NULL,
    status text DEFAULT 'requested'::text NOT NULL,
    note text DEFAULT ''::text NOT NULL,
    requested_at timestamp with time zone DEFAULT now() NOT NULL,
    decided_at timestamp with time zone,
    decided_by text,
    CONSTRAINT payouts_amount_check CHECK ((amount > 0)),
    CONSTRAINT payouts_status_check CHECK ((status = ANY (ARRAY['requested'::text, 'approved'::text, 'rejected'::text, 'paid'::text])))
);


ALTER TABLE public.payouts OWNER TO brodit;

--
-- Name: pickup_game_messages; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.pickup_game_messages (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    pickup_game_id uuid,
    customer_id uuid,
    message text NOT NULL,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.pickup_game_messages OWNER TO brodit;

--
-- Name: pickup_game_participants; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.pickup_game_participants (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    pickup_game_id uuid,
    customer_id uuid,
    split_amount numeric(12,2),
    is_host boolean DEFAULT false,
    joined_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.pickup_game_participants OWNER TO brodit;

--
-- Name: pickup_games; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.pickup_games (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    court_id character varying(50),
    host_customer_id uuid,
    venue_id character varying(50),
    title character varying(255) NOT NULL,
    sport_type character varying(50) NOT NULL,
    scheduled_at timestamp with time zone NOT NULL,
    duration_minutes integer DEFAULT 60 NOT NULL,
    max_players integer NOT NULL,
    current_players integer DEFAULT 1 NOT NULL,
    price_per_person numeric(12,2) NOT NULL,
    total_price numeric(12,2) NOT NULL,
    status character varying(20) DEFAULT 'open'::character varying NOT NULL,
    description text,
    skill_level character varying(20) DEFAULT 'all'::character varying,
    is_recurring boolean DEFAULT false,
    recurring_pattern character varying(20),
    recurring_until date,
    location_name character varying(255),
    latitude numeric(10,7),
    longitude numeric(10,7),
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.pickup_games OWNER TO brodit;

--
-- Name: platform_settings; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.platform_settings (
    id integer NOT NULL,
    key character varying(100) NOT NULL,
    value jsonb DEFAULT '{}'::jsonb NOT NULL,
    updated_by character varying(100),
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.platform_settings OWNER TO brodit;

--
-- Name: platform_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: brodit
--

CREATE SEQUENCE public.platform_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.platform_settings_id_seq OWNER TO brodit;

--
-- Name: platform_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brodit
--

ALTER SEQUENCE public.platform_settings_id_seq OWNED BY public.platform_settings.id;


--
-- Name: player_achievements; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.player_achievements (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    customer_id uuid,
    achievement_id uuid,
    progress_current integer DEFAULT 0,
    progress_target integer NOT NULL,
    is_unlocked boolean DEFAULT false,
    unlocked_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.player_achievements OWNER TO brodit;

--
-- Name: player_streaks; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.player_streaks (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    customer_id uuid,
    streak_type character varying(30) NOT NULL,
    current_streak integer DEFAULT 0,
    longest_streak integer DEFAULT 0,
    last_activity_at timestamp with time zone,
    streak_data jsonb DEFAULT '{}'::jsonb,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.player_streaks OWNER TO brodit;

--
-- Name: pricing_rules; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.pricing_rules (
    id character varying(50) NOT NULL,
    court_id character varying(50) NOT NULL,
    day_type text NOT NULL,
    start_time time without time zone NOT NULL,
    end_time time without time zone NOT NULL,
    price_per_hour integer NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT pricing_rules_check CHECK ((end_time > start_time)),
    CONSTRAINT pricing_rules_day_type_check CHECK ((day_type = ANY (ARRAY['weekday'::text, 'weekend'::text, 'holiday'::text, 'all'::text]))),
    CONSTRAINT pricing_rules_price_per_hour_check CHECK ((price_per_hour >= 0))
);


ALTER TABLE public.pricing_rules OWNER TO brodit;

--
-- Name: referrals; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.referrals (
    id character varying(50) NOT NULL,
    referrer_id uuid NOT NULL,
    referee_id uuid,
    referral_code character varying(20) NOT NULL,
    status text DEFAULT 'pending'::text NOT NULL,
    points_awarded integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    completed_at timestamp with time zone,
    CONSTRAINT referrals_status_check CHECK ((status = ANY (ARRAY['pending'::text, 'completed'::text, 'expired'::text])))
);


ALTER TABLE public.referrals OWNER TO brodit;

--
-- Name: review_photos; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.review_photos (
    id character varying(50) NOT NULL,
    review_id character varying(50) NOT NULL,
    photo_url text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.review_photos OWNER TO brodit;

--
-- Name: reviews; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.reviews (
    id character varying(50) NOT NULL,
    booking_id character varying(50) NOT NULL,
    customer_id uuid NOT NULL,
    venue_id character varying(50) NOT NULL,
    court_id character varying(50),
    rating integer NOT NULL,
    comment text DEFAULT ''::text NOT NULL,
    is_visible boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT reviews_rating_check CHECK (((rating >= 1) AND (rating <= 5)))
);


ALTER TABLE public.reviews OWNER TO brodit;

--
-- Name: reward_redemptions; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.reward_redemptions (
    id character varying(50) NOT NULL,
    customer_id uuid NOT NULL,
    reward_id character varying(50) NOT NULL,
    reward_name text NOT NULL,
    points_used integer NOT NULL,
    booking_id character varying(50),
    status text DEFAULT 'pending'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    used_at timestamp with time zone,
    CONSTRAINT reward_redemptions_points_used_check CHECK ((points_used > 0)),
    CONSTRAINT reward_redemptions_status_check CHECK ((status = ANY (ARRAY['pending'::text, 'applied'::text, 'expired'::text])))
);


ALTER TABLE public.reward_redemptions OWNER TO brodit;

--
-- Name: rewards; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.rewards (
    id character varying(50) NOT NULL,
    name text NOT NULL,
    description text DEFAULT ''::text NOT NULL,
    type text NOT NULL,
    points_cost integer NOT NULL,
    value integer NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT rewards_points_cost_check CHECK ((points_cost > 0)),
    CONSTRAINT rewards_type_check CHECK ((type = ANY (ARRAY['discount_percentage'::text, 'discount_amount'::text, 'free_hour'::text, 'free_session'::text]))),
    CONSTRAINT rewards_value_check CHECK ((value > 0))
);


ALTER TABLE public.rewards OWNER TO brodit;

--
-- Name: sports; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.sports (
    id character varying(50) NOT NULL,
    name text NOT NULL,
    slug text NOT NULL,
    icon text DEFAULT ''::text NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.sports OWNER TO brodit;

--
-- Name: team_wallet_deposits; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.team_wallet_deposits (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    wallet_id uuid,
    from_customer_id uuid,
    amount numeric(12,2) NOT NULL,
    payment_method character varying(50),
    payment_proof_url text,
    status character varying(20) DEFAULT 'pending'::character varying NOT NULL,
    notes text,
    created_at timestamp with time zone DEFAULT now(),
    confirmed_at timestamp with time zone
);


ALTER TABLE public.team_wallet_deposits OWNER TO brodit;

--
-- Name: team_wallet_members; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.team_wallet_members (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    wallet_id uuid,
    customer_id uuid,
    role character varying(20) DEFAULT 'member'::character varying NOT NULL,
    balance numeric(12,2) DEFAULT 0 NOT NULL,
    total_contributed numeric(12,2) DEFAULT 0 NOT NULL,
    joined_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.team_wallet_members OWNER TO brodit;

--
-- Name: team_wallet_split_members; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.team_wallet_split_members (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    split_id uuid,
    customer_id uuid,
    amount numeric(12,2) NOT NULL,
    status character varying(20) DEFAULT 'pending'::character varying,
    paid_at timestamp with time zone
);


ALTER TABLE public.team_wallet_split_members OWNER TO brodit;

--
-- Name: team_wallet_splits; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.team_wallet_splits (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    wallet_id uuid,
    booking_id character varying(50),
    total_amount numeric(12,2) NOT NULL,
    split_type character varying(20) DEFAULT 'equal'::character varying,
    status character varying(20) DEFAULT 'pending'::character varying,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.team_wallet_splits OWNER TO brodit;

--
-- Name: team_wallet_transactions; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.team_wallet_transactions (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    wallet_id uuid,
    type character varying(30) NOT NULL,
    amount numeric(12,2) NOT NULL,
    description text,
    reference_id character varying(100),
    customer_id uuid,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.team_wallet_transactions OWNER TO brodit;

--
-- Name: team_wallets; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.team_wallets (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    owner_customer_id uuid,
    name character varying(100) NOT NULL,
    sport_type character varying(50),
    avatar_url text,
    balance numeric(12,2) DEFAULT 0 NOT NULL,
    total_spent numeric(12,2) DEFAULT 0 NOT NULL,
    member_count integer DEFAULT 1 NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.team_wallets OWNER TO brodit;

--
-- Name: venue_owners; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.venue_owners (
    id character varying(50) NOT NULL,
    admin_id character varying(50),
    business_name text NOT NULL,
    pic_name text NOT NULL,
    phone text NOT NULL,
    email public.citext NOT NULL,
    status text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT venue_owners_status_check CHECK ((status = ANY (ARRAY['pending_review'::text, 'active'::text, 'suspended'::text, 'rejected'::text])))
);


ALTER TABLE public.venue_owners OWNER TO brodit;

--
-- Name: venues; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.venues (
    id character varying(50) NOT NULL,
    name text NOT NULL,
    slug text NOT NULL,
    owner_id character varying(50),
    area_id character varying(50),
    address text DEFAULT ''::text NOT NULL,
    phone text DEFAULT ''::text NOT NULL,
    email text DEFAULT ''::text NOT NULL,
    description text DEFAULT ''::text NOT NULL,
    maps_url text DEFAULT ''::text NOT NULL,
    open_time time without time zone DEFAULT '06:00:00'::time without time zone NOT NULL,
    close_time time without time zone DEFAULT '23:00:00'::time without time zone NOT NULL,
    facilities jsonb DEFAULT '[]'::jsonb NOT NULL,
    images jsonb,
    approval_status text DEFAULT 'draft'::text NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    avg_rating numeric(3,2) DEFAULT 0 NOT NULL,
    review_count integer DEFAULT 0 NOT NULL,
    rain_discount_config jsonb DEFAULT '{"enabled": false}'::jsonb,
    commission_rate numeric(5,2) DEFAULT 10.00 NOT NULL,
    platform_fee_type text DEFAULT 'percentage'::text NOT NULL,
    platform_fee_value numeric(12,2) DEFAULT 0 NOT NULL,
    CONSTRAINT venues_approval_status_check CHECK ((approval_status = ANY (ARRAY['draft'::text, 'pending_review'::text, 'active'::text, 'rejected'::text, 'suspended'::text]))),
    CONSTRAINT venues_platform_fee_type_check CHECK ((platform_fee_type = ANY (ARRAY['percentage'::text, 'fixed'::text])))
);


ALTER TABLE public.venues OWNER TO brodit;

--
-- Name: vouchers; Type: TABLE; Schema: public; Owner: brodit
--

CREATE TABLE public.vouchers (
    id character varying NOT NULL,
    code character varying NOT NULL,
    label character varying,
    discount_type character varying NOT NULL,
    discount_value integer NOT NULL,
    min_booking_amount integer DEFAULT 0 NOT NULL,
    max_uses integer,
    used_count integer DEFAULT 0 NOT NULL,
    valid_until timestamp with time zone,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT vouchers_discount_type_check CHECK (((discount_type)::text = ANY ((ARRAY['percentage'::character varying, 'fixed'::character varying])::text[])))
);


ALTER TABLE public.vouchers OWNER TO brodit;

--
-- Name: platform_settings id; Type: DEFAULT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.platform_settings ALTER COLUMN id SET DEFAULT nextval('public.platform_settings_id_seq'::regclass);


--
-- Name: achievements achievements_code_key; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.achievements
    ADD CONSTRAINT achievements_code_key UNIQUE (code);


--
-- Name: achievements achievements_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.achievements
    ADD CONSTRAINT achievements_pkey PRIMARY KEY (id);


--
-- Name: admins admins_email_key; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key UNIQUE (email);


--
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: admins admins_username_key; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_username_key UNIQUE (username);


--
-- Name: areas areas_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.areas
    ADD CONSTRAINT areas_pkey PRIMARY KEY (id);


--
-- Name: areas areas_slug_key; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.areas
    ADD CONSTRAINT areas_slug_key UNIQUE (slug);


--
-- Name: audit_logs audit_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT audit_logs_pkey PRIMARY KEY (id);


--
-- Name: blocked_slots blocked_slots_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.blocked_slots
    ADD CONSTRAINT blocked_slots_pkey PRIMARY KEY (id);


--
-- Name: bookings bookings_booking_code_key; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_booking_code_key UNIQUE (booking_code);


--
-- Name: bookings bookings_no_active_overlap; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_no_active_overlap EXCLUDE USING gist (court_id WITH =, booking_date WITH =, tsrange((booking_date + start_time), (booking_date + end_time), '[)'::text) WITH &&) WHERE ((booking_status = ANY (ARRAY['waiting_payment'::text, 'waiting_verification'::text, 'paid'::text, 'confirmed'::text])));


--
-- Name: bookings bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (id);


--
-- Name: cms_content cms_content_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.cms_content
    ADD CONSTRAINT cms_content_pkey PRIMARY KEY (key);


--
-- Name: court_photos court_photos_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.court_photos
    ADD CONSTRAINT court_photos_pkey PRIMARY KEY (id);


--
-- Name: courts courts_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.courts
    ADD CONSTRAINT courts_pkey PRIMARY KEY (id);


--
-- Name: courts courts_venue_id_slug_key; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.courts
    ADD CONSTRAINT courts_venue_id_slug_key UNIQUE (venue_id, slug);


--
-- Name: customers customers_email_key; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: group_booking_participants group_booking_participants_group_booking_id_customer_id_key; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.group_booking_participants
    ADD CONSTRAINT group_booking_participants_group_booking_id_customer_id_key UNIQUE (group_booking_id, customer_id);


--
-- Name: group_booking_participants group_booking_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.group_booking_participants
    ADD CONSTRAINT group_booking_participants_pkey PRIMARY KEY (id);


--
-- Name: group_booking_time_slots group_booking_time_slots_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.group_booking_time_slots
    ADD CONSTRAINT group_booking_time_slots_pkey PRIMARY KEY (id);


--
-- Name: group_bookings group_bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.group_bookings
    ADD CONSTRAINT group_bookings_pkey PRIMARY KEY (id);


--
-- Name: holidays holidays_date_key; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.holidays
    ADD CONSTRAINT holidays_date_key UNIQUE (date);


--
-- Name: holidays holidays_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.holidays
    ADD CONSTRAINT holidays_pkey PRIMARY KEY (id);


--
-- Name: loyalty_tiers loyalty_tiers_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.loyalty_tiers
    ADD CONSTRAINT loyalty_tiers_pkey PRIMARY KEY (id);


--
-- Name: loyalty_transactions loyalty_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.loyalty_transactions
    ADD CONSTRAINT loyalty_transactions_pkey PRIMARY KEY (id);


--
-- Name: notification_logs notification_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.notification_logs
    ADD CONSTRAINT notification_logs_pkey PRIMARY KEY (id);


--
-- Name: notification_preferences notification_preferences_customer_id_key; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.notification_preferences
    ADD CONSTRAINT notification_preferences_customer_id_key UNIQUE (customer_id);


--
-- Name: notification_preferences notification_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.notification_preferences
    ADD CONSTRAINT notification_preferences_pkey PRIMARY KEY (id);


--
-- Name: operating_hours operating_hours_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.operating_hours
    ADD CONSTRAINT operating_hours_pkey PRIMARY KEY (id);


--
-- Name: payment_methods payment_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.payment_methods
    ADD CONSTRAINT payment_methods_pkey PRIMARY KEY (id);


--
-- Name: payouts payouts_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.payouts
    ADD CONSTRAINT payouts_pkey PRIMARY KEY (id);


--
-- Name: pickup_game_messages pickup_game_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.pickup_game_messages
    ADD CONSTRAINT pickup_game_messages_pkey PRIMARY KEY (id);


--
-- Name: pickup_game_participants pickup_game_participants_pickup_game_id_customer_id_key; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.pickup_game_participants
    ADD CONSTRAINT pickup_game_participants_pickup_game_id_customer_id_key UNIQUE (pickup_game_id, customer_id);


--
-- Name: pickup_game_participants pickup_game_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.pickup_game_participants
    ADD CONSTRAINT pickup_game_participants_pkey PRIMARY KEY (id);


--
-- Name: pickup_games pickup_games_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.pickup_games
    ADD CONSTRAINT pickup_games_pkey PRIMARY KEY (id);


--
-- Name: platform_settings platform_settings_key_key; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.platform_settings
    ADD CONSTRAINT platform_settings_key_key UNIQUE (key);


--
-- Name: platform_settings platform_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.platform_settings
    ADD CONSTRAINT platform_settings_pkey PRIMARY KEY (id);


--
-- Name: player_achievements player_achievements_customer_id_achievement_id_key; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.player_achievements
    ADD CONSTRAINT player_achievements_customer_id_achievement_id_key UNIQUE (customer_id, achievement_id);


--
-- Name: player_achievements player_achievements_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.player_achievements
    ADD CONSTRAINT player_achievements_pkey PRIMARY KEY (id);


--
-- Name: player_streaks player_streaks_customer_id_streak_type_key; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.player_streaks
    ADD CONSTRAINT player_streaks_customer_id_streak_type_key UNIQUE (customer_id, streak_type);


--
-- Name: player_streaks player_streaks_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.player_streaks
    ADD CONSTRAINT player_streaks_pkey PRIMARY KEY (id);


--
-- Name: pricing_rules pricing_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.pricing_rules
    ADD CONSTRAINT pricing_rules_pkey PRIMARY KEY (id);


--
-- Name: referrals referrals_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.referrals
    ADD CONSTRAINT referrals_pkey PRIMARY KEY (id);


--
-- Name: referrals referrals_referral_code_key; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.referrals
    ADD CONSTRAINT referrals_referral_code_key UNIQUE (referral_code);


--
-- Name: review_photos review_photos_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.review_photos
    ADD CONSTRAINT review_photos_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: reward_redemptions reward_redemptions_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.reward_redemptions
    ADD CONSTRAINT reward_redemptions_pkey PRIMARY KEY (id);


--
-- Name: rewards rewards_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.rewards
    ADD CONSTRAINT rewards_pkey PRIMARY KEY (id);


--
-- Name: sports sports_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.sports
    ADD CONSTRAINT sports_pkey PRIMARY KEY (id);


--
-- Name: sports sports_slug_key; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.sports
    ADD CONSTRAINT sports_slug_key UNIQUE (slug);


--
-- Name: team_wallet_deposits team_wallet_deposits_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.team_wallet_deposits
    ADD CONSTRAINT team_wallet_deposits_pkey PRIMARY KEY (id);


--
-- Name: team_wallet_members team_wallet_members_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.team_wallet_members
    ADD CONSTRAINT team_wallet_members_pkey PRIMARY KEY (id);


--
-- Name: team_wallet_members team_wallet_members_wallet_id_customer_id_key; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.team_wallet_members
    ADD CONSTRAINT team_wallet_members_wallet_id_customer_id_key UNIQUE (wallet_id, customer_id);


--
-- Name: team_wallet_split_members team_wallet_split_members_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.team_wallet_split_members
    ADD CONSTRAINT team_wallet_split_members_pkey PRIMARY KEY (id);


--
-- Name: team_wallet_splits team_wallet_splits_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.team_wallet_splits
    ADD CONSTRAINT team_wallet_splits_pkey PRIMARY KEY (id);


--
-- Name: team_wallet_transactions team_wallet_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.team_wallet_transactions
    ADD CONSTRAINT team_wallet_transactions_pkey PRIMARY KEY (id);


--
-- Name: team_wallets team_wallets_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.team_wallets
    ADD CONSTRAINT team_wallets_pkey PRIMARY KEY (id);


--
-- Name: venue_owners venue_owners_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.venue_owners
    ADD CONSTRAINT venue_owners_pkey PRIMARY KEY (id);


--
-- Name: venues venues_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.venues
    ADD CONSTRAINT venues_pkey PRIMARY KEY (id);


--
-- Name: venues venues_slug_key; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.venues
    ADD CONSTRAINT venues_slug_key UNIQUE (slug);


--
-- Name: vouchers vouchers_code_key; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.vouchers
    ADD CONSTRAINT vouchers_code_key UNIQUE (code);


--
-- Name: vouchers vouchers_pkey; Type: CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.vouchers
    ADD CONSTRAINT vouchers_pkey PRIMARY KEY (id);


--
-- Name: areas_slug_idx; Type: INDEX; Schema: public; Owner: brodit
--

CREATE INDEX areas_slug_idx ON public.areas USING btree (slug);


--
-- Name: bookings_code_idx; Type: INDEX; Schema: public; Owner: brodit
--

CREATE INDEX bookings_code_idx ON public.bookings USING btree (booking_code);


--
-- Name: bookings_court_date_idx; Type: INDEX; Schema: public; Owner: brodit
--

CREATE INDEX bookings_court_date_idx ON public.bookings USING btree (court_id, booking_date);


--
-- Name: bookings_customer_idx; Type: INDEX; Schema: public; Owner: brodit
--

CREATE INDEX bookings_customer_idx ON public.bookings USING btree (user_id);


--
-- Name: bookings_recurring_idx; Type: INDEX; Schema: public; Owner: brodit
--

CREATE INDEX bookings_recurring_idx ON public.bookings USING btree (recurring_group_id) WHERE (recurring_group_id IS NOT NULL);


--
-- Name: bookings_reschedule_idx; Type: INDEX; Schema: public; Owner: brodit
--

CREATE INDEX bookings_reschedule_idx ON public.bookings USING btree (reschedule_count) WHERE (reschedule_count > 0);


--
-- Name: bookings_status_idx; Type: INDEX; Schema: public; Owner: brodit
--

CREATE INDEX bookings_status_idx ON public.bookings USING btree (booking_status);


--
-- Name: court_photos_idx; Type: INDEX; Schema: public; Owner: brodit
--

CREATE INDEX court_photos_idx ON public.court_photos USING btree (court_id);


--
-- Name: holidays_active_idx; Type: INDEX; Schema: public; Owner: brodit
--

CREATE INDEX holidays_active_idx ON public.holidays USING btree (is_active) WHERE (is_active = true);


--
-- Name: holidays_date_idx; Type: INDEX; Schema: public; Owner: brodit
--

CREATE INDEX holidays_date_idx ON public.holidays USING btree (date);


--
-- Name: idx_achievements_category; Type: INDEX; Schema: public; Owner: brodit
--

CREATE INDEX idx_achievements_category ON public.achievements USING btree (category);


--
-- Name: idx_achievements_code; Type: INDEX; Schema: public; Owner: brodit
--

CREATE INDEX idx_achievements_code ON public.achievements USING btree (code);


--
-- Name: idx_gb_participants_customer; Type: INDEX; Schema: public; Owner: brodit
--

CREATE INDEX idx_gb_participants_customer ON public.group_booking_participants USING btree (customer_id);


--
-- Name: idx_gb_participants_group; Type: INDEX; Schema: public; Owner: brodit
--

CREATE INDEX idx_gb_participants_group ON public.group_booking_participants USING btree (group_booking_id);


--
-- Name: idx_gb_slots_group; Type: INDEX; Schema: public; Owner: brodit
--

CREATE INDEX idx_gb_slots_group ON public.group_booking_time_slots USING btree (group_booking_id);


--
-- Name: idx_group_bookings_organizer; Type: INDEX; Schema: public; Owner: brodit
--

CREATE INDEX idx_group_bookings_organizer ON public.group_bookings USING btree (organizer_id);


--
-- Name: idx_group_bookings_status; Type: INDEX; Schema: public; Owner: brodit
--

CREATE INDEX idx_group_bookings_status ON public.group_bookings USING btree (status);


--
-- Name: idx_group_bookings_venue; Type: INDEX; Schema: public; Owner: brodit
--

CREATE INDEX idx_group_bookings_venue ON public.group_bookings USING btree (venue_id);


--
-- Name: idx_player_achievements_customer; Type: INDEX; Schema: public; Owner: brodit
--

CREATE INDEX idx_player_achievements_customer ON public.player_achievements USING btree (customer_id);


--
-- Name: idx_player_achievements_unlocked; Type: INDEX; Schema: public; Owner: brodit
--

CREATE INDEX idx_player_achievements_unlocked ON public.player_achievements USING btree (is_unlocked);


--
-- Name: idx_player_streaks_customer; Type: INDEX; Schema: public; Owner: brodit
--

CREATE INDEX idx_player_streaks_customer ON public.player_streaks USING btree (customer_id);


--
-- Name: idx_player_streaks_type; Type: INDEX; Schema: public; Owner: brodit
--

CREATE INDEX idx_player_streaks_type ON public.player_streaks USING btree (streak_type);


--
-- Name: loyalty_one_earned_tx_per_booking; Type: INDEX; Schema: public; Owner: brodit
--

CREATE UNIQUE INDEX loyalty_one_earned_tx_per_booking ON public.loyalty_transactions USING btree (booking_id) WHERE ((type = 'earned'::text) AND (booking_id IS NOT NULL));


--
-- Name: notif_prefs_customer_idx; Type: INDEX; Schema: public; Owner: brodit
--

CREATE INDEX notif_prefs_customer_idx ON public.notification_preferences USING btree (customer_id);


--
-- Name: payouts_owner_idx; Type: INDEX; Schema: public; Owner: brodit
--

CREATE INDEX payouts_owner_idx ON public.payouts USING btree (owner_id);


--
-- Name: payouts_status_idx; Type: INDEX; Schema: public; Owner: brodit
--

CREATE INDEX payouts_status_idx ON public.payouts USING btree (status);


--
-- Name: pickup_game_participants_game_idx; Type: INDEX; Schema: public; Owner: brodit
--

CREATE INDEX pickup_game_participants_game_idx ON public.pickup_game_participants USING btree (pickup_game_id);


--
-- Name: pickup_games_sport_status_date_idx; Type: INDEX; Schema: public; Owner: brodit
--

CREATE INDEX pickup_games_sport_status_date_idx ON public.pickup_games USING btree (sport_type, status, scheduled_at);


--
-- Name: referrals_code_idx; Type: INDEX; Schema: public; Owner: brodit
--

CREATE INDEX referrals_code_idx ON public.referrals USING btree (referral_code);


--
-- Name: referrals_referrer_idx; Type: INDEX; Schema: public; Owner: brodit
--

CREATE INDEX referrals_referrer_idx ON public.referrals USING btree (referrer_id);


--
-- Name: review_photos_review_idx; Type: INDEX; Schema: public; Owner: brodit
--

CREATE INDEX review_photos_review_idx ON public.review_photos USING btree (review_id);


--
-- Name: reviews_customer_idx; Type: INDEX; Schema: public; Owner: brodit
--

CREATE INDEX reviews_customer_idx ON public.reviews USING btree (customer_id);


--
-- Name: reviews_one_per_booking; Type: INDEX; Schema: public; Owner: brodit
--

CREATE UNIQUE INDEX reviews_one_per_booking ON public.reviews USING btree (booking_id);


--
-- Name: reviews_venue_idx; Type: INDEX; Schema: public; Owner: brodit
--

CREATE INDEX reviews_venue_idx ON public.reviews USING btree (venue_id);


--
-- Name: reward_redemptions_customer_idx; Type: INDEX; Schema: public; Owner: brodit
--

CREATE INDEX reward_redemptions_customer_idx ON public.reward_redemptions USING btree (customer_id);


--
-- Name: team_wallet_deposits_wallet_idx; Type: INDEX; Schema: public; Owner: brodit
--

CREATE INDEX team_wallet_deposits_wallet_idx ON public.team_wallet_deposits USING btree (wallet_id);


--
-- Name: team_wallet_members_wallet_idx; Type: INDEX; Schema: public; Owner: brodit
--

CREATE INDEX team_wallet_members_wallet_idx ON public.team_wallet_members USING btree (wallet_id);


--
-- Name: team_wallet_split_members_split_idx; Type: INDEX; Schema: public; Owner: brodit
--

CREATE INDEX team_wallet_split_members_split_idx ON public.team_wallet_split_members USING btree (split_id);


--
-- Name: team_wallet_transactions_wallet_idx; Type: INDEX; Schema: public; Owner: brodit
--

CREATE INDEX team_wallet_transactions_wallet_idx ON public.team_wallet_transactions USING btree (wallet_id);


--
-- Name: venues_area_idx; Type: INDEX; Schema: public; Owner: brodit
--

CREATE INDEX venues_area_idx ON public.venues USING btree (area_id);


--
-- Name: venues_owner_idx; Type: INDEX; Schema: public; Owner: brodit
--

CREATE INDEX venues_owner_idx ON public.venues USING btree (owner_id);


--
-- Name: blocked_slots blocked_slots_court_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.blocked_slots
    ADD CONSTRAINT blocked_slots_court_id_fkey FOREIGN KEY (court_id) REFERENCES public.courts(id) ON DELETE CASCADE;


--
-- Name: bookings bookings_court_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_court_id_fkey FOREIGN KEY (court_id) REFERENCES public.courts(id) ON DELETE RESTRICT;


--
-- Name: bookings bookings_sport_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_sport_id_fkey FOREIGN KEY (sport_id) REFERENCES public.sports(id) ON DELETE RESTRICT;


--
-- Name: bookings bookings_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.customers(id) ON DELETE SET NULL;


--
-- Name: bookings bookings_venue_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_venue_id_fkey FOREIGN KEY (venue_id) REFERENCES public.venues(id) ON DELETE RESTRICT;


--
-- Name: bookings bookings_verified_by_admin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_verified_by_admin_id_fkey FOREIGN KEY (verified_by_admin_id) REFERENCES public.admins(id) ON DELETE SET NULL;


--
-- Name: court_photos court_photos_court_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.court_photos
    ADD CONSTRAINT court_photos_court_id_fkey FOREIGN KEY (court_id) REFERENCES public.courts(id) ON DELETE CASCADE;


--
-- Name: courts courts_sport_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.courts
    ADD CONSTRAINT courts_sport_id_fkey FOREIGN KEY (sport_id) REFERENCES public.sports(id) ON DELETE RESTRICT;


--
-- Name: courts courts_venue_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.courts
    ADD CONSTRAINT courts_venue_id_fkey FOREIGN KEY (venue_id) REFERENCES public.venues(id) ON DELETE CASCADE;


--
-- Name: group_booking_participants group_booking_participants_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.group_booking_participants
    ADD CONSTRAINT group_booking_participants_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id) ON DELETE CASCADE;


--
-- Name: group_booking_participants group_booking_participants_group_booking_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.group_booking_participants
    ADD CONSTRAINT group_booking_participants_group_booking_id_fkey FOREIGN KEY (group_booking_id) REFERENCES public.group_bookings(id) ON DELETE CASCADE;


--
-- Name: group_booking_participants group_booking_participants_vote_slot_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.group_booking_participants
    ADD CONSTRAINT group_booking_participants_vote_slot_id_fkey FOREIGN KEY (vote_slot_id) REFERENCES public.group_booking_time_slots(id) ON DELETE SET NULL;


--
-- Name: group_booking_time_slots group_booking_time_slots_group_booking_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.group_booking_time_slots
    ADD CONSTRAINT group_booking_time_slots_group_booking_id_fkey FOREIGN KEY (group_booking_id) REFERENCES public.group_bookings(id) ON DELETE CASCADE;


--
-- Name: group_bookings group_bookings_court_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.group_bookings
    ADD CONSTRAINT group_bookings_court_id_fkey FOREIGN KEY (court_id) REFERENCES public.courts(id) ON DELETE CASCADE;


--
-- Name: group_bookings group_bookings_final_booking_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.group_bookings
    ADD CONSTRAINT group_bookings_final_booking_id_fkey FOREIGN KEY (final_booking_id) REFERENCES public.bookings(id);


--
-- Name: group_bookings group_bookings_organizer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.group_bookings
    ADD CONSTRAINT group_bookings_organizer_id_fkey FOREIGN KEY (organizer_id) REFERENCES public.customers(id) ON DELETE CASCADE;


--
-- Name: group_bookings group_bookings_sport_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.group_bookings
    ADD CONSTRAINT group_bookings_sport_id_fkey FOREIGN KEY (sport_id) REFERENCES public.sports(id);


--
-- Name: group_bookings group_bookings_venue_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.group_bookings
    ADD CONSTRAINT group_bookings_venue_id_fkey FOREIGN KEY (venue_id) REFERENCES public.venues(id) ON DELETE CASCADE;


--
-- Name: loyalty_transactions loyalty_transactions_booking_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.loyalty_transactions
    ADD CONSTRAINT loyalty_transactions_booking_id_fkey FOREIGN KEY (booking_id) REFERENCES public.bookings(id) ON DELETE SET NULL;


--
-- Name: loyalty_transactions loyalty_transactions_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.loyalty_transactions
    ADD CONSTRAINT loyalty_transactions_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id) ON DELETE CASCADE;


--
-- Name: notification_logs notification_logs_booking_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.notification_logs
    ADD CONSTRAINT notification_logs_booking_id_fkey FOREIGN KEY (booking_id) REFERENCES public.bookings(id) ON DELETE SET NULL;


--
-- Name: notification_preferences notification_preferences_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.notification_preferences
    ADD CONSTRAINT notification_preferences_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id) ON DELETE CASCADE;


--
-- Name: operating_hours operating_hours_court_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.operating_hours
    ADD CONSTRAINT operating_hours_court_id_fkey FOREIGN KEY (court_id) REFERENCES public.courts(id) ON DELETE CASCADE;


--
-- Name: payouts payouts_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.payouts
    ADD CONSTRAINT payouts_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.venue_owners(id) ON DELETE CASCADE;


--
-- Name: payouts payouts_venue_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.payouts
    ADD CONSTRAINT payouts_venue_id_fkey FOREIGN KEY (venue_id) REFERENCES public.venues(id) ON DELETE SET NULL;


--
-- Name: pickup_game_messages pickup_game_messages_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.pickup_game_messages
    ADD CONSTRAINT pickup_game_messages_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id) ON DELETE SET NULL;


--
-- Name: pickup_game_messages pickup_game_messages_pickup_game_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.pickup_game_messages
    ADD CONSTRAINT pickup_game_messages_pickup_game_id_fkey FOREIGN KEY (pickup_game_id) REFERENCES public.pickup_games(id) ON DELETE CASCADE;


--
-- Name: pickup_game_participants pickup_game_participants_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.pickup_game_participants
    ADD CONSTRAINT pickup_game_participants_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id) ON DELETE CASCADE;


--
-- Name: pickup_game_participants pickup_game_participants_pickup_game_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.pickup_game_participants
    ADD CONSTRAINT pickup_game_participants_pickup_game_id_fkey FOREIGN KEY (pickup_game_id) REFERENCES public.pickup_games(id) ON DELETE CASCADE;


--
-- Name: pickup_games pickup_games_court_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.pickup_games
    ADD CONSTRAINT pickup_games_court_id_fkey FOREIGN KEY (court_id) REFERENCES public.courts(id) ON DELETE SET NULL;


--
-- Name: pickup_games pickup_games_host_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.pickup_games
    ADD CONSTRAINT pickup_games_host_customer_id_fkey FOREIGN KEY (host_customer_id) REFERENCES public.customers(id) ON DELETE SET NULL;


--
-- Name: pickup_games pickup_games_venue_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.pickup_games
    ADD CONSTRAINT pickup_games_venue_id_fkey FOREIGN KEY (venue_id) REFERENCES public.venues(id) ON DELETE SET NULL;


--
-- Name: player_achievements player_achievements_achievement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.player_achievements
    ADD CONSTRAINT player_achievements_achievement_id_fkey FOREIGN KEY (achievement_id) REFERENCES public.achievements(id) ON DELETE CASCADE;


--
-- Name: player_achievements player_achievements_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.player_achievements
    ADD CONSTRAINT player_achievements_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id) ON DELETE CASCADE;


--
-- Name: player_streaks player_streaks_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.player_streaks
    ADD CONSTRAINT player_streaks_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id) ON DELETE CASCADE;


--
-- Name: pricing_rules pricing_rules_court_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.pricing_rules
    ADD CONSTRAINT pricing_rules_court_id_fkey FOREIGN KEY (court_id) REFERENCES public.courts(id) ON DELETE CASCADE;


--
-- Name: referrals referrals_referee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.referrals
    ADD CONSTRAINT referrals_referee_id_fkey FOREIGN KEY (referee_id) REFERENCES public.customers(id) ON DELETE SET NULL;


--
-- Name: referrals referrals_referrer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.referrals
    ADD CONSTRAINT referrals_referrer_id_fkey FOREIGN KEY (referrer_id) REFERENCES public.customers(id) ON DELETE CASCADE;


--
-- Name: review_photos review_photos_review_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.review_photos
    ADD CONSTRAINT review_photos_review_id_fkey FOREIGN KEY (review_id) REFERENCES public.reviews(id) ON DELETE CASCADE;


--
-- Name: reviews reviews_booking_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_booking_id_fkey FOREIGN KEY (booking_id) REFERENCES public.bookings(id) ON DELETE CASCADE;


--
-- Name: reviews reviews_court_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_court_id_fkey FOREIGN KEY (court_id) REFERENCES public.courts(id) ON DELETE SET NULL;


--
-- Name: reviews reviews_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id) ON DELETE CASCADE;


--
-- Name: reviews reviews_venue_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_venue_id_fkey FOREIGN KEY (venue_id) REFERENCES public.venues(id) ON DELETE CASCADE;


--
-- Name: reward_redemptions reward_redemptions_booking_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.reward_redemptions
    ADD CONSTRAINT reward_redemptions_booking_id_fkey FOREIGN KEY (booking_id) REFERENCES public.bookings(id) ON DELETE SET NULL;


--
-- Name: reward_redemptions reward_redemptions_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.reward_redemptions
    ADD CONSTRAINT reward_redemptions_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id) ON DELETE CASCADE;


--
-- Name: reward_redemptions reward_redemptions_reward_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.reward_redemptions
    ADD CONSTRAINT reward_redemptions_reward_id_fkey FOREIGN KEY (reward_id) REFERENCES public.rewards(id) ON DELETE RESTRICT;


--
-- Name: team_wallet_deposits team_wallet_deposits_from_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.team_wallet_deposits
    ADD CONSTRAINT team_wallet_deposits_from_customer_id_fkey FOREIGN KEY (from_customer_id) REFERENCES public.customers(id) ON DELETE SET NULL;


--
-- Name: team_wallet_deposits team_wallet_deposits_wallet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.team_wallet_deposits
    ADD CONSTRAINT team_wallet_deposits_wallet_id_fkey FOREIGN KEY (wallet_id) REFERENCES public.team_wallets(id) ON DELETE CASCADE;


--
-- Name: team_wallet_members team_wallet_members_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.team_wallet_members
    ADD CONSTRAINT team_wallet_members_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id) ON DELETE CASCADE;


--
-- Name: team_wallet_members team_wallet_members_wallet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.team_wallet_members
    ADD CONSTRAINT team_wallet_members_wallet_id_fkey FOREIGN KEY (wallet_id) REFERENCES public.team_wallets(id) ON DELETE CASCADE;


--
-- Name: team_wallet_split_members team_wallet_split_members_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.team_wallet_split_members
    ADD CONSTRAINT team_wallet_split_members_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id) ON DELETE CASCADE;


--
-- Name: team_wallet_split_members team_wallet_split_members_split_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.team_wallet_split_members
    ADD CONSTRAINT team_wallet_split_members_split_id_fkey FOREIGN KEY (split_id) REFERENCES public.team_wallet_splits(id) ON DELETE CASCADE;


--
-- Name: team_wallet_splits team_wallet_splits_booking_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.team_wallet_splits
    ADD CONSTRAINT team_wallet_splits_booking_id_fkey FOREIGN KEY (booking_id) REFERENCES public.bookings(id) ON DELETE SET NULL;


--
-- Name: team_wallet_splits team_wallet_splits_wallet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.team_wallet_splits
    ADD CONSTRAINT team_wallet_splits_wallet_id_fkey FOREIGN KEY (wallet_id) REFERENCES public.team_wallets(id) ON DELETE CASCADE;


--
-- Name: team_wallet_transactions team_wallet_transactions_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.team_wallet_transactions
    ADD CONSTRAINT team_wallet_transactions_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id) ON DELETE SET NULL;


--
-- Name: team_wallet_transactions team_wallet_transactions_wallet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.team_wallet_transactions
    ADD CONSTRAINT team_wallet_transactions_wallet_id_fkey FOREIGN KEY (wallet_id) REFERENCES public.team_wallets(id) ON DELETE CASCADE;


--
-- Name: team_wallets team_wallets_owner_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.team_wallets
    ADD CONSTRAINT team_wallets_owner_customer_id_fkey FOREIGN KEY (owner_customer_id) REFERENCES public.customers(id) ON DELETE CASCADE;


--
-- Name: venue_owners venue_owners_admin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.venue_owners
    ADD CONSTRAINT venue_owners_admin_id_fkey FOREIGN KEY (admin_id) REFERENCES public.admins(id) ON DELETE SET NULL;


--
-- Name: venues venues_area_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.venues
    ADD CONSTRAINT venues_area_id_fkey FOREIGN KEY (area_id) REFERENCES public.areas(id) ON DELETE SET NULL;


--
-- Name: venues venues_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brodit
--

ALTER TABLE ONLY public.venues
    ADD CONSTRAINT venues_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.venue_owners(id) ON DELETE SET NULL;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT ALL ON SCHEMA public TO brodit;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO brodit;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO brodit;


--
-- PostgreSQL database dump complete
--

\unrestrict CMJe3kxLhFA4v95HOlLWPiou7zcNIncRYpASOZCMtKg2uJfysSxMK7cZlcCJBfa

