--
-- PostgreSQL database dump
--

\restrict AZtFIh23VrQSY1NN5cWO85mVR4gEdiO3QWbAjJNOBUb4Srvsbb9cdD7RKz1WxOe

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
-- Data for Name: achievements; Type: TABLE DATA; Schema: public; Owner: brodit
--

INSERT INTO public.achievements (id, code, name, name_en, description, description_en, category, icon, points_reward, badge_tier, criteria, created_at) VALUES ('467d4c9d-cf48-4fd0-8da1-5a314a1a9f30', 'first_game', 'Game Pertama', 'First Game', 'Main game pertama kamu', 'Play your first game', 'loyalty', '🎮', 10, 'bronze', '{"type": "total_games", "target": 1}', '2026-08-27 08:57:49.76222+00');
INSERT INTO public.achievements (id, code, name, name_en, description, description_en, category, icon, points_reward, badge_tier, criteria, created_at) VALUES ('a417b264-6eea-4168-b8e1-dfa032f42e6c', 'game_10', 'Sering Main', 'Regular Player', 'Main 10 game', 'Play 10 games', 'loyalty', '🏀', 50, 'bronze', '{"type": "total_games", "target": 10}', '2026-08-27 08:57:49.76222+00');
INSERT INTO public.achievements (id, code, name, name_en, description, description_en, category, icon, points_reward, badge_tier, criteria, created_at) VALUES ('492dc541-1911-4474-98f3-7d4ec7dfbef3', 'game_50', 'Game Junkie', 'Game Junkie', 'Main 50 game', 'Play 50 games', 'loyalty', '🔥', 200, 'silver', '{"type": "total_games", "target": 50}', '2026-08-27 08:57:49.76222+00');
INSERT INTO public.achievements (id, code, name, name_en, description, description_en, category, icon, points_reward, badge_tier, criteria, created_at) VALUES ('598734e0-51c1-434b-9577-a38198c76222', 'game_100', 'Sultan Lapangan', 'Sultan Lapangan', 'Main 100 game', 'Play 100 games', 'loyalty', '👑', 500, 'gold', '{"type": "total_games", "target": 100}', '2026-08-27 08:57:49.76222+00');
INSERT INTO public.achievements (id, code, name, name_en, description, description_en, category, icon, points_reward, badge_tier, criteria, created_at) VALUES ('0b314fc1-b4c7-4589-ae66-7dfe6d097257', 'spend_1m', 'Investor Lapangan', 'Big Spender', 'Spend Rp 1jt di booking', 'Spend IDR 1M on bookings', 'loyalty', '💰', 100, 'bronze', '{"type": "total_spend", "target": 1000000}', '2026-08-27 08:57:49.76222+00');
INSERT INTO public.achievements (id, code, name, name_en, description, description_en, category, icon, points_reward, badge_tier, criteria, created_at) VALUES ('a164022d-9e3e-4c00-9853-294048b80455', 'spend_5m', 'Regular Spender', 'Regular Spender', 'Spend Rp 5jt di booking', 'Spend IDR 5M on bookings', 'loyalty', '💳', 300, 'silver', '{"type": "total_spend", "target": 5000000}', '2026-08-27 08:57:49.76222+00');
INSERT INTO public.achievements (id, code, name, name_en, description, description_en, category, icon, points_reward, badge_tier, criteria, created_at) VALUES ('f6ef5f65-3564-4918-add4-f8b0741399a8', 'spend_10m', 'Lapangan Patron', 'Lapangan Patron', 'Spend Rp 10jt di booking', 'Spend IDR 10M on bookings', 'loyalty', '💎', 800, 'gold', '{"type": "total_spend", "target": 10000000}', '2026-08-27 08:57:49.76222+00');
INSERT INTO public.achievements (id, code, name, name_en, description, description_en, category, icon, points_reward, badge_tier, criteria, created_at) VALUES ('1a4614a1-d812-4f1d-958a-d78a8ca48b00', 'streak_7', 'Seminggu Penuh', 'Week Warrior', 'Main 7 hari berturut-turut', '7-day play streak', 'streak', '⚡', 70, 'bronze', '{"type": "streak_days", "target": 7}', '2026-08-27 08:57:49.76222+00');
INSERT INTO public.achievements (id, code, name, name_en, description, description_en, category, icon, points_reward, badge_tier, criteria, created_at) VALUES ('f1ddbac2-c00f-4623-a4cf-ef2043fe4bf4', 'streak_30', 'Sebulan Penuh', 'Monthly Master', 'Main 30 hari berturut-turut', '30-day play streak', 'streak', '🌟', 300, 'silver', '{"type": "streak_days", "target": 30}', '2026-08-27 08:57:49.76222+00');
INSERT INTO public.achievements (id, code, name, name_en, description, description_en, category, icon, points_reward, badge_tier, criteria, created_at) VALUES ('04101495-3eae-43b1-98bd-33f50c2a0b87', 'streak_100', 'Seratus Hari', 'Century Club', 'Main 100 hari berturut-turut', '100-day play streak', 'streak', '🏆', 1000, 'gold', '{"type": "streak_days", "target": 100}', '2026-08-27 08:57:49.76222+00');
INSERT INTO public.achievements (id, code, name, name_en, description, description_en, category, icon, points_reward, badge_tier, criteria, created_at) VALUES ('5c3aba99-19a8-407f-b17a-9a812f9b1d45', 'venue_5_different', 'Jelajah', 'Explorer', 'Main di 5 lapangan berbeda', 'Play at 5 different venues', 'social', '🗺️', 75, 'silver', '{"type": "unique_venues", "target": 5}', '2026-08-27 08:57:49.76222+00');
INSERT INTO public.achievements (id, code, name, name_en, description, description_en, category, icon, points_reward, badge_tier, criteria, created_at) VALUES ('c007036f-9699-4c85-bf0a-e9f87969c69c', 'venue_10_different', 'Petualang', 'Adventurer', 'Main di 10 lapangan berbeda', 'Play at 10 different venues', 'social', '🌍', 200, 'gold', '{"type": "unique_venues", "target": 10}', '2026-08-27 08:57:49.76222+00');
INSERT INTO public.achievements (id, code, name, name_en, description, description_en, category, icon, points_reward, badge_tier, criteria, created_at) VALUES ('22a97b22-954c-4f21-aa1b-b8c618d85105', 'pickup_host_5', 'Host Ramai', 'Social Host', 'Buat 5 pickup game', 'Host 5 pickup games', 'community', '📢', 100, 'silver', '{"type": "pickup_hosted", "target": 5}', '2026-08-27 08:57:49.76222+00');
INSERT INTO public.achievements (id, code, name, name_en, description, description_en, category, icon, points_reward, badge_tier, criteria, created_at) VALUES ('4609842f-1743-4bbd-b18a-f87ecdecad4c', 'pickup_join_10', 'Party Player', 'Party Player', 'Gabung 10 pickup game', 'Join 10 pickup games', 'community', '🎉', 50, 'bronze', '{"type": "pickup_joined", "target": 10}', '2026-08-27 08:57:49.76222+00');
INSERT INTO public.achievements (id, code, name, name_en, description, description_en, category, icon, points_reward, badge_tier, criteria, created_at) VALUES ('396289f1-0ea4-40d5-b3a9-3d3e1a35c045', 'team_leader', 'Kapten Tim', 'Team Captain', 'Buat team wallet', 'Create a team wallet', 'community', '👥', 25, 'bronze', '{"type": "wallets_created", "target": 1}', '2026-08-27 08:57:49.76222+00');
INSERT INTO public.achievements (id, code, name, name_en, description, description_en, category, icon, points_reward, badge_tier, criteria, created_at) VALUES ('93290d04-2dd9-4452-8db0-3a79cbc84a99', 'referrer_3', 'Ajak Teman', 'Recruiter', 'Refer 3 teman', 'Refer 3 friends', 'social', '🤝', 150, 'silver', '{"type": "referrals", "target": 3}', '2026-08-27 08:57:49.76222+00');
INSERT INTO public.achievements (id, code, name, name_en, description, description_en, category, icon, points_reward, badge_tier, criteria, created_at) VALUES ('3813a4e9-e256-4685-9711-fd8f2c13ac5f', 'rating_5_10', 'Bintang 5', 'Five Star', 'Dapat 10 rating 5 bintang', 'Get 10 five-star ratings', 'skill', '⭐', 200, 'gold', '{"type": "five_star_ratings", "target": 10}', '2026-08-27 08:57:49.76222+00');
INSERT INTO public.achievements (id, code, name, name_en, description, description_en, category, icon, points_reward, badge_tier, criteria, created_at) VALUES ('6ace5acb-ccf5-4290-bc62-db736ed40646', 'all_positions', 'Serba Bisa', 'Versatile', 'Main di semua posisi', 'Play all positions', 'skill', '🔄', 150, 'silver', '{"type": "positions_played", "target": 4}', '2026-08-27 08:57:49.76222+00');


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: brodit
--

INSERT INTO public.admins (id, username, name, email, password_hash, role, is_active, created_at, updated_at, last_login_at) VALUES ('admin-1', 'superadmin', 'Super Admin', 'admin@lapangin.id', '$2b$10$c6oIJREEQCdxIc8mY/1T2uAxZA/uSIlyQ4KsdNxRlC0KnxW9tPvXS', 'super_admin', true, '2026-07-13 05:56:46.962998+00', '2026-07-13 05:56:46.962998+00', NULL);
INSERT INTO public.admins (id, username, name, email, password_hash, role, is_active, created_at, updated_at, last_login_at) VALUES ('admin-andi-greenfield', 'andiwijaya', 'Andi Wijaya', 'andi@greenfield.id', '$2b$12$jP5ZrqXhRq555EwPp/kWzOxz.I3JvWGmuVgkouwn/Llqr2Cd1LooO', 'admin', true, '2026-08-30 15:40:08.33975+00', '2026-08-30 15:40:08.33975+00', NULL);
INSERT INTO public.admins (id, username, name, email, password_hash, role, is_active, created_at, updated_at, last_login_at) VALUES ('admin-budi-rahasian', 'budi', 'Budi Santoso', 'budi@rahasian.id', '$2b$12$jP5ZrqXhRq555EwPp/kWzOxz.I3JvWGmuVgkouwn/Llqr2Cd1LooO', 'admin', true, '2026-08-30 15:40:08.345233+00', '2026-08-30 15:40:08.345233+00', NULL);
INSERT INTO public.admins (id, username, name, email, password_hash, role, is_active, created_at, updated_at, last_login_at) VALUES ('admin-charlie-arena', 'charlieputra', 'Charlie Putra', 'charlie@arenafutsal.id', '$2b$12$jP5ZrqXhRq555EwPp/kWzOxz.I3JvWGmuVgkouwn/Llqr2Cd1LooO', 'admin', true, '2026-08-30 15:40:08.34852+00', '2026-08-30 15:40:08.34852+00', NULL);
INSERT INTO public.admins (id, username, name, email, password_hash, role, is_active, created_at, updated_at, last_login_at) VALUES ('owner-1', 'venueowner', 'Venue Owner', 'owner@lapangin.id', '$2b$12$jP5ZrqXhRq555EwPp/kWzOxz.I3JvWGmuVgkouwn/Llqr2Cd1LooO', 'admin', true, '2026-07-13 05:56:46.962998+00', '2026-07-13 05:56:46.962998+00', NULL);


--
-- Data for Name: areas; Type: TABLE DATA; Schema: public; Owner: brodit
--

INSERT INTO public.areas (id, province, city, district, village, slug, label, is_active, created_at, updated_at) VALUES ('area-bdg-kota', 'Jawa Barat', 'Bandung', 'Kota Bandung', '', 'bandung-kota', '', true, '2026-07-13 05:56:46.959237+00', '2026-07-13 05:56:46.959237+00');
INSERT INTO public.areas (id, province, city, district, village, slug, label, is_active, created_at, updated_at) VALUES ('area-bdg-kab', 'Jawa Barat', 'Bandung', 'Kabupaten Bandung', '', 'bandung-kabupaten', '', true, '2026-07-13 05:56:46.959237+00', '2026-07-13 05:56:46.959237+00');
INSERT INTO public.areas (id, province, city, district, village, slug, label, is_active, created_at, updated_at) VALUES ('area-jkt-selatan', 'DKI Jakarta', 'Jakarta Selatan', 'Jakarta Selatan', '', 'jakarta-selatan', '', true, '2026-07-13 05:56:46.959237+00', '2026-07-13 05:56:46.959237+00');
INSERT INTO public.areas (id, province, city, district, village, slug, label, is_active, created_at, updated_at) VALUES ('area-sby-kota', 'Jawa Timur', 'Surabaya', 'Kota Surabaya', '', 'surabaya-kota', '', true, '2026-07-13 05:56:46.959237+00', '2026-07-13 05:56:46.959237+00');
INSERT INTO public.areas (id, province, city, district, village, slug, label, is_active, created_at, updated_at) VALUES ('area-yog-kota', 'DI Yogyakarta', 'Yogyakarta', 'Kota Yogyakarta', '', 'yogyakarta-kota', '', true, '2026-07-13 05:56:46.959237+00', '2026-07-13 05:56:46.959237+00');
INSERT INTO public.areas (id, province, city, district, village, slug, label, is_active, created_at, updated_at) VALUES ('area-smg-kota', 'Jawa Tengah', 'Semarang', 'Kota Semarang', '', 'semarang-kota', '', true, '2026-07-13 05:56:46.959237+00', '2026-07-13 05:56:46.959237+00');
INSERT INTO public.areas (id, province, city, district, village, slug, label, is_active, created_at, updated_at) VALUES ('area-mdn-kota', 'Sumatera Utara', 'Medan', 'Kota Medan', '', 'medan-kota', '', true, '2026-07-13 05:56:46.959237+00', '2026-07-13 05:56:46.959237+00');
INSERT INTO public.areas (id, province, city, district, village, slug, label, is_active, created_at, updated_at) VALUES ('area-blp-kota', 'Bali', 'Denpasar', 'Kota Denpasar', '', 'denpasar-kota', '', true, '2026-07-13 05:56:46.959237+00', '2026-07-13 05:56:46.959237+00');


--
-- Data for Name: audit_logs; Type: TABLE DATA; Schema: public; Owner: brodit
--

INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('d729b7d1-d3e5-4560-b12d-2d0429446c84', '2026-07-13 08:39:25.009835+00', 'booking_created', 'booking', 'bk-6f64fb0f', 'customer', NULL, 'Booking BK-260713-976D created: 2026-07-13 17:00-19:00', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('63680b8d-0ddf-4ca9-807d-4f218bc2e5c7', '2026-07-13 08:39:38.319173+00', 'payment_proof_submitted', 'booking', 'bk-6f64fb0f', 'customer', NULL, 'Payment proof submitted for BK-260713-976D', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('f28f60ad-dae1-4245-9022-7d01e4dbc6f6', '2026-08-27 08:57:52.906095+00', 'booking_created', 'booking', 'bk-cce29d13', 'customer', NULL, 'Booking BK-260827-FE9B created: 2026-09-10 19:00-21:00', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('22336522-8859-4b1e-b259-1e292670e4c2', '2026-08-27 09:01:40.717595+00', 'booking_created', 'booking', 'bk-21a0bffe', 'customer', NULL, 'Booking BK-260827-7E95 created: 2026-09-10 19:00-21:00', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('23dba87a-387f-4617-8ac4-ab8b998a1167', '2026-08-27 09:02:26.796603+00', 'booking_created', 'booking', 'bk-02edd7c1', 'customer', NULL, 'Booking BK-260827-A1FB created: 2026-09-10 19:00-21:00', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('be5895f9-9df3-4505-93a5-edd16850e3ac', '2026-08-27 09:19:21.933922+00', 'booking_created', 'booking', 'bk-7e08f382', 'customer', NULL, 'Booking BK-260827-85FD created: 2026-09-20 19:00-20:00', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('dbdba2fb-8709-44f1-a301-577cf9e453ba', '2026-08-27 09:24:56.749184+00', 'booking_created', 'booking', 'bk-7adfa04a', 'customer', NULL, 'Booking BK-260827-F689 created: 2026-08-27 19:00-20:00', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('815f82b2-f434-4fa4-851f-c5d688edf624', '2026-08-27 09:36:16.005513+00', 'booking_created', 'booking', 'bk-fe6f783e', 'customer', NULL, 'Booking BK-260827-9EF0 created: 2026-08-27 20:00-21:00', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('f58006af-6d50-4148-8e11-6f5277954404', '2026-08-27 09:36:33.072092+00', 'booking_created', 'booking', 'bk-e30ddf2e', 'customer', NULL, 'Booking BK-260827-8840 created: 2026-08-27 21:00-22:00', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('f9d0daa3-5f93-4cc9-b67c-97f7d947b08e', '2026-08-27 09:36:55.371984+00', 'payment_proof_submitted', 'booking', 'bk-e30ddf2e', 'customer', NULL, 'Payment proof submitted for BK-260827-8840', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('bec912f3-16e7-4d1c-a395-307d0d1652ad', '2026-08-27 09:43:55.476785+00', 'booking_created', 'booking', 'bk-3e746fde', 'customer', NULL, 'Booking BK-260827-7070 created: 2026-08-27 18:00-19:00', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('ffaedb66-ed02-4a6e-9e51-7bd62f9da84a', '2026-08-27 09:44:19.896018+00', 'payment_proof_submitted', 'booking', 'bk-3e746fde', 'customer', NULL, 'Payment proof submitted for BK-260827-7070', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('5ffeb68e-29b0-4b4d-a4fc-5de7a3c3ce9d', '2026-08-27 09:50:57.620031+00', 'booking_created', 'booking', 'bk-7c776dc4', 'customer', NULL, 'Booking BK-260827-41D8 created: 2026-08-27 19:00-20:00', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('4ca08070-c5a7-4150-94c8-e80fe99df733', '2026-08-27 09:51:45.243265+00', 'payment_proof_submitted', 'booking', 'bk-7c776dc4', 'customer', NULL, 'Payment proof submitted for BK-260827-41D8', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('6a70fbe9-fbdf-48c1-8248-20644da0ac0d', '2026-08-27 11:49:13.227036+00', 'booking_created', 'booking', 'bk-2fb478b3', 'customer', NULL, 'Booking BK-260827-14CE created: 2026-08-28 06:00-07:00', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('1e017661-f02d-423f-be82-0db36bfaf8b1', '2026-08-27 11:49:13.404025+00', 'payment_proof_submitted', 'booking', 'bk-2fb478b3', 'customer', NULL, 'Payment proof submitted for BK-260827-14CE', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('c02fbca3-2a93-47d8-869d-9f8381e5a04c', '2026-08-27 13:30:39.940661+00', 'booking_created', 'booking', 'bk-92f91ddd', 'customer', NULL, 'Booking BK-260827-408A created: 2026-08-28 07:00-08:00', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('02681c9b-cd23-4383-a114-a522432a118c', '2026-08-27 13:30:40.360822+00', 'payment_proof_submitted', 'booking', 'bk-92f91ddd', 'customer', NULL, 'Payment proof submitted for BK-260827-408A', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('d5009098-28bd-493f-a577-2ba8f576a65c', '2026-08-29 17:27:50.102801+00', 'booking_created', 'booking', 'bk-58bd289b', 'customer', NULL, 'Booking BK-260829-AC90 created: 2026-08-31 08:00-09:00', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('c933bbb3-f674-4332-a5d2-b97f8fd9c1d3', '2026-08-29 17:27:54.987603+00', 'payment_proof_submitted', 'booking', 'bk-58bd289b', 'customer', NULL, 'Payment proof submitted for BK-260829-AC90', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('4624e23e-58ed-4ace-a705-aad29f26be5b', '2026-08-29 17:28:05.089663+00', 'payment_confirmed', 'booking', 'bk-58bd289b', 'admin', 'admin', 'Payment confirmed for booking BK-260829-AC90', 'waiting_confirmation', 'paid');
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('a2c4df28-59ad-48de-b9cb-321f43c070cf', '2026-10-13 22:19:59.940414+00', 'update_settings', 'platform_settings', 'platform_fee_default,settlement_cutoff_hour,app_name', 'admin', 'super_admin', '{"updates":{"platform_fee_default":12,"settlement_cutoff_hour":22,"app_name":"Lapabook Test"}}', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('907e80aa-5163-421b-b268-c21b53b55b00', '2026-10-13 22:23:10.237279+00', 'customer_ban', 'customers', '4d1cc848-f796-434d-bcb8-57e201f8eb90', 'admin', 'admin', '{"customer_name":"Anwar","is_active":false}', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('4a24511c-7983-493b-a7a2-5fdaa0f2589d', '2026-10-13 22:23:10.539488+00', 'customer_unban', 'customers', '4d1cc848-f796-434d-bcb8-57e201f8eb90', 'admin', 'admin', '{"customer_name":"Anwar","is_active":true}', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('e26484a0-aad4-43e7-a728-a533f1cb9592', '2026-10-13 22:23:50.481481+00', 'customer_ban', 'customers', '4d1cc848-f796-434d-bcb8-57e201f8eb90', 'admin', 'admin', '{"customer_name":"Anwar","is_active":false}', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('45126501-f92d-49b2-8591-fbe9eda865e2', '2026-10-13 22:23:50.818316+00', 'customer_unban', 'customers', '4d1cc848-f796-434d-bcb8-57e201f8eb90', 'admin', 'admin', '{"customer_name":"Anwar","is_active":true}', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('e3731d0d-4df3-45f5-acd7-3d38b09d499b', '2026-10-13 22:24:02.049703+00', 'update_settings', 'platform_settings', 'platform_fee_default,settlement_cutoff_hour,app_name', 'admin', 'super_admin', '{"updates":{"platform_fee_default":10,"settlement_cutoff_hour":23,"app_name":"Lapabook"}}', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('9fa146b9-e211-44c0-bcad-214b57ccc04d', '2026-10-13 22:28:45.45331+00', 'booking_created', 'booking', 'bk-b20c6455', 'customer', NULL, 'Booking BK-261013-5800 created: 2026-10-14 07:00-09:00', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('5f45403f-973c-4486-ad32-a13246311080', '2026-10-13 22:29:02.299711+00', 'booking_created', 'booking', 'bk-84ea0398', 'customer', NULL, 'Booking BK-261013-9C4C created: 2026-10-14 12:00-14:00', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('20cf5e67-0437-40d8-87c5-334ea4a2ddd7', '2026-10-13 22:54:43.133289+00', 'booking_created', 'booking', 'bk-e2a17585', 'customer', NULL, 'Booking BK-261014-019F created: 2026-12-01 10:00-11:00', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('e687e687-51dd-4473-b859-ee8974ca3e2f', '2026-10-13 22:54:43.191771+00', 'booking_created', 'booking', 'bk-0558ec1b', 'customer', NULL, 'Booking BK-261014-3197 created: 2026-12-02 10:00-11:00', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('cf6643b6-a7c4-4696-9b04-740482fc4ae8', '2026-10-14 08:20:16.310295+00', 'booking_created', 'booking', 'bk-b0d4ff7c', 'customer', NULL, 'Booking BK-261014-6B15 created: 2026-10-14 20:00-22:00', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('c91d05b2-a18c-4cd9-a7f2-468ed5570e80', '2026-10-14 08:30:57.460168+00', 'booking_created', 'booking', 'bk-f1844d06', 'customer', NULL, 'Booking BK-261014-C7D4 created: 2026-10-20 20:00-21:00', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('c304b4a7-63a5-439a-9e8f-cb7534adec9a', '2026-10-14 08:33:52.703216+00', 'booking_created', 'booking', 'bk-a63a2853', 'customer', NULL, 'Booking BK-261014-CF47 created: 2026-10-21 20:00-21:00', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('e4ddeb9a-4c2f-4789-9cb2-9f659bf01187', '2026-10-14 08:58:54.275445+00', 'booking_created', 'booking', 'bk-3dd4be74', 'customer', NULL, 'Booking BK-261014-8D28 created: 2026-10-22 19:00-20:00', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('27a5a571-e634-497d-8c1e-2fdb0c8798dc', '2026-10-14 08:59:24.16895+00', 'payment_proof_submitted', 'booking', 'bk-3dd4be74', 'customer', NULL, 'Payment proof submitted for BK-261014-8D28', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('e0d86adf-3291-42db-b8ab-02a45aaa585e', '2026-10-14 09:00:48.174645+00', 'booking_created', 'booking', 'bk-4baf043c', 'customer', NULL, 'Booking BK-261014-0361 created: 2026-10-23 10:00-11:00', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('718b7ace-2402-46bf-b67a-9a9483f9c69d', '2026-10-14 09:00:59.284838+00', 'payment_proof_submitted', 'booking', 'bk-4baf043c', 'customer', NULL, 'Payment proof submitted for BK-261014-0361', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('50bb2d61-ca74-4ec2-a410-d53e0b0e7c83', '2026-10-14 18:03:31.684393+00', 'booking_created', 'booking', 'bk-441115e0', 'customer', NULL, 'Booking BK-261014-0FFD created: 2026-10-26 10:00-11:00', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('3c00f7c7-2371-4343-ab87-3850c3d75126', '2026-10-14 18:03:36.410998+00', 'payment_proof_submitted', 'booking', 'bk-441115e0', 'customer', NULL, 'Payment proof submitted for BK-261014-0FFD', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('4f6a2e27-c865-4cc2-8353-d50cd5c2057a', '2026-10-14 18:05:05.057477+00', 'payment_confirmed', 'booking', 'bk-441115e0', 'admin', 'admin', 'Payment confirmed for booking BK-261014-0FFD', 'waiting_confirmation', 'paid');
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('bfab7bcb-521c-4282-9a87-702fb6a6262d', '2026-10-14 18:05:09.189941+00', 'payment_proof_submitted', 'booking', 'bk-441115e0', 'customer', NULL, 'Payment proof submitted for BK-261014-0FFD', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('aba489a1-224f-4026-86f7-903e01577040', '2026-10-14 18:05:11.858318+00', 'payment_confirmed', 'booking', 'bk-441115e0', 'admin', 'admin', 'Payment confirmed for booking BK-261014-0FFD', 'waiting_confirmation', 'paid');
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('9a82bffd-b5c6-4617-9d3d-381fc8dedcfb', '2026-10-15 07:08:28.9501+00', 'booking_created', 'booking', 'bk-cab37ff4', 'customer', NULL, 'Booking BK-261015-A754 created: 2026-10-15 18:00-20:00', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('30774c70-082b-4454-b99b-328fd2110832', '2026-10-15 07:13:39.066705+00', 'booking_created', 'booking', 'bk-1737c5e7', 'customer', NULL, 'Booking BK-261015-5055 created: 2026-10-28 18:00-20:00', NULL, NULL);
INSERT INTO public.audit_logs (id, "timestamp", action, target_type, target_id, actor_type, actor_id, details, previous_value, new_value) VALUES ('8b19e9ab-8a64-42db-a457-c12f48b54d84', '2026-10-15 07:13:52.981744+00', 'payment_proof_submitted', 'booking', 'bk-1737c5e7', 'customer', NULL, 'Payment proof submitted for BK-261015-5055', NULL, NULL);


--
-- Data for Name: sports; Type: TABLE DATA; Schema: public; Owner: brodit
--

INSERT INTO public.sports (id, name, slug, icon, is_active, created_at, updated_at) VALUES ('sport-futsal', 'Futsal', 'futsal', '⚽', true, '2026-07-13 05:56:46.967919+00', '2026-07-13 05:56:46.967919+00');
INSERT INTO public.sports (id, name, slug, icon, is_active, created_at, updated_at) VALUES ('sport-bulu-tangkis', 'Bulu Tangkis', 'bulu-tangkis', '🏸', true, '2026-07-13 05:56:46.967919+00', '2026-07-13 05:56:46.967919+00');
INSERT INTO public.sports (id, name, slug, icon, is_active, created_at, updated_at) VALUES ('sport-mini-soccer', 'Mini Soccer', 'mini-soccer', '⚽', true, '2026-07-13 05:56:46.967919+00', '2026-07-13 05:56:46.967919+00');
INSERT INTO public.sports (id, name, slug, icon, is_active, created_at, updated_at) VALUES ('sport-padel', 'Padel', 'padel', '🎾', true, '2026-07-13 05:56:46.967919+00', '2026-07-13 05:56:46.967919+00');
INSERT INTO public.sports (id, name, slug, icon, is_active, created_at, updated_at) VALUES ('sport-tenis', 'Tenis', 'tenis', '🎾', true, '2026-07-13 05:56:46.967919+00', '2026-07-13 05:56:46.967919+00');
INSERT INTO public.sports (id, name, slug, icon, is_active, created_at, updated_at) VALUES ('sport-basket', 'Basket', 'basket', '🏀', true, '2026-07-13 05:56:46.967919+00', '2026-07-13 05:56:46.967919+00');


--
-- Data for Name: venue_owners; Type: TABLE DATA; Schema: public; Owner: brodit
--

INSERT INTO public.venue_owners (id, admin_id, business_name, pic_name, phone, email, status, created_at, updated_at) VALUES ('owner-greenfield', 'admin-andi-greenfield', 'Greenfield Sports Club', 'Andi Wijaya', '081234567890', 'andi@greenfield.id', 'active', '2026-07-13 05:56:46.966405+00', '2026-07-13 05:56:46.966405+00');
INSERT INTO public.venue_owners (id, admin_id, business_name, pic_name, phone, email, status, created_at, updated_at) VALUES ('owner-rahasian', 'admin-budi-rahasian', 'Rahasia Badminton Arena', 'Budi Santoso', '082345678901', 'budi@rahasian.id', 'active', '2026-07-13 05:56:46.966405+00', '2026-07-13 05:56:46.966405+00');
INSERT INTO public.venue_owners (id, admin_id, business_name, pic_name, phone, email, status, created_at, updated_at) VALUES ('owner-arena-futsal', 'admin-charlie-arena', 'Arena Futsal Bandung', 'Charlie Putra', '083456789012', 'charlie@arenafutsal.id', 'active', '2026-07-13 05:56:46.966405+00', '2026-07-13 05:56:46.966405+00');
INSERT INTO public.venue_owners (id, admin_id, business_name, pic_name, phone, email, status, created_at, updated_at) VALUES ('owner-demo-1', 'owner-1', 'Lapangin Demo Owner', 'Demo Owner', '081234567890', 'owner@lapangin.id', 'active', '2026-08-30 15:46:08.956243+00', '2026-08-30 15:46:08.956243+00');


--
-- Data for Name: venues; Type: TABLE DATA; Schema: public; Owner: brodit
--

INSERT INTO public.venues (id, name, slug, owner_id, area_id, address, phone, email, description, maps_url, open_time, close_time, facilities, images, approval_status, is_active, created_at, updated_at, avg_rating, review_count, rain_discount_config, commission_rate, platform_fee_type, platform_fee_value) VALUES ('venue-greenfield', 'Greenfield Sports Club', 'greenfield-sports-club', 'owner-greenfield', 'area-bdg-kota', 'Jl. Golf No. 10, Bandung', '022-1234567', 'info@greenfield.id', 'Venue olahraga lengkap di pusat kota Bandung.', '', '06:00:00', '23:00:00', '["Parkir", "Toilet", "Kantin", "Ruang Ganti", "WiFi"]', NULL, 'active', true, '2026-07-13 05:56:46.969543+00', '2026-07-13 05:56:46.969543+00', 4.50, 4, '{"levels": {"heavy": {"discountPercent": 30}, "light": {"discountPercent": 10}, "moderate": {"discountPercent": 20}}, "enabled": true}', 10.00, 'percentage', 0.00);
INSERT INTO public.venues (id, name, slug, owner_id, area_id, address, phone, email, description, maps_url, open_time, close_time, facilities, images, approval_status, is_active, created_at, updated_at, avg_rating, review_count, rain_discount_config, commission_rate, platform_fee_type, platform_fee_value) VALUES ('venue-rahasian', 'Rahasia Badminton Arena', 'rahasian-badminton', 'owner-rahasian', 'area-jkt-selatan', 'Jl. Kemang Raya No. 25, Jakarta Selatan', '021-9876543', 'info@rahasian.id', 'Arena badminton premium ber-AC dengan 8 lapangan.', '', '07:00:00', '22:00:00', '["Parkir", "Toilet", "Kantin", "Ruang Ganti", "WiFi", "AC"]', NULL, 'active', true, '2026-07-13 05:56:46.969543+00', '2026-07-13 05:56:46.969543+00', 3.00, 1, '{"enabled": false}', 10.00, 'percentage', 0.00);
INSERT INTO public.venues (id, name, slug, owner_id, area_id, address, phone, email, description, maps_url, open_time, close_time, facilities, images, approval_status, is_active, created_at, updated_at, avg_rating, review_count, rain_discount_config, commission_rate, platform_fee_type, platform_fee_value) VALUES ('venue-arena-futsal', 'Arena Futsal Bandung', 'arena-futsal-bandung', 'owner-arena-futsal', 'area-bdg-kota', 'Jl. Setiabudhi No. 50, Bandung', '022-5551234', 'info@arenafutsal.id', 'Lapangan futsal standar FIFA dengan rumput sintetis.', '', '06:00:00', '23:00:00', '["Parkir", "Toilet", "Kantin", "Ruang Ganti"]', NULL, 'active', true, '2026-07-13 05:56:46.969543+00', '2026-07-13 05:56:46.969543+00', 0.00, 0, '{"enabled": false}', 10.00, 'percentage', 0.00);
INSERT INTO public.venues (id, name, slug, owner_id, area_id, address, phone, email, description, maps_url, open_time, close_time, facilities, images, approval_status, is_active, created_at, updated_at, avg_rating, review_count, rain_discount_config, commission_rate, platform_fee_type, platform_fee_value) VALUES ('venue-dps-sunset', 'Sunset Sports Bali', 'sunset-sports-bali', 'owner-demo-1', 'area-blp-kota', 'Jl. Pantai Berawa No. 88, Denpasar', '0361-555001', 'info@sunsetsportsbali.id', 'Venue futsal outdoor dan badminton indoor dekat pantai. Sunset view dari sideline.', '', '07:00:00', '23:00:00', '["Parkir", "Toilet", "Kantin", "Shower"]', NULL, 'active', true, '2026-10-13 17:12:38.758491+00', '2026-10-13 17:12:38.758491+00', 0.00, 0, '{"enabled": false}', 10.00, 'percentage', 0.00);
INSERT INTO public.venues (id, name, slug, owner_id, area_id, address, phone, email, description, maps_url, open_time, close_time, facilities, images, approval_status, is_active, created_at, updated_at, avg_rating, review_count, rain_discount_config, commission_rate, platform_fee_type, platform_fee_value) VALUES ('venue-mdn-merdeka', 'Merdeka Futsal Medan', 'merdeka-futsal-medan', 'owner-demo-1', 'area-mdn-kota', 'Jl. Merdeka No. 12, Medan', '061-555002', 'booking@merdekafutsal.id', 'Futsal indoor premium dan lapangan basket standar di pusat kota Medan.', '', '07:00:00', '23:00:00', '["Parkir", "Toilet", "Kantin", "Ruang Ganti", "AC"]', NULL, 'active', true, '2026-10-13 17:12:38.758491+00', '2026-10-13 17:12:38.758491+00', 0.00, 0, '{"enabled": false}', 10.00, 'percentage', 0.00);
INSERT INTO public.venues (id, name, slug, owner_id, area_id, address, phone, email, description, maps_url, open_time, close_time, facilities, images, approval_status, is_active, created_at, updated_at, avg_rating, review_count, rain_discount_config, commission_rate, platform_fee_type, platform_fee_value) VALUES ('venue-smg-tinjomoyo', 'Tinjomoyo Sport Center', 'tinjomoyo-sport-center', 'owner-demo-1', 'area-smg-kota', 'Jl. Tinjomoyo Raya No. 45, Semarang', '024-555003', 'halo@tinjomoyosport.id', 'Sport center lengkap Semarang: futsal dan padel court pertama di kota.', '', '06:00:00', '23:00:00', '["Parkir", "Toilet", "Kantin", "WiFi"]', NULL, 'active', true, '2026-10-13 17:12:38.758491+00', '2026-10-13 17:12:38.758491+00', 0.00, 0, '{"enabled": false}', 10.00, 'percentage', 0.00);
INSERT INTO public.venues (id, name, slug, owner_id, area_id, address, phone, email, description, maps_url, open_time, close_time, facilities, images, approval_status, is_active, created_at, updated_at, avg_rating, review_count, rain_discount_config, commission_rate, platform_fee_type, platform_fee_value) VALUES ('venue-sby-mulyorejo', 'Mulyorejo Sports Surabaya', 'mulyorejo-sports-surabaya', 'owner-demo-1', 'area-sby-kota', 'Jl. Mulyorejo Utara No. 100, Surabaya', '031-555004', 'info@mulyorejosports.id', 'Venue futsal dan bulu tangkis favorit warga Surabaya Timur.', '', '07:00:00', '23:00:00', '["Parkir", "Toilet", "Kantin", "Ruang Ganti"]', NULL, 'active', true, '2026-10-13 17:12:38.758491+00', '2026-10-13 17:12:38.758491+00', 0.00, 0, '{"levels": {"heavy": {"discountPercent": 30}, "light": {"discountPercent": 10}, "moderate": {"discountPercent": 20}}, "enabled": true}', 10.00, 'percentage', 0.00);
INSERT INTO public.venues (id, name, slug, owner_id, area_id, address, phone, email, description, maps_url, open_time, close_time, facilities, images, approval_status, is_active, created_at, updated_at, avg_rating, review_count, rain_discount_config, commission_rate, platform_fee_type, platform_fee_value) VALUES ('venue-yog-maguwo', 'Maguwo Sports Jogja', 'maguwo-sports-jogja', 'owner-demo-1', 'area-yog-kota', 'Jl. Laksda Adisutjipto KM 8, Yogyakarta', '0274-555005', 'booking@maguwosports.id', 'Arena futsal dan tenis dekat stadion Maguwoharjo. Parkir luas.', '', '06:00:00', '23:00:00', '["Parkir", "Toilet", "Kantin", "WiFi"]', NULL, 'active', true, '2026-10-13 17:12:38.758491+00', '2026-10-13 17:12:38.758491+00', 0.00, 0, '{"enabled": false}', 10.00, 'percentage', 0.00);


--
-- Data for Name: courts; Type: TABLE DATA; Schema: public; Owner: brodit
--

INSERT INTO public.courts (id, venue_id, sport_id, name, slug, surface_type, indoor_type, capacity, base_price, is_active, created_at, updated_at) VALUES ('court-f1', 'venue-greenfield', 'sport-futsal', 'Futsal Court 1', 'futsal-1', 'Synthetic', 'indoor', 10, 150000, true, '2026-07-13 05:56:46.973037+00', '2026-07-13 05:56:46.973037+00');
INSERT INTO public.courts (id, venue_id, sport_id, name, slug, surface_type, indoor_type, capacity, base_price, is_active, created_at, updated_at) VALUES ('court-f2', 'venue-greenfield', 'sport-futsal', 'Futsal Court 2', 'futsal-2', 'Synthetic', 'indoor', 10, 120000, true, '2026-07-13 05:56:46.973037+00', '2026-07-13 05:56:46.973037+00');
INSERT INTO public.courts (id, venue_id, sport_id, name, slug, surface_type, indoor_type, capacity, base_price, is_active, created_at, updated_at) VALUES ('court-b1', 'venue-greenfield', 'sport-bulu-tangkis', 'Badminton Court 1', 'badminton-1', 'Synthetic', 'indoor', 4, 80000, true, '2026-07-13 05:56:46.973037+00', '2026-07-13 05:56:46.973037+00');
INSERT INTO public.courts (id, venue_id, sport_id, name, slug, surface_type, indoor_type, capacity, base_price, is_active, created_at, updated_at) VALUES ('court-b2', 'venue-greenfield', 'sport-bulu-tangkis', 'Badminton Court 2', 'badminton-2', 'Synthetic', 'indoor', 4, 80000, true, '2026-07-13 05:56:46.973037+00', '2026-07-13 05:56:46.973037+00');
INSERT INTO public.courts (id, venue_id, sport_id, name, slug, surface_type, indoor_type, capacity, base_price, is_active, created_at, updated_at) VALUES ('court-b3', 'venue-greenfield', 'sport-bulu-tangkis', 'Badminton Court 3', 'badminton-3', 'Synthetic', 'indoor', 4, 80000, true, '2026-07-13 05:56:46.973037+00', '2026-07-13 05:56:46.973037+00');
INSERT INTO public.courts (id, venue_id, sport_id, name, slug, surface_type, indoor_type, capacity, base_price, is_active, created_at, updated_at) VALUES ('court-p1', 'venue-greenfield', 'sport-padel', 'Padel Court 1', 'padel-1', 'Artificial Grass', 'outdoor', 4, 150000, true, '2026-07-13 05:56:46.973037+00', '2026-07-13 05:56:46.973037+00');
INSERT INTO public.courts (id, venue_id, sport_id, name, slug, surface_type, indoor_type, capacity, base_price, is_active, created_at, updated_at) VALUES ('court-ms1', 'venue-greenfield', 'sport-mini-soccer', 'Mini Soccer Field 1', 'mini-soccer-1', 'Artificial Grass', 'outdoor', 4, 150000, true, '2026-07-13 05:56:46.973037+00', '2026-07-13 05:56:46.973037+00');
INSERT INTO public.courts (id, venue_id, sport_id, name, slug, surface_type, indoor_type, capacity, base_price, is_active, created_at, updated_at) VALUES ('court-t1', 'venue-greenfield', 'sport-tenis', 'Tenis Court 1', 'tenis-1', 'Hard Court', 'outdoor', 4, 100000, true, '2026-07-13 05:56:46.973037+00', '2026-07-13 05:56:46.973037+00');
INSERT INTO public.courts (id, venue_id, sport_id, name, slug, surface_type, indoor_type, capacity, base_price, is_active, created_at, updated_at) VALUES ('court-bsk1', 'venue-greenfield', 'sport-basket', 'Basket Court 1', 'basket-1', 'Hard Court', 'outdoor', 10, 100000, true, '2026-07-13 05:56:46.973037+00', '2026-07-13 05:56:46.973037+00');
INSERT INTO public.courts (id, venue_id, sport_id, name, slug, surface_type, indoor_type, capacity, base_price, is_active, created_at, updated_at) VALUES ('court-b4', 'venue-rahasian', 'sport-bulu-tangkis', 'Badminton Court 1', 'badminton-1', 'Synthetic', 'indoor', 4, 90000, true, '2026-07-13 05:56:46.973037+00', '2026-07-13 05:56:46.973037+00');
INSERT INTO public.courts (id, venue_id, sport_id, name, slug, surface_type, indoor_type, capacity, base_price, is_active, created_at, updated_at) VALUES ('court-b5', 'venue-rahasian', 'sport-bulu-tangkis', 'Badminton Court 2', 'badminton-2', 'Synthetic', 'indoor', 4, 90000, true, '2026-07-13 05:56:46.973037+00', '2026-07-13 05:56:46.973037+00');
INSERT INTO public.courts (id, venue_id, sport_id, name, slug, surface_type, indoor_type, capacity, base_price, is_active, created_at, updated_at) VALUES ('court-b6', 'venue-rahasian', 'sport-bulu-tangkis', 'Badminton Court 3', 'badminton-3', 'Synthetic', 'indoor', 4, 85000, true, '2026-07-13 05:56:46.973037+00', '2026-07-13 05:56:46.973037+00');
INSERT INTO public.courts (id, venue_id, sport_id, name, slug, surface_type, indoor_type, capacity, base_price, is_active, created_at, updated_at) VALUES ('court-b7', 'venue-rahasian', 'sport-bulu-tangkis', 'Badminton Court 4', 'badminton-4', 'Synthetic', 'indoor', 4, 85000, true, '2026-07-13 05:56:46.973037+00', '2026-07-13 05:56:46.973037+00');
INSERT INTO public.courts (id, venue_id, sport_id, name, slug, surface_type, indoor_type, capacity, base_price, is_active, created_at, updated_at) VALUES ('court-f3', 'venue-arena-futsal', 'sport-futsal', 'Futsal Court 1', 'futsal-1', 'Synthetic', 'indoor', 10, 130000, true, '2026-07-13 05:56:46.973037+00', '2026-07-13 05:56:46.973037+00');
INSERT INTO public.courts (id, venue_id, sport_id, name, slug, surface_type, indoor_type, capacity, base_price, is_active, created_at, updated_at) VALUES ('court-f4', 'venue-arena-futsal', 'sport-futsal', 'Futsal Court 2', 'futsal-2', 'Synthetic', 'indoor', 10, 130000, true, '2026-07-13 05:56:46.973037+00', '2026-07-13 05:56:46.973037+00');
INSERT INTO public.courts (id, venue_id, sport_id, name, slug, surface_type, indoor_type, capacity, base_price, is_active, created_at, updated_at) VALUES ('court-f5', 'venue-arena-futsal', 'sport-futsal', 'Futsal Court 3', 'futsal-3', 'Synthetic', 'indoor', 10, 110000, true, '2026-07-13 05:56:46.973037+00', '2026-07-13 05:56:46.973037+00');
INSERT INTO public.courts (id, venue_id, sport_id, name, slug, surface_type, indoor_type, capacity, base_price, is_active, created_at, updated_at) VALUES ('court-dps-f1', 'venue-dps-sunset', 'sport-futsal', 'Futsal Court A (Sunset Side)', 'futsal-a', 'Rumput Sintetis', 'outdoor', 14, 120000, true, '2026-10-13 17:12:38.76442+00', '2026-10-13 17:12:38.76442+00');
INSERT INTO public.courts (id, venue_id, sport_id, name, slug, surface_type, indoor_type, capacity, base_price, is_active, created_at, updated_at) VALUES ('court-dps-f2', 'venue-dps-sunset', 'sport-futsal', 'Futsal Court B', 'futsal-b', 'Rumput Sintetis', 'outdoor', 14, 110000, true, '2026-10-13 17:12:38.76442+00', '2026-10-13 17:12:38.76442+00');
INSERT INTO public.courts (id, venue_id, sport_id, name, slug, surface_type, indoor_type, capacity, base_price, is_active, created_at, updated_at) VALUES ('court-dps-b1', 'venue-dps-sunset', 'sport-bulu-tangkis', 'Badminton Court 1', 'badminton-1', 'Vinyl', 'indoor', 4, 65000, true, '2026-10-13 17:12:38.76442+00', '2026-10-13 17:12:38.76442+00');
INSERT INTO public.courts (id, venue_id, sport_id, name, slug, surface_type, indoor_type, capacity, base_price, is_active, created_at, updated_at) VALUES ('court-dps-b2', 'venue-dps-sunset', 'sport-bulu-tangkis', 'Badminton Court 2', 'badminton-2', 'Vinyl', 'indoor', 4, 65000, true, '2026-10-13 17:12:38.76442+00', '2026-10-13 17:12:38.76442+00');
INSERT INTO public.courts (id, venue_id, sport_id, name, slug, surface_type, indoor_type, capacity, base_price, is_active, created_at, updated_at) VALUES ('court-mdn-f1', 'venue-mdn-merdeka', 'sport-futsal', 'Futsal Merdeka 1', 'futsal-1', 'Rumput Sintetis', 'indoor', 14, 100000, true, '2026-10-13 17:12:38.76442+00', '2026-10-13 17:12:38.76442+00');
INSERT INTO public.courts (id, venue_id, sport_id, name, slug, surface_type, indoor_type, capacity, base_price, is_active, created_at, updated_at) VALUES ('court-mdn-f2', 'venue-mdn-merdeka', 'sport-futsal', 'Futsal Merdeka 2', 'futsal-2', 'Rumput Sintetis', 'indoor', 14, 90000, true, '2026-10-13 17:12:38.76442+00', '2026-10-13 17:12:38.76442+00');
INSERT INTO public.courts (id, venue_id, sport_id, name, slug, surface_type, indoor_type, capacity, base_price, is_active, created_at, updated_at) VALUES ('court-mdn-bsk1', 'venue-mdn-merdeka', 'sport-basket', 'Basket Court Merdeka', 'basket-1', 'Vinyl', 'indoor', 12, 140000, true, '2026-10-13 17:12:38.76442+00', '2026-10-13 17:12:38.76442+00');
INSERT INTO public.courts (id, venue_id, sport_id, name, slug, surface_type, indoor_type, capacity, base_price, is_active, created_at, updated_at) VALUES ('court-smg-f1', 'venue-smg-tinjomoyo', 'sport-futsal', 'Futsal Tinjomoyo 1', 'futsal-1', 'Rumput Sintetis', 'indoor', 14, 95000, true, '2026-10-13 17:12:38.76442+00', '2026-10-13 17:12:38.76442+00');
INSERT INTO public.courts (id, venue_id, sport_id, name, slug, surface_type, indoor_type, capacity, base_price, is_active, created_at, updated_at) VALUES ('court-smg-f2', 'venue-smg-tinjomoyo', 'sport-futsal', 'Futsal Tinjomoyo 2', 'futsal-2', 'Rumput Sintetis', 'semi_outdoor', 14, 85000, true, '2026-10-13 17:12:38.76442+00', '2026-10-13 17:12:38.76442+00');
INSERT INTO public.courts (id, venue_id, sport_id, name, slug, surface_type, indoor_type, capacity, base_price, is_active, created_at, updated_at) VALUES ('court-smg-p1', 'venue-smg-tinjomoyo', 'sport-padel', 'Padel Court Semarang', 'padel-1', 'Artificial Turf', 'outdoor', 8, 200000, true, '2026-10-13 17:12:38.76442+00', '2026-10-13 17:12:38.76442+00');
INSERT INTO public.courts (id, venue_id, sport_id, name, slug, surface_type, indoor_type, capacity, base_price, is_active, created_at, updated_at) VALUES ('court-sby-f1', 'venue-sby-mulyorejo', 'sport-futsal', 'Futsal Mulyorejo 1', 'futsal-1', 'Rumput Sintetis', 'indoor', 14, 110000, true, '2026-10-13 17:12:38.76442+00', '2026-10-13 17:12:38.76442+00');
INSERT INTO public.courts (id, venue_id, sport_id, name, slug, surface_type, indoor_type, capacity, base_price, is_active, created_at, updated_at) VALUES ('court-sby-f2', 'venue-sby-mulyorejo', 'sport-futsal', 'Futsal Mulyorejo 2', 'futsal-2', 'Rumput Sintetis', 'indoor', 14, 100000, true, '2026-10-13 17:12:38.76442+00', '2026-10-13 17:12:38.76442+00');
INSERT INTO public.courts (id, venue_id, sport_id, name, slug, surface_type, indoor_type, capacity, base_price, is_active, created_at, updated_at) VALUES ('court-sby-b1', 'venue-sby-mulyorejo', 'sport-bulu-tangkis', 'Badminton SBY 1', 'badminton-1', 'Vinyl', 'indoor', 4, 55000, true, '2026-10-13 17:12:38.76442+00', '2026-10-13 17:12:38.76442+00');
INSERT INTO public.courts (id, venue_id, sport_id, name, slug, surface_type, indoor_type, capacity, base_price, is_active, created_at, updated_at) VALUES ('court-sby-b2', 'venue-sby-mulyorejo', 'sport-bulu-tangkis', 'Badminton SBY 2', 'badminton-2', 'Vinyl', 'indoor', 4, 55000, true, '2026-10-13 17:12:38.76442+00', '2026-10-13 17:12:38.76442+00');
INSERT INTO public.courts (id, venue_id, sport_id, name, slug, surface_type, indoor_type, capacity, base_price, is_active, created_at, updated_at) VALUES ('court-yog-f1', 'venue-yog-maguwo', 'sport-futsal', 'Futsal Maguwo 1', 'futsal-1', 'Rumput Sintetis', 'semi_outdoor', 14, 80000, true, '2026-10-13 17:12:38.76442+00', '2026-10-13 17:12:38.76442+00');
INSERT INTO public.courts (id, venue_id, sport_id, name, slug, surface_type, indoor_type, capacity, base_price, is_active, created_at, updated_at) VALUES ('court-yog-f2', 'venue-yog-maguwo', 'sport-futsal', 'Futsal Maguwo 2', 'futsal-2', 'Rumput Sintetis', 'semi_outdoor', 14, 75000, true, '2026-10-13 17:12:38.76442+00', '2026-10-13 17:12:38.76442+00');
INSERT INTO public.courts (id, venue_id, sport_id, name, slug, surface_type, indoor_type, capacity, base_price, is_active, created_at, updated_at) VALUES ('court-yog-t1', 'venue-yog-maguwo', 'sport-tenis', 'Tenis Maguwo', 'tenis-1', 'Hard Court', 'outdoor', 4, 90000, true, '2026-10-13 17:12:38.76442+00', '2026-10-13 17:12:38.76442+00');


--
-- Data for Name: blocked_slots; Type: TABLE DATA; Schema: public; Owner: brodit
--



--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: brodit
--

INSERT INTO public.customers (id, name, email, phone, password_hash, avatar, is_verified, is_active, loyalty_points, total_spent, member_since, last_login_at, created_at, updated_at) VALUES ('f3f38ac3-1cc2-42e2-bafd-a8ab91753923', 'John Doe', 'john@example.com', '081234567890', '$2b$10$dGoqwao.RvSFwj0VhYkoneaMGX0SYXKz8YdD/sA0xQMaAn6Dq7ZAW', NULL, true, true, 250, 750000, '2026-06-01 00:00:00+00', NULL, '2026-07-13 05:56:46.99622+00', '2026-07-13 05:56:46.99622+00');
INSERT INTO public.customers (id, name, email, phone, password_hash, avatar, is_verified, is_active, loyalty_points, total_spent, member_since, last_login_at, created_at, updated_at) VALUES ('4a3c8931-2740-4989-81b0-2719474ef180', 'Jane Smith', 'jane@example.com', '081234567891', '$2b$10$dGoqwao.RvSFwj0VhYkoneaMGX0SYXKz8YdD/sA0xQMaAn6Dq7ZAW', NULL, true, true, 180, 540000, '2026-06-15 00:00:00+00', NULL, '2026-07-13 05:56:46.99622+00', '2026-07-13 05:56:46.99622+00');
INSERT INTO public.customers (id, name, email, phone, password_hash, avatar, is_verified, is_active, loyalty_points, total_spent, member_since, last_login_at, created_at, updated_at) VALUES ('837637b4-2ffb-4254-94c0-abc753963219', 'Bob Wilson', 'bob@example.com', '081234567892', '$2b$10$dGoqwao.RvSFwj0VhYkoneaMGX0SYXKz8YdD/sA0xQMaAn6Dq7ZAW', NULL, true, true, 120, 360000, '2026-06-20 00:00:00+00', NULL, '2026-07-13 05:56:46.99622+00', '2026-07-13 05:56:46.99622+00');
INSERT INTO public.customers (id, name, email, phone, password_hash, avatar, is_verified, is_active, loyalty_points, total_spent, member_since, last_login_at, created_at, updated_at) VALUES ('b1670a37-9d00-4372-8258-8b2a6dfb2d6f', 'E2E Customer', 'e2e-1787821768114@test.com', '08123456789', '$2b$12$ZZbeVEm2NJ0EA9zURbl7H.CztBGvndrmLaRcK6MjQVFTaQZVb/Hia', NULL, false, true, 0, 0, '2026-08-27 09:09:39.247134+00', NULL, '2026-08-27 09:09:39.247134+00', '2026-08-27 09:09:39.247134+00');
INSERT INTO public.customers (id, name, email, phone, password_hash, avatar, is_verified, is_active, loyalty_points, total_spent, member_since, last_login_at, created_at, updated_at) VALUES ('f8c90bdf-66d7-4b54-9e31-3d7f725eadc2', 'E2E Customer', 'e2e-1787822002530@test.com', '08123456789', '$2b$12$yojey4luhdVaG9MZCEd83eUgMkCymSwtxykK/u8EixrktoZnpgYxC', NULL, false, true, 0, 0, '2026-08-27 09:13:25.452337+00', NULL, '2026-08-27 09:13:25.452337+00', '2026-08-27 09:13:25.452337+00');
INSERT INTO public.customers (id, name, email, phone, password_hash, avatar, is_verified, is_active, loyalty_points, total_spent, member_since, last_login_at, created_at, updated_at) VALUES ('3f911abb-d744-460b-a1e4-15d7c400e689', 'Tester Basket', 'basket-1787839220@test.com', '081234567890', '$2b$12$Ag.qBsP7ZQshgbD13s/Yoe2ZNu94MORODcDFG08DKdM6aBFn0iYiW', NULL, false, true, 50000, 0, '2026-08-27 14:00:20.531212+00', NULL, '2026-08-27 14:00:20.531212+00', '2026-08-27 14:00:22.488868+00');
INSERT INTO public.customers (id, name, email, phone, password_hash, avatar, is_verified, is_active, loyalty_points, total_spent, member_since, last_login_at, created_at, updated_at) VALUES ('85017077-dbeb-4b09-a686-2070f4dd65aa', 'Raka Padel Baru', 'padelbaru1787823777@example.com', '081287823777', '$2b$12$1GX55iN5ILq.SDgXZ1alf.B/tk2A6c6/RLGfLFRD1Mqtsjk9qXERC', NULL, false, true, 50032, 0, '2026-08-27 09:42:58.32315+00', NULL, '2026-08-27 09:42:58.32315+00', '2026-08-27 09:45:25.033696+00');
INSERT INTO public.customers (id, name, email, phone, password_hash, avatar, is_verified, is_active, loyalty_points, total_spent, member_since, last_login_at, created_at, updated_at) VALUES ('5e3ad1e5-5b58-46c2-8a9c-3c4c4250bb02', 'Teman Raka', 'teman1787823924@example.com', '081987823924', '$2b$12$GEeR26wvxzFg8WKfwhIg0OR1kfMHKhyFe4CsFUp.dGGtmsznrgryS', NULL, false, true, 25000, 0, '2026-08-27 09:45:24.874002+00', NULL, '2026-08-27 09:45:24.874002+00', '2026-08-27 09:45:25.035589+00');
INSERT INTO public.customers (id, name, email, phone, password_hash, avatar, is_verified, is_active, loyalty_points, total_spent, member_since, last_login_at, created_at, updated_at) VALUES ('caee7a15-bda7-48e8-8c2c-147d026adf9e', 'Tester Basket2', 'basket2-1787839220@test.com', '081234567891', '$2b$12$3GG/yZ91TjkQwPcHLXXs4.Mu.TfbgqjZTP8SdVYlDk5jdTspHmALq', NULL, false, true, 25000, 0, '2026-08-27 14:00:22.025027+00', NULL, '2026-08-27 14:00:22.025027+00', '2026-08-27 14:00:22.48982+00');
INSERT INTO public.customers (id, name, email, phone, password_hash, avatar, is_verified, is_active, loyalty_points, total_spent, member_since, last_login_at, created_at, updated_at) VALUES ('fb913253-5cc7-4f5c-8504-43a7bf2d1d66', 'Raka Live Padel', 'rakalive1787824000@example.com', '081278240000', '$2b$12$ta/stZgel9uIPc60c30LX.ghE0CPKt5LVV3MVfFVvaT66Gi9R3I.O', NULL, false, true, 36, 0, '2026-08-27 09:47:03.641111+00', NULL, '2026-08-27 09:47:03.641111+00', '2026-08-27 09:52:06.636112+00');
INSERT INTO public.customers (id, name, email, phone, password_hash, avatar, is_verified, is_active, loyalty_points, total_spent, member_since, last_login_at, created_at, updated_at) VALUES ('5d986440-783d-440b-a5c8-0971b96abd44', 'Live Basket Tester', 'live-basket-1787831352236@test.com', '081234567890', '$2b$12$iYCdAtHhB7k5xZS2Zm7.s.2SIx.cbUKGAHTQhtB/WHTSbAUOsKnne', NULL, false, true, 0, 0, '2026-08-27 11:49:12.677599+00', NULL, '2026-08-27 11:49:12.677599+00', '2026-08-27 11:49:12.677599+00');
INSERT INTO public.customers (id, name, email, phone, password_hash, avatar, is_verified, is_active, loyalty_points, total_spent, member_since, last_login_at, created_at, updated_at) VALUES ('8f8874af-4b82-4542-aece-0823e67f304d', 'Tester Basket', 'basket-1787837438@test.com', '081234567890', '$2b$12$zZVkloIrMK.yVREGmx3BCuDdF9CT5TUhon0vyzNdP1OVQkxRZTyq6', NULL, false, true, 50000, 0, '2026-08-27 13:30:39.290548+00', NULL, '2026-08-27 13:30:39.290548+00', '2026-08-27 13:30:41.600216+00');
INSERT INTO public.customers (id, name, email, phone, password_hash, avatar, is_verified, is_active, loyalty_points, total_spent, member_since, last_login_at, created_at, updated_at) VALUES ('5338b1e8-aa19-441f-8fa4-f167a6d7482f', 'Tester Basket2', 'basket2-1787837438@test.com', '081234567891', '$2b$12$mHhyWeUerNp0o2jFyayncu8ss7PdtvzEuxXIj3wxWjPwd6jB9uFW2', NULL, false, true, 25000, 0, '2026-08-27 13:30:41.109647+00', NULL, '2026-08-27 13:30:41.109647+00', '2026-08-27 13:30:41.601886+00');
INSERT INTO public.customers (id, name, email, phone, password_hash, avatar, is_verified, is_active, loyalty_points, total_spent, member_since, last_login_at, created_at, updated_at) VALUES ('6f271a9b-4c41-4711-a633-0eace6a7f633', 'E2E Customer', 'e2e-1787837550899-12rl2y@test.com', '08123456789', '$2b$12$b30tDWn5TR0r7d8.P.S6meqJVgjogBqMyll26dRMoANyACSoREmZK', NULL, false, true, 0, 0, '2026-08-27 13:32:34.443468+00', NULL, '2026-08-27 13:32:34.443468+00', '2026-08-27 13:32:34.443468+00');
INSERT INTO public.customers (id, name, email, phone, password_hash, avatar, is_verified, is_active, loyalty_points, total_spent, member_since, last_login_at, created_at, updated_at) VALUES ('cf9573d1-6c3a-4a72-b68f-c16060de709e', 'E2E Customer', 'e2e-1787837656095-ofskpa@test.com', '08123456789', '$2b$12$C7HlF5Fl4yd7ujZnHXwUMuNyHda1yYjwZyuaP6QM9/bpDuyK5WSt2', NULL, false, true, 0, 0, '2026-08-27 13:34:19.049882+00', NULL, '2026-08-27 13:34:19.049882+00', '2026-08-27 13:34:19.049882+00');
INSERT INTO public.customers (id, name, email, phone, password_hash, avatar, is_verified, is_active, loyalty_points, total_spent, member_since, last_login_at, created_at, updated_at) VALUES ('07428b68-0af8-4c5c-8d3b-1070ed7a25cd', 'E2E Customer', 'e2e-1787837760337-7hjdie@test.com', '08123456789', '$2b$12$.LKcKNLFAWswtAOraBejJOO3j8uAsmO8VPpmu1ng6/7sk9y135Pn6', NULL, false, true, 0, 0, '2026-08-27 13:36:03.2806+00', NULL, '2026-08-27 13:36:03.2806+00', '2026-08-27 13:36:03.2806+00');
INSERT INTO public.customers (id, name, email, phone, password_hash, avatar, is_verified, is_active, loyalty_points, total_spent, member_since, last_login_at, created_at, updated_at) VALUES ('012731c2-0bbd-4d3e-b28d-264d4756c89f', 'E2E Customer', 'e2e-1787837876004-pnkx6b@test.com', '08123456789', '$2b$12$GdnrutGcVZDM29G8UQ8oX.XIcNg5B3t6bSGUlXeSzZwok10d4ASw2', NULL, false, true, 0, 0, '2026-08-27 13:37:59.071651+00', NULL, '2026-08-27 13:37:59.071651+00', '2026-08-27 13:37:59.071651+00');
INSERT INTO public.customers (id, name, email, phone, password_hash, avatar, is_verified, is_active, loyalty_points, total_spent, member_since, last_login_at, created_at, updated_at) VALUES ('d9e62c2e-3bea-41bb-95e1-bfdf5522523d', 'E2E Customer', 'e2e-1787837898454-mpdqz5@test.com', '08123456789', '$2b$12$8h/2QwR5BwM.HKlEVddT3ePSNDKhR.0ZGNlgXQaJoWSUOQf/0OSPS', NULL, false, true, 0, 0, '2026-08-27 13:38:21.571213+00', NULL, '2026-08-27 13:38:21.571213+00', '2026-08-27 13:38:21.571213+00');
INSERT INTO public.customers (id, name, email, phone, password_hash, avatar, is_verified, is_active, loyalty_points, total_spent, member_since, last_login_at, created_at, updated_at) VALUES ('62954cf4-9bb6-41b0-b94b-1accf76d6b1a', 'E2E Customer', 'e2e-1787838683952-91bqza@test.com', '08123456789', '$2b$12$Ul2z4/NgKmHHk.rAtszsTO8wOza2Hv/.eRm7L1aclFaNZu8Wi7blC', NULL, false, true, 0, 0, '2026-08-27 13:51:26.835369+00', NULL, '2026-08-27 13:51:26.835369+00', '2026-08-27 13:51:26.835369+00');
INSERT INTO public.customers (id, name, email, phone, password_hash, avatar, is_verified, is_active, loyalty_points, total_spent, member_since, last_login_at, created_at, updated_at) VALUES ('11c9c9df-6b49-4429-bfaa-08123bcf6f18', 'E2E Customer', 'e2e-1787838750520-t1edml@test.com', '08123456789', '$2b$12$ROetc7N.Dyl0D9jjMPmgouc0SL7876OMgarq1JmhdimOoSFFzraf2', NULL, false, true, 0, 0, '2026-08-27 13:52:33.696039+00', NULL, '2026-08-27 13:52:33.696039+00', '2026-08-27 13:52:33.696039+00');
INSERT INTO public.customers (id, name, email, phone, password_hash, avatar, is_verified, is_active, loyalty_points, total_spent, member_since, last_login_at, created_at, updated_at) VALUES ('86e8ee09-71d5-4880-9060-531f619b2c8f', 'E2E Customer', 'e2e-1787838834564-moya3i@test.com', '08123456789', '$2b$12$ZFJzOXgPn5dmDHRl5dmUX.x5clNfIABN5MY/vmMe/JrGkC8.Fdof2', NULL, false, true, 0, 0, '2026-08-27 13:53:57.46275+00', NULL, '2026-08-27 13:53:57.46275+00', '2026-08-27 13:53:57.46275+00');
INSERT INTO public.customers (id, name, email, phone, password_hash, avatar, is_verified, is_active, loyalty_points, total_spent, member_since, last_login_at, created_at, updated_at) VALUES ('32fda8c2-10f8-40ac-9371-bb0be1236755', 'Test', 'test-serial@test.com', '081234567890', '$2b$12$odmTvbVjn1RWFiMJGvgVfejR5YTxHdQ/BR4WFNJwsvc882cWRRXxy', NULL, false, true, 0, 0, '2026-08-27 13:55:30.466875+00', NULL, '2026-08-27 13:55:30.466875+00', '2026-08-27 13:55:30.466875+00');
INSERT INTO public.customers (id, name, email, phone, password_hash, avatar, is_verified, is_active, loyalty_points, total_spent, member_since, last_login_at, created_at, updated_at) VALUES ('e6e5a74a-923f-4f3f-b88d-5097ffc6e716', 'E2E Customer', 'e2e-1787838981477-rev5cw@test.com', '08123456789', '$2b$12$iDQffpsXy5iCrfz/Ny0jn.3IdrIwLd.GtcaqAVMrFhDphbxdJZh.q', NULL, false, true, 0, 0, '2026-08-27 13:56:24.278651+00', NULL, '2026-08-27 13:56:24.278651+00', '2026-08-27 13:56:24.278651+00');
INSERT INTO public.customers (id, name, email, phone, password_hash, avatar, is_verified, is_active, loyalty_points, total_spent, member_since, last_login_at, created_at, updated_at) VALUES ('382da164-dc02-44f5-8b8a-a26dfc09e148', 'E2E Customer', 'e2e-1787839092970-eoxupa@test.com', '08123456789', '$2b$12$OnMouYTGeNL/jAht1xcLrOmM8EhWp7OChvl8kpktWsCI6eYMyA88G', NULL, false, true, 0, 0, '2026-08-27 13:58:15.808574+00', NULL, '2026-08-27 13:58:15.808574+00', '2026-08-27 13:58:15.808574+00');
INSERT INTO public.customers (id, name, email, phone, password_hash, avatar, is_verified, is_active, loyalty_points, total_spent, member_since, last_login_at, created_at, updated_at) VALUES ('a1e3c75d-20ec-456d-9478-42316bf7dae4', 'E2E Customer', 'e2e-1787839133185-8ow8fh@test.com', '08123456789', '$2b$12$jRxkuR68sNiRn1fX8TIVLeVUso3mKk0Ly6NQylsmEdqQCR54/FxBC', NULL, false, true, 0, 0, '2026-08-27 13:58:56.082364+00', NULL, '2026-08-27 13:58:56.082364+00', '2026-08-27 13:58:56.082364+00');
INSERT INTO public.customers (id, name, email, phone, password_hash, avatar, is_verified, is_active, loyalty_points, total_spent, member_since, last_login_at, created_at, updated_at) VALUES ('b46ec6b1-7d50-480d-abe2-05c4e5af0f0f', 'E2E Customer', 'e2e-1787839190399-pt4ho1@test.com', '08123456789', '$2b$12$lwe9dceAH1xDdYzWaLJJked0Wn5mpuYjBwCRRfVRp/LeQpV0yhP6C', NULL, false, true, 0, 0, '2026-08-27 13:59:52.717083+00', NULL, '2026-08-27 13:59:52.717083+00', '2026-08-27 13:59:52.717083+00');
INSERT INTO public.customers (id, name, email, phone, password_hash, avatar, is_verified, is_active, loyalty_points, total_spent, member_since, last_login_at, created_at, updated_at) VALUES ('8f0db95f-7c36-4f80-a2dd-e43c93fc2ddd', 'E2E Customer', 'e2e-1788022053427@test.com', '08123456789', '$2b$12$IdDzkhg/rgjiUVqov1H0lO7TdbmyXE63gJMj8VQHl2BSGY7lF//Ji', NULL, false, true, 0, 0, '2026-08-29 16:47:46.247297+00', NULL, '2026-08-29 16:47:46.247297+00', '2026-08-29 16:47:46.247297+00');
INSERT INTO public.customers (id, name, email, phone, password_hash, avatar, is_verified, is_active, loyalty_points, total_spent, member_since, last_login_at, created_at, updated_at) VALUES ('e61158c6-b86d-49c8-8274-6b01d3b826b2', 'E2E Customer', 'e2e-1788022310489@test.com', '08123456789', '$2b$12$71.Il42/26aOkrdC54ONm.p8rhlhOWsaQ/VhjAsLBP5.AuCw6Ce.u', NULL, false, true, 0, 0, '2026-08-29 16:52:03.409205+00', NULL, '2026-08-29 16:52:03.409205+00', '2026-08-29 16:52:03.409205+00');
INSERT INTO public.customers (id, name, email, phone, password_hash, avatar, is_verified, is_active, loyalty_points, total_spent, member_since, last_login_at, created_at, updated_at) VALUES ('b01df9b5-5582-4281-9ad7-e1f31ba1f313', 'E2E Customer', 'e2e-1788022789947-uurexa@test.com', '08123456789', '$2b$12$f.3toWSL.BcgjDip/vPUHe6jPmwZLLQxfjEGxq4qG6Y3GiWkhmPcO', NULL, false, true, 0, 0, '2026-08-29 16:59:52.064809+00', NULL, '2026-08-29 16:59:52.064809+00', '2026-08-29 16:59:52.064809+00');
INSERT INTO public.customers (id, name, email, phone, password_hash, avatar, is_verified, is_active, loyalty_points, total_spent, member_since, last_login_at, created_at, updated_at) VALUES ('fd646b13-ec3e-4468-8b94-57596697d085', 'Live Test', 'live-test-1788023356@test.com', '08123456789', '$2b$12$rMq2lkaZHROAIalrOtHgLOn9trHwBaa34bb8oOy9x6.yjUf//eCEa', NULL, false, true, 0, 0, '2026-08-29 17:09:16.545835+00', NULL, '2026-08-29 17:09:16.545835+00', '2026-08-29 17:09:16.545835+00');
INSERT INTO public.customers (id, name, email, phone, password_hash, avatar, is_verified, is_active, loyalty_points, total_spent, member_since, last_login_at, created_at, updated_at) VALUES ('7486a93d-9545-4582-988e-2cdac017dd33', 'E2E Customer', 'e2e-1788024621870@test.com', '08123456789', '$2b$12$waJfE5YYNuBCZgk.QjZ12uL26m12XjrAjU2BiCm1Jm1DDCmcJ3W4u', NULL, false, true, 0, 0, '2026-08-29 17:30:34.33336+00', NULL, '2026-08-29 17:30:34.33336+00', '2026-08-29 17:30:34.33336+00');
INSERT INTO public.customers (id, name, email, phone, password_hash, avatar, is_verified, is_active, loyalty_points, total_spent, member_since, last_login_at, created_at, updated_at) VALUES ('3b51c4f6-5580-405c-b618-efd74d28e534', 'E2E Customer', 'e2e-1788024961003-5pmpcy@test.com', '08123456789', '$2b$12$XRSt9bAUKIi8ykCwK.K.Le7Klow5TnniiuJ2EgDOgPKcsuK18aaLS', NULL, false, true, 0, 0, '2026-08-29 17:36:03.340133+00', NULL, '2026-08-29 17:36:03.340133+00', '2026-08-29 17:36:03.340133+00');
INSERT INTO public.customers (id, name, email, phone, password_hash, avatar, is_verified, is_active, loyalty_points, total_spent, member_since, last_login_at, created_at, updated_at) VALUES ('454faf71-0c5a-475a-882b-57c7d5fc91b1', 'Live Test', 'live-1788024465@test.com', '08123456789', '$2b$12$oRDOFCvnLe0hnp3bqJCGf.TDbS54vJTDmeKIw3Up4lfDNGVvFueKO', NULL, false, true, 10, 0, '2026-08-29 17:27:45.661744+00', NULL, '2026-08-29 17:27:45.661744+00', '2026-08-30 15:36:13.427397+00');
INSERT INTO public.customers (id, name, email, phone, password_hash, avatar, is_verified, is_active, loyalty_points, total_spent, member_since, last_login_at, created_at, updated_at) VALUES ('4d1cc848-f796-434d-bcb8-57e201f8eb90', 'Anwar', 'email_anw@yahoo.co.id', '081399451111', '$2b$12$OnwDTSCtVNgRAYQP5SrBwOuif.xJF9iEuNQZ1DDBnZiwgd6ZRLrBC', NULL, false, true, 0, 0, '2026-08-30 15:18:49.093904+00', NULL, '2026-08-30 15:18:49.093904+00', '2026-10-13 22:23:50.816024+00');


--
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: brodit
--

INSERT INTO public.bookings (id, booking_code, customer_name, customer_phone, customer_email, user_id, venue_id, court_id, sport_id, booking_date, start_time, end_time, duration_minutes, total_price, booking_status, payment_status, expires_at, payment_proof_url, payment_submitted_at, payment_verified_at, payment_rejected_at, payment_rejection_reason, verified_by_admin_id, notes, points_awarded_at, created_at, updated_at, commission_amount, owner_payout, payment_method, midtrans_order_id, midtrans_transaction_id, recurring_group_id, recurrence_type, recurrence_end_date, voucher_code, down_payment_amount, paid_amount, rescheduled_from, reschedule_count, refund_reason, refund_requested_at) VALUES ('booking-001', 'BK-260624-DEMO1', 'John Doe', '081234567890', 'john@example.com', 'f3f38ac3-1cc2-42e2-bafd-a8ab91753923', 'venue-greenfield', 'court-f1', 'sport-futsal', '2026-06-25', '19:00:00', '21:00:00', 120, 300000, 'confirmed', 'paid', NULL, NULL, NULL, '2026-06-24 10:00:00+00', NULL, NULL, 'admin-1', 'Demo confirmed booking', NULL, '2026-07-13 05:56:46.984658+00', '2026-07-13 05:56:46.984658+00', 0, 0, 'manual', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL);
INSERT INTO public.bookings (id, booking_code, customer_name, customer_phone, customer_email, user_id, venue_id, court_id, sport_id, booking_date, start_time, end_time, duration_minutes, total_price, booking_status, payment_status, expires_at, payment_proof_url, payment_submitted_at, payment_verified_at, payment_rejected_at, payment_rejection_reason, verified_by_admin_id, notes, points_awarded_at, created_at, updated_at, commission_amount, owner_payout, payment_method, midtrans_order_id, midtrans_transaction_id, recurring_group_id, recurrence_type, recurrence_end_date, voucher_code, down_payment_amount, paid_amount, rescheduled_from, reschedule_count, refund_reason, refund_requested_at) VALUES ('booking-002', 'BK-260624-DEMO2', 'Jane Smith', '082345678901', 'jane@example.com', '4a3c8931-2740-4989-81b0-2719474ef180', 'venue-greenfield', 'court-f1', 'sport-futsal', '2026-06-25', '21:00:00', '22:00:00', 60, 150000, 'waiting_verification', 'waiting_confirmation', '2026-06-24 09:00:00+00', NULL, '2026-06-24 09:10:00+00', NULL, NULL, NULL, NULL, 'Demo waiting for verification', NULL, '2026-07-13 05:56:46.984658+00', '2026-07-13 05:56:46.984658+00', 0, 0, 'manual', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL);
INSERT INTO public.bookings (id, booking_code, customer_name, customer_phone, customer_email, user_id, venue_id, court_id, sport_id, booking_date, start_time, end_time, duration_minutes, total_price, booking_status, payment_status, expires_at, payment_proof_url, payment_submitted_at, payment_verified_at, payment_rejected_at, payment_rejection_reason, verified_by_admin_id, notes, points_awarded_at, created_at, updated_at, commission_amount, owner_payout, payment_method, midtrans_order_id, midtrans_transaction_id, recurring_group_id, recurrence_type, recurrence_end_date, voucher_code, down_payment_amount, paid_amount, rescheduled_from, reschedule_count, refund_reason, refund_requested_at) VALUES ('booking-004', 'BK-260624-DEMO4', 'Alice Brown', '084567890123', 'alice@example.com', '4a3c8931-2740-4989-81b0-2719474ef180', 'venue-greenfield', 'court-f1', 'sport-futsal', '2026-06-26', '19:00:00', '20:00:00', 60, 150000, 'expired', 'unpaid', '2026-07-13 05:26:46.984658+00', NULL, NULL, NULL, NULL, NULL, NULL, 'Demo expired booking', NULL, '2026-07-13 05:56:46.984658+00', '2026-07-13 05:56:46.984658+00', 0, 0, 'manual', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL);
INSERT INTO public.bookings (id, booking_code, customer_name, customer_phone, customer_email, user_id, venue_id, court_id, sport_id, booking_date, start_time, end_time, duration_minutes, total_price, booking_status, payment_status, expires_at, payment_proof_url, payment_submitted_at, payment_verified_at, payment_rejected_at, payment_rejection_reason, verified_by_admin_id, notes, points_awarded_at, created_at, updated_at, commission_amount, owner_payout, payment_method, midtrans_order_id, midtrans_transaction_id, recurring_group_id, recurrence_type, recurrence_end_date, voucher_code, down_payment_amount, paid_amount, rescheduled_from, reschedule_count, refund_reason, refund_requested_at) VALUES ('booking-005', 'BK-260624-DEMO5', 'Charlie D.', '085678901234', 'charlie@example.com', '837637b4-2ffb-4254-94c0-abc753963219', 'venue-rahasian', 'court-b4', 'sport-bulu-tangkis', '2026-06-25', '20:00:00', '21:00:00', 60, 90000, 'confirmed', 'paid', NULL, NULL, NULL, '2026-06-24 11:00:00+00', NULL, NULL, 'admin-1', 'Demo confirmed badminton', NULL, '2026-07-13 05:56:46.984658+00', '2026-07-13 05:56:46.984658+00', 0, 0, 'manual', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL);
INSERT INTO public.bookings (id, booking_code, customer_name, customer_phone, customer_email, user_id, venue_id, court_id, sport_id, booking_date, start_time, end_time, duration_minutes, total_price, booking_status, payment_status, expires_at, payment_proof_url, payment_submitted_at, payment_verified_at, payment_rejected_at, payment_rejection_reason, verified_by_admin_id, notes, points_awarded_at, created_at, updated_at, commission_amount, owner_payout, payment_method, midtrans_order_id, midtrans_transaction_id, recurring_group_id, recurrence_type, recurrence_end_date, voucher_code, down_payment_amount, paid_amount, rescheduled_from, reschedule_count, refund_reason, refund_requested_at) VALUES ('booking-003', 'BK-260624-DEMO3', 'Bob Wilson', '083456789012', 'bob@example.com', '837637b4-2ffb-4254-94c0-abc753963219', 'venue-greenfield', 'court-f1', 'sport-futsal', '2026-06-26', '17:00:00', '19:00:00', 120, 300000, 'expired', 'unpaid', '2026-07-13 06:06:46.984658+00', NULL, NULL, NULL, NULL, NULL, NULL, 'Demo waiting payment', NULL, '2026-07-13 05:56:46.984658+00', '2026-07-13 08:38:47.795051+00', 0, 0, 'manual', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL);
INSERT INTO public.bookings (id, booking_code, customer_name, customer_phone, customer_email, user_id, venue_id, court_id, sport_id, booking_date, start_time, end_time, duration_minutes, total_price, booking_status, payment_status, expires_at, payment_proof_url, payment_submitted_at, payment_verified_at, payment_rejected_at, payment_rejection_reason, verified_by_admin_id, notes, points_awarded_at, created_at, updated_at, commission_amount, owner_payout, payment_method, midtrans_order_id, midtrans_transaction_id, recurring_group_id, recurrence_type, recurrence_end_date, voucher_code, down_payment_amount, paid_amount, rescheduled_from, reschedule_count, refund_reason, refund_requested_at) VALUES ('bk-6f64fb0f', 'BK-260713-976D', 'dshfds', '47363234545', 'da@fad.com', NULL, 'venue-rahasian', 'court-b4', 'sport-bulu-tangkis', '2026-07-13', '17:00:00', '19:00:00', 120, 250159, 'waiting_verification', 'waiting_confirmation', NULL, '/uploads/payments/1783931978294-tmm8eg.png', '2026-07-13 08:39:38.317303+00', NULL, NULL, NULL, NULL, 'dsfdsf', NULL, '2026-07-13 08:39:24.983103+00', '2026-07-13 08:39:38.317303+00', 0, 0, 'manual', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL);
INSERT INTO public.bookings (id, booking_code, customer_name, customer_phone, customer_email, user_id, venue_id, court_id, sport_id, booking_date, start_time, end_time, duration_minutes, total_price, booking_status, payment_status, expires_at, payment_proof_url, payment_submitted_at, payment_verified_at, payment_rejected_at, payment_rejection_reason, verified_by_admin_id, notes, points_awarded_at, created_at, updated_at, commission_amount, owner_payout, payment_method, midtrans_order_id, midtrans_transaction_id, recurring_group_id, recurrence_type, recurrence_end_date, voucher_code, down_payment_amount, paid_amount, rescheduled_from, reschedule_count, refund_reason, refund_requested_at) VALUES ('bk-02edd7c1', 'BK-260827-A1FB', 'John Doe', '081234567890', 'john@example.com', 'f3f38ac3-1cc2-42e2-bafd-a8ab91753923', 'venue-greenfield', 'court-b1', 'sport-futsal', '2026-09-10', '19:00:00', '21:00:00', 120, 225946, 'expired', 'unpaid', '2026-08-27 09:17:26.793308+00', NULL, NULL, NULL, NULL, NULL, NULL, 'Group booking Futsal Bareng Kantor (4277d36f-0599-442a-95f5-6af718532342) — 3 participants', NULL, '2026-08-27 09:02:26.793308+00', '2026-08-27 09:24:02.406418+00', 22595, 203351, 'manual', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL);
INSERT INTO public.bookings (id, booking_code, customer_name, customer_phone, customer_email, user_id, venue_id, court_id, sport_id, booking_date, start_time, end_time, duration_minutes, total_price, booking_status, payment_status, expires_at, payment_proof_url, payment_submitted_at, payment_verified_at, payment_rejected_at, payment_rejection_reason, verified_by_admin_id, notes, points_awarded_at, created_at, updated_at, commission_amount, owner_payout, payment_method, midtrans_order_id, midtrans_transaction_id, recurring_group_id, recurrence_type, recurrence_end_date, voucher_code, down_payment_amount, paid_amount, rescheduled_from, reschedule_count, refund_reason, refund_requested_at) VALUES ('bk-7e08f382', 'BK-260827-85FD', 'John Doe', '081234567890', 'john@example.com', 'f3f38ac3-1cc2-42e2-bafd-a8ab91753923', 'venue-greenfield', 'court-f1', 'sport-futsal', '2026-09-20', '19:00:00', '20:00:00', 60, 259095, 'expired', 'unpaid', '2026-08-27 09:34:21.92844+00', NULL, NULL, NULL, NULL, NULL, NULL, 'Group booking Test Group 1787822338 (eeaf701d-c749-49f6-b98b-f3c2a82298df) — 2 participants', NULL, '2026-08-27 09:19:21.92844+00', '2026-08-27 09:34:22.564342+00', 25910, 233185, 'manual', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL);
INSERT INTO public.bookings (id, booking_code, customer_name, customer_phone, customer_email, user_id, venue_id, court_id, sport_id, booking_date, start_time, end_time, duration_minutes, total_price, booking_status, payment_status, expires_at, payment_proof_url, payment_submitted_at, payment_verified_at, payment_rejected_at, payment_rejection_reason, verified_by_admin_id, notes, points_awarded_at, created_at, updated_at, commission_amount, owner_payout, payment_method, midtrans_order_id, midtrans_transaction_id, recurring_group_id, recurrence_type, recurrence_end_date, voucher_code, down_payment_amount, paid_amount, rescheduled_from, reschedule_count, refund_reason, refund_requested_at) VALUES ('bk-e30ddf2e', 'BK-260827-8840', 'Raka Padel Baru', '081234567891', 'raka.padel.baru2@example.com', NULL, 'venue-greenfield', 'court-p1', 'sport-padel', '2026-08-27', '21:00:00', '22:00:00', 60, 129097, 'completed', 'paid', NULL, '/uploads/payments/1787823415343-n9vjip.png', '2026-08-27 09:36:55.369842+00', NULL, NULL, NULL, NULL, 'Booking padel bareng teman-teman, 4 orang. Pertama kali coba Lapangin!', NULL, '2026-08-27 09:36:33.067092+00', '2026-08-27 09:38:50.884195+00', 12910, 116187, 'manual', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL);
INSERT INTO public.bookings (id, booking_code, customer_name, customer_phone, customer_email, user_id, venue_id, court_id, sport_id, booking_date, start_time, end_time, duration_minutes, total_price, booking_status, payment_status, expires_at, payment_proof_url, payment_submitted_at, payment_verified_at, payment_rejected_at, payment_rejection_reason, verified_by_admin_id, notes, points_awarded_at, created_at, updated_at, commission_amount, owner_payout, payment_method, midtrans_order_id, midtrans_transaction_id, recurring_group_id, recurrence_type, recurrence_end_date, voucher_code, down_payment_amount, paid_amount, rescheduled_from, reschedule_count, refund_reason, refund_requested_at) VALUES ('bk-7adfa04a', 'BK-260827-F689', 'John Doe', '81234567890', 'john@example.com', 'f3f38ac3-1cc2-42e2-bafd-a8ab91753923', 'venue-greenfield', 'court-f1', 'sport-futsal', '2026-08-27', '19:00:00', '20:00:00', 60, 225846, 'expired', 'unpaid', '2026-08-27 09:39:56.745455+00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-27 09:24:56.745455+00', '2026-08-27 09:39:56.996471+00', 22585, 203261, 'manual', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL);
INSERT INTO public.bookings (id, booking_code, customer_name, customer_phone, customer_email, user_id, venue_id, court_id, sport_id, booking_date, start_time, end_time, duration_minutes, total_price, booking_status, payment_status, expires_at, payment_proof_url, payment_submitted_at, payment_verified_at, payment_rejected_at, payment_rejection_reason, verified_by_admin_id, notes, points_awarded_at, created_at, updated_at, commission_amount, owner_payout, payment_method, midtrans_order_id, midtrans_transaction_id, recurring_group_id, recurrence_type, recurrence_end_date, voucher_code, down_payment_amount, paid_amount, rescheduled_from, reschedule_count, refund_reason, refund_requested_at) VALUES ('bk-3e746fde', 'BK-260827-7070', 'Raka Padel Baru', '081287823777', 'padelbaru1787823777@example.com', '85017077-dbeb-4b09-a686-2070f4dd65aa', 'venue-greenfield', 'court-p1', 'sport-padel', '2026-08-27', '18:00:00', '19:00:00', 60, 169646, 'completed', 'paid', NULL, '/uploads/payments/1787823859810-8u1kh1.png', '2026-08-27 09:44:19.890489+00', NULL, NULL, NULL, NULL, 'Padel bareng teman 4 orang', NULL, '2026-08-27 09:43:55.471469+00', '2026-08-27 09:45:06.586858+00', 16965, 152681, 'manual', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL);
INSERT INTO public.bookings (id, booking_code, customer_name, customer_phone, customer_email, user_id, venue_id, court_id, sport_id, booking_date, start_time, end_time, duration_minutes, total_price, booking_status, payment_status, expires_at, payment_proof_url, payment_submitted_at, payment_verified_at, payment_rejected_at, payment_rejection_reason, verified_by_admin_id, notes, points_awarded_at, created_at, updated_at, commission_amount, owner_payout, payment_method, midtrans_order_id, midtrans_transaction_id, recurring_group_id, recurrence_type, recurrence_end_date, voucher_code, down_payment_amount, paid_amount, rescheduled_from, reschedule_count, refund_reason, refund_requested_at) VALUES ('bk-fe6f783e', 'BK-260827-9EF0', 'Raka Padel Baru', '81234567890', 'raka.padel.baru@example.com', NULL, 'venue-greenfield', 'court-p1', 'sport-padel', '2026-08-27', '20:00:00', '21:00:00', 60, 187866, 'expired', 'unpaid', '2026-08-27 09:51:15.999108+00', NULL, NULL, NULL, NULL, NULL, NULL, 'Booking padel bareng teman-teman, 4 orang. Pertama kali coba Lapangin!', NULL, '2026-08-27 09:36:15.999108+00', '2026-08-27 09:51:16.878502+00', 18787, 169079, 'manual', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL);
INSERT INTO public.bookings (id, booking_code, customer_name, customer_phone, customer_email, user_id, venue_id, court_id, sport_id, booking_date, start_time, end_time, duration_minutes, total_price, booking_status, payment_status, expires_at, payment_proof_url, payment_submitted_at, payment_verified_at, payment_rejected_at, payment_rejection_reason, verified_by_admin_id, notes, points_awarded_at, created_at, updated_at, commission_amount, owner_payout, payment_method, midtrans_order_id, midtrans_transaction_id, recurring_group_id, recurrence_type, recurrence_end_date, voucher_code, down_payment_amount, paid_amount, rescheduled_from, reschedule_count, refund_reason, refund_requested_at) VALUES ('bk-7c776dc4', 'BK-260827-41D8', 'Raka Live Padel', '081278240000', 'rakalive1787824000@example.com', NULL, 'venue-greenfield', 'court-p1', 'sport-padel', '2026-08-27', '19:00:00', '20:00:00', 60, 188013, 'completed', 'paid', NULL, '/uploads/payments/1787824305141-o7v3mo.png', '2026-08-27 09:51:45.238404+00', NULL, NULL, NULL, NULL, 'Booking padel bareng teman 4 orang - live preview test', NULL, '2026-08-27 09:50:57.611889+00', '2026-08-27 09:52:06.626617+00', 18801, 169212, 'manual', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL);
INSERT INTO public.bookings (id, booking_code, customer_name, customer_phone, customer_email, user_id, venue_id, court_id, sport_id, booking_date, start_time, end_time, duration_minutes, total_price, booking_status, payment_status, expires_at, payment_proof_url, payment_submitted_at, payment_verified_at, payment_rejected_at, payment_rejection_reason, verified_by_admin_id, notes, points_awarded_at, created_at, updated_at, commission_amount, owner_payout, payment_method, midtrans_order_id, midtrans_transaction_id, recurring_group_id, recurrence_type, recurrence_end_date, voucher_code, down_payment_amount, paid_amount, rescheduled_from, reschedule_count, refund_reason, refund_requested_at) VALUES ('bk-2fb478b3', 'BK-260827-14CE', 'Live Basket Tester', '081234567890', 'live-basket-1787831352236@test.com', '5d986440-783d-440b-a5c8-0971b96abd44', 'venue-greenfield', 'court-bsk1', 'sport-basket', '2026-08-28', '06:00:00', '07:00:00', 60, 90580, 'waiting_verification', 'waiting_confirmation', NULL, '/uploads/payments/1787831353378-3iyihg.png', '2026-08-27 11:49:13.401286+00', NULL, NULL, NULL, NULL, 'Live test basket', NULL, '2026-08-27 11:49:13.207997+00', '2026-08-27 11:49:13.401286+00', 9058, 81522, 'manual', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL);
INSERT INTO public.bookings (id, booking_code, customer_name, customer_phone, customer_email, user_id, venue_id, court_id, sport_id, booking_date, start_time, end_time, duration_minutes, total_price, booking_status, payment_status, expires_at, payment_proof_url, payment_submitted_at, payment_verified_at, payment_rejected_at, payment_rejection_reason, verified_by_admin_id, notes, points_awarded_at, created_at, updated_at, commission_amount, owner_payout, payment_method, midtrans_order_id, midtrans_transaction_id, recurring_group_id, recurrence_type, recurrence_end_date, voucher_code, down_payment_amount, paid_amount, rescheduled_from, reschedule_count, refund_reason, refund_requested_at) VALUES ('bk-92f91ddd', 'BK-260827-408A', 'Tester Basket', '081234567890', 'basket-1787837438@test.com', '8f8874af-4b82-4542-aece-0823e67f304d', 'venue-greenfield', 'court-bsk1', 'sport-basket', '2026-08-28', '07:00:00', '08:00:00', 60, 81517, 'waiting_verification', 'waiting_confirmation', NULL, '/uploads/payments/1787837440271-vusezm.jpg', '2026-08-27 13:30:40.358306+00', NULL, NULL, NULL, NULL, 'Test basket booking', NULL, '2026-08-27 13:30:39.936914+00', '2026-08-27 13:30:40.358306+00', 8152, 73365, 'manual', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL);
INSERT INTO public.bookings (id, booking_code, customer_name, customer_phone, customer_email, user_id, venue_id, court_id, sport_id, booking_date, start_time, end_time, duration_minutes, total_price, booking_status, payment_status, expires_at, payment_proof_url, payment_submitted_at, payment_verified_at, payment_rejected_at, payment_rejection_reason, verified_by_admin_id, notes, points_awarded_at, created_at, updated_at, commission_amount, owner_payout, payment_method, midtrans_order_id, midtrans_transaction_id, recurring_group_id, recurrence_type, recurrence_end_date, voucher_code, down_payment_amount, paid_amount, rescheduled_from, reschedule_count, refund_reason, refund_requested_at) VALUES ('bk-58bd289b', 'BK-260829-AC90', 'Live Test', '08123456789', 'live-1788024465@test.com', '454faf71-0c5a-475a-882b-57c7d5fc91b1', 'venue-greenfield', 'court-bsk1', 'sport-basket', '2026-08-31', '08:00:00', '09:00:00', 60, 100534, 'completed', 'paid', NULL, '/uploads/payments/fake.jpg', '2026-08-29 17:27:54.9803+00', '2026-08-29 17:28:05.085954+00', NULL, NULL, NULL, NULL, NULL, '2026-08-29 17:27:50.062301+00', '2026-08-30 15:36:13.420164+00', 10053, 90481, 'manual', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL);
INSERT INTO public.bookings (id, booking_code, customer_name, customer_phone, customer_email, user_id, venue_id, court_id, sport_id, booking_date, start_time, end_time, duration_minutes, total_price, booking_status, payment_status, expires_at, payment_proof_url, payment_submitted_at, payment_verified_at, payment_rejected_at, payment_rejection_reason, verified_by_admin_id, notes, points_awarded_at, created_at, updated_at, commission_amount, owner_payout, payment_method, midtrans_order_id, midtrans_transaction_id, recurring_group_id, recurrence_type, recurrence_end_date, voucher_code, down_payment_amount, paid_amount, rescheduled_from, reschedule_count, refund_reason, refund_requested_at) VALUES ('bk-b20c6455', 'BK-261013-5800', 'Mayun Subania', '+622122016608', 'spora.gz@gmail.com', NULL, 'venue-rahasian', 'court-b7', 'sport-bulu-tangkis', '2026-10-14', '07:00:00', '09:00:00', 120, 153684, 'expired', 'unpaid', '2026-10-13 22:43:45.438191+00', NULL, NULL, NULL, NULL, NULL, NULL, 'Oke', NULL, '2026-10-13 22:28:45.438191+00', '2026-10-13 22:53:54.677616+00', 15368, 138316, 'manual', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL);
INSERT INTO public.bookings (id, booking_code, customer_name, customer_phone, customer_email, user_id, venue_id, court_id, sport_id, booking_date, start_time, end_time, duration_minutes, total_price, booking_status, payment_status, expires_at, payment_proof_url, payment_submitted_at, payment_verified_at, payment_rejected_at, payment_rejection_reason, verified_by_admin_id, notes, points_awarded_at, created_at, updated_at, commission_amount, owner_payout, payment_method, midtrans_order_id, midtrans_transaction_id, recurring_group_id, recurrence_type, recurrence_end_date, voucher_code, down_payment_amount, paid_amount, rescheduled_from, reschedule_count, refund_reason, refund_requested_at) VALUES ('bk-84ea0398', 'BK-261013-9C4C', 'Mayun Subania', '+622122016608', 'spora.gz@gmail.com', NULL, 'venue-rahasian', 'court-b4', 'sport-bulu-tangkis', '2026-10-14', '12:00:00', '14:00:00', 120, 200268, 'expired', 'unpaid', '2026-10-13 22:44:02.297021+00', NULL, NULL, NULL, NULL, NULL, NULL, 'okkk', NULL, '2026-10-13 22:29:02.297021+00', '2026-10-13 22:53:54.677616+00', 20027, 180241, 'manual', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL);
INSERT INTO public.bookings (id, booking_code, customer_name, customer_phone, customer_email, user_id, venue_id, court_id, sport_id, booking_date, start_time, end_time, duration_minutes, total_price, booking_status, payment_status, expires_at, payment_proof_url, payment_submitted_at, payment_verified_at, payment_rejected_at, payment_rejection_reason, verified_by_admin_id, notes, points_awarded_at, created_at, updated_at, commission_amount, owner_payout, payment_method, midtrans_order_id, midtrans_transaction_id, recurring_group_id, recurrence_type, recurrence_end_date, voucher_code, down_payment_amount, paid_amount, rescheduled_from, reschedule_count, refund_reason, refund_requested_at) VALUES ('bk-b0d4ff7c', 'BK-261014-6B15', 'Mayun Subania', '+622122016608', 'spora.gz@gmail.com', NULL, 'venue-arena-futsal', 'court-f5', 'sport-futsal', '2026-10-14', '20:00:00', '22:00:00', 120, 275509, 'expired', 'unpaid', '2026-10-14 08:35:16.290135+00', NULL, NULL, NULL, NULL, NULL, NULL, 'oke', NULL, '2026-10-14 08:20:16.290135+00', '2026-10-14 08:58:54.246225+00', 27551, 247958, 'manual', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL);
INSERT INTO public.bookings (id, booking_code, customer_name, customer_phone, customer_email, user_id, venue_id, court_id, sport_id, booking_date, start_time, end_time, duration_minutes, total_price, booking_status, payment_status, expires_at, payment_proof_url, payment_submitted_at, payment_verified_at, payment_rejected_at, payment_rejection_reason, verified_by_admin_id, notes, points_awarded_at, created_at, updated_at, commission_amount, owner_payout, payment_method, midtrans_order_id, midtrans_transaction_id, recurring_group_id, recurrence_type, recurrence_end_date, voucher_code, down_payment_amount, paid_amount, rescheduled_from, reschedule_count, refund_reason, refund_requested_at) VALUES ('bk-f1844d06', 'BK-261014-C7D4', 'Test Guest', '0812345678', 'test@example.com', NULL, 'venue-arena-futsal', 'court-f5', 'sport-futsal', '2026-10-20', '20:00:00', '21:00:00', 60, 138417, 'expired', 'unpaid', '2026-10-14 08:45:57.455539+00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-10-14 08:30:57.455539+00', '2026-10-14 08:58:54.246225+00', 13842, 124575, 'manual', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL);
INSERT INTO public.bookings (id, booking_code, customer_name, customer_phone, customer_email, user_id, venue_id, court_id, sport_id, booking_date, start_time, end_time, duration_minutes, total_price, booking_status, payment_status, expires_at, payment_proof_url, payment_submitted_at, payment_verified_at, payment_rejected_at, payment_rejection_reason, verified_by_admin_id, notes, points_awarded_at, created_at, updated_at, commission_amount, owner_payout, payment_method, midtrans_order_id, midtrans_transaction_id, recurring_group_id, recurrence_type, recurrence_end_date, voucher_code, down_payment_amount, paid_amount, rescheduled_from, reschedule_count, refund_reason, refund_requested_at) VALUES ('bk-cab37ff4', 'BK-261015-A754', 'Aditia Energi Juang', '81322163148', 'aditia.news98@gmail.com', NULL, 'venue-yog-maguwo', 'court-yog-f2', 'sport-futsal', '2026-10-15', '18:00:00', '20:00:00', 120, 238133, 'expired', 'unpaid', '2026-10-15 07:23:28.938362+00', NULL, NULL, NULL, NULL, NULL, NULL, 'oke', NULL, '2026-10-15 07:08:28.938362+00', '2026-10-15 07:41:36.636863+00', 23813, 214320, 'manual', NULL, NULL, NULL, NULL, NULL, NULL, 119067, 0, NULL, 0, NULL, NULL);


--
-- Data for Name: cms_content; Type: TABLE DATA; Schema: public; Owner: brodit
--

INSERT INTO public.cms_content (key, title, body, updated_at, updated_by) VALUES ('tentang', 'Tentang Lapabook', '# Tentang Lapabook

**Lapabook** adalah platform booking lapangan olahraga online yang menghubungkan pemain dengan pemilik lapangan di seluruh Indonesia.

## Misi Kami

Membuat akses ke fasilitas olahraga semudah memesan makanan. Kami percaya bahwa berolahraga harusnya simple — cari, booking, main.

## Apa yang Kami Tawarkan

- **Ribuan lapangan** — futsal, badminton, basket, tenis, padel, mini soccer
- **Filter lokasi** — cari berdasarkan area/kota/kelurahan
- **Harga transparan** — lihat harga real-time sebelum booking
- **Booking instan** — pilih jam, bayar, langsung main
- **Gamifikasi** — kumpulkan poin, tukar reward, naik level
- **Adaptif cuaca** — diskon otomatis untuk lapangan outdoor saat hujan

## Untuk Pemilik Lapangan

Daftarkan venue Anda dan dapatkan:
- Dashboard kelola booking real-time
- Manajemen lapangan dan harga fleksibel
- Statistik dan analitik performa
- Notifikasi otomatis ke pelanggan

## Teknologi

- Next.js 16 + TypeScript
- PostgreSQL 16
- Real-time availability
- PWA support (install di HP)
- HTTPS + security hardening

## Kontak

Hubungi kami di [kontak@lapabook.id](mailto:kontak@lapabook.id) atau kunjungi halaman [Kontak](/kontak).', '2026-10-14 05:13:06.700086+00', NULL);
INSERT INTO public.cms_content (key, title, body, updated_at, updated_by) VALUES ('syarat', 'Syarat & Ketentuan', '# Syarat & Ketentuan

Terakhir diperbarui: 12 Juli 2026

## Ketentuan Umum

Dengan menggunakan Lapabook, Anda menyetujui syarat dan ketentuan berikut.

## Untuk Pemain (Customer)

### Pendaftaran
- Usia minimal 17 tahun atau memiliki izin orang tua
- Data yang diberikan harus benar dan dapat diverifikasi
- Satu akun per orang — dilarang membuat akun ganda
- Password harus kuat (minimal 8 karakter, kombinasi huruf dan angka)

### Booking
- Booking bersifat sementara hingga pembayaran dikonfirmasi
- Booking yang tidak dibayar dalam 15 menit akan otomatis kadaluarsa
- Bukti pembayaran harus diupload setelah melakukan transfer
- Booking yang sudah dikonfirmasi tidak dapat dibatalkan tanpa penalti

### Pembayaran
- Pembayaran dilakukan via transfer bank, e-wallet, atau QRIS
- Bukti pembayaran yang diupload harus jelas dan asli
- Manipulasi bukti pembayaran = banned permanen

### Loyalty & Reward
- Poin hanya diberikan setelah booking dikonfirmasi
- Poin dapat ditukar dengan reward yang tersedia
- Poin yang sudah kadaluarsa tidak dapat diklaim kembali
- Lapabook berhak menyesuaikan poin jika terjadi kesalahan

### Referral
- Kode referral bersifat unik per akun
- Poin referral diberikan setelah referral pertama berhasil
- Dilarang menyalahgunakan sistem referral (fake accounts, dll)

### Kewajiban Pemain
- Datang tepat waktu sesuai jadwal booking
- Menjaga kebersihan dan fasilitas venue
- Menghormati pemilik lapangan dan pemain lain
- Tidak melakukan vandalisme atau tindakan merusak

## Untuk Pemilik Lapangan (Owner)

### Pendaftaran
- Harus memiliki usaha venue olahraga yang valid
- Data bisnis harus benar dan dapat diverifikasi
- Pendaftaran akan diverifikasi oleh tim Lapabook (1-3 hari kerja)
- Status akun: pending → active (setelah disetujui)

### Pengelolaan Venue
- Informasi venue harus akurat (alamat, foto, harga, jam operasional)
- Harga yang tercantum adalah harga final (tidak boleh ada biaya tersembunyi)
- Ketersediaan slot harus selalu diperbarui
- Venue yang tidak aktif dalam 90 hari dapat ditandai suspend

### Booking & Pembayaran
- Owner wajib mengkonfirmasi booking yang sudah dibayar
- Pembayaran dari customer akan diteruskan ke owner (setelah dipotong platform fee)
- Owner dapat menolak booking dengan alasan yang valid
- Rekening tujuan pembayaran harus atas nama bisnis yang terdaftar

### Data & Kontak
- Owner bertanggung jawab atas data customer yang diterima
- Dilarang menyebarkan data customer ke pihak lain
- Kontak customer hanya untuk keperluan booking

## Untuk Semua Pengguna

### Larangan
- Menggunakan platform untuk aktivitas ilegal
- Manipulasi data, bukti pembayaran, atau review
- Spam, abuse, atau harassment terhadap pengguna lain
- Menggunakan bot atau script otomatis
- Reverse engineering atau exploitasi celah keamanan

### Hak Lapabook
- Menangguhkan atau menghapus akun yang melanggar
- Mengubah syarat dan ketentuan sewaktu-waktu
- Menolak atau membatalkan booking yang mencurigakan
- Mengambil tindakan hukum untuk pelanggaran serius

### Batasan Tanggung Jawab
- Lapabook adalah platform perantara, bukan penyedia venue
- Kualitas venue adalah tanggung jawab owner
- Sengketa antara pemain dan owner harus diselesaikan secara musyawarah
- Lapabook akan memediasi jika diperlukan

### Ganti Rugi
- Maksimal ganti rugi = nilai booking yang bersangkutan
- Lapabook tidak bertanggung jawab atas kerugian tidak langsung
- Force majeure (bencana alam, pandemi, dll) dikecualikan

## Hukum yang Berlaku

Syarat dan ketentuan ini tunduk pada hukum Republik Indonesia.
Sengketa akan diselesaikan di pengadilan Jakarta Selatan.

## Kontak

Pertanyaan tentang syarat & ketentuan: [legal@lapabook.id](mailto:legal@lapabook.id)', '2026-10-14 05:13:06.701427+00', NULL);
INSERT INTO public.cms_content (key, title, body, updated_at, updated_by) VALUES ('kontak', 'Kontak', '# Kontak Kami

Kami siap membantu Anda! Hubungi kami melalui channel berikut.

## Email
- **Umum:** info@lapabook.id
- **Support:** support@lapabook.id
- **Kerjasama:** partnership@lapabook.id
- **Privasi:** privacy@lapabook.id
- **Legal:** legal@lapabook.id

## Media Sosial
- **Instagram:** @lapabook.id
- **Twitter/X:** @lapabook_id
- **TikTok:** @lapabook.id
- **Facebook:** Lapabook Indonesia

## WhatsApp
+62 812-3456-7890 (Chat only, Senin-Jumat 09:00-17:00 WIB)

## Alamat
Lapabook Indonesia
Jakarta Selatan, DKI Jakarta
Indonesia

## Jam Operasional Support
Senin - Jumat: 09:00 - 17:00 WIB
Sabtu: 09:00 - 14:00 WIB
Minggu & Hari Libur: Tutup

## FAQ Cepat

**Q: Booking saya belum dikonfirmasi?**
A: Hubungi owner venue via WhatsApp yang tertera di halaman venue. Atau hubungi support kami.

**Q: Bukti pembayaran ditolak?**
A: Upload ulang bukti yang lebih jelas. Pastikan nominal, nama, dan tanggal terlihat.

**Q: Ingin daftarkan venue saya?**
A: Kunjungi /dashboard/register atau hubungi partnership@lapabook.id

**Q: Ada bug atau error?**
A: Laporkan ke support@lapabook.id dengan screenshot dan langkah reproduksi.', '2026-10-14 05:13:06.702308+00', NULL);
INSERT INTO public.cms_content (key, title, body, updated_at, updated_by) VALUES ('kebijakan', 'Kebijakan & Privasi', '# Kebijakan & Privasi

Terakhir diperbarui: 12 Juli 2026

## 1. Data yang Kami Kumpulkan

**Data Pendaftaran:**
- Nama lengkap
- Email
- Nomor telepon
- Password (dienkripsi, tidak pernah disimpan plain text)

**Data Booking:**
- Riwayat booking (venue, jam, tanggal)
- Bukti pembayaran yang diupload
- Review dan rating yang diberikan

**Data Teknis:**
- Alamat IP
- Tipe browser dan device
- Halaman yang dikunjungi

## 2. Cara Kami Menggunakan Data

- Memproses booking dan pembayaran
- Mengirim notifikasi booking (WhatsApp, email, push)
- Mengelola akun dan loyalty points
- Meningkatkan layanan dan pengalaman pengguna
- Mencegah fraud dan penyalahgunaan

## 3. Data Sharing

Kami TIDAK menjual data Anda kepada pihak ketiga.

Data dibagikan hanya dengan:
- **Pemilik venue** — nama dan kontak untuk keperluan booking
- **Payment gateway** — data transaksi untuk proses pembayaran
- **Layanan notifikasi** — nomor telepon/email untuk notifikasi

## 4. Keamanan Data

- Semua komunikasi dienkripsi HTTPS
- Password di-hash dengan bcrypt
- JWT token untuk autentikasi session
- Rate limiting untuk mencegah brute force
- Audit log untuk semua aksi penting

## 5. Hak Anda

- **Akses:** Minta salinan data Anda
- **Koreksi:** Perbaiki data yang salah
- **Hapus:** Minta penghapusan akun dan data
- **Export:** Download data Anda dalam format umum

## 6. Retensi Data

- Data akun: disimpan selama akun aktif
- Data booking: disimpan 2 tahun setelah transaksi
- Log teknis: dihapus otomatis setelah 90 hari

## 7. Cookie

Kami menggunakan cookie untuk:
- Autentikasi session (httpOnly cookie)
- Preferensi pengguna (theme, bahasa)
- Analytics (anonymized)

## 8. Kontak

Untuk pertanyaan tentang privasi: [privacy@lapabook.id](mailto:privacy@lapabook.id)

## 9. Perubahan Kebijakan

Kebijakan ini dapat berubah sewaktu-waktu. Perubahan signifikan akan diinformasikan via email atau notifikasi in-app.', '2026-10-14 05:13:06.702992+00', NULL);


--
-- Data for Name: court_photos; Type: TABLE DATA; Schema: public; Owner: brodit
--



--
-- Data for Name: group_bookings; Type: TABLE DATA; Schema: public; Owner: brodit
--

INSERT INTO public.group_bookings (id, organizer_id, venue_id, court_id, sport_id, title, description, booking_date, start_time, end_time, duration_minutes, min_participants, max_participants, price_per_slot, status, deadline, final_booking_id, created_at, updated_at) VALUES ('b996e436-266b-44b8-a0fe-f0648891cbfa', 'f3f38ac3-1cc2-42e2-bafd-a8ab91753923', 'venue-greenfield', 'court-f1', 'sport-futsal', 'Futsal Bareng Kantor', 'Testing optimizer', NULL, NULL, NULL, 60, 4, 10, 150000, 'draft', NULL, NULL, '2026-08-27 08:48:37.855601+00', '2026-08-27 08:48:37.855601+00');
INSERT INTO public.group_bookings (id, organizer_id, venue_id, court_id, sport_id, title, description, booking_date, start_time, end_time, duration_minutes, min_participants, max_participants, price_per_slot, status, deadline, final_booking_id, created_at, updated_at) VALUES ('4277d36f-0599-442a-95f5-6af718532342', 'f3f38ac3-1cc2-42e2-bafd-a8ab91753923', 'venue-greenfield', 'court-b1', 'sport-futsal', 'Futsal Bareng Kantor', 'Testing optimizer', '2026-09-10', '19:00:00', '21:00:00', 60, 3, 10, 150000, 'confirmed', NULL, 'bk-02edd7c1', '2026-08-27 08:48:41.519236+00', '2026-08-27 09:02:26.807153+00');
INSERT INTO public.group_bookings (id, organizer_id, venue_id, court_id, sport_id, title, description, booking_date, start_time, end_time, duration_minutes, min_participants, max_participants, price_per_slot, status, deadline, final_booking_id, created_at, updated_at) VALUES ('eeaf701d-c749-49f6-b98b-f3c2a82298df', 'f3f38ac3-1cc2-42e2-bafd-a8ab91753923', 'venue-greenfield', 'court-f1', 'sport-futsal', 'Test Group 1787822338', 'E2E test', '2026-09-20', '19:00:00', '20:00:00', 60, 2, 6, 100000, 'confirmed', NULL, 'bk-7e08f382', '2026-08-27 09:18:58.060997+00', '2026-08-27 09:19:21.948829+00');


--
-- Data for Name: group_booking_time_slots; Type: TABLE DATA; Schema: public; Owner: brodit
--

INSERT INTO public.group_booking_time_slots (id, group_booking_id, slot_date, start_time, end_time, vote_count, is_winner, created_at) VALUES ('114605bd-3078-4529-ae42-3f4afa4e4206', 'b996e436-266b-44b8-a0fe-f0648891cbfa', '2026-09-10', '19:00:00', '21:00:00', 0, false, '2026-08-27 08:48:37.875306+00');
INSERT INTO public.group_booking_time_slots (id, group_booking_id, slot_date, start_time, end_time, vote_count, is_winner, created_at) VALUES ('4617f6b4-051d-4a5d-ba24-5b82838bc122', 'b996e436-266b-44b8-a0fe-f0648891cbfa', '2026-09-11', '19:00:00', '21:00:00', 0, false, '2026-08-27 08:48:37.880289+00');
INSERT INTO public.group_booking_time_slots (id, group_booking_id, slot_date, start_time, end_time, vote_count, is_winner, created_at) VALUES ('09d8f001-9df0-48c1-88b9-c0bce94f8284', '4277d36f-0599-442a-95f5-6af718532342', '2026-09-11', '19:00:00', '21:00:00', 0, false, '2026-08-27 08:48:41.525848+00');
INSERT INTO public.group_booking_time_slots (id, group_booking_id, slot_date, start_time, end_time, vote_count, is_winner, created_at) VALUES ('74ea28a5-59f6-4c9a-9cb9-649527fe2bd6', '4277d36f-0599-442a-95f5-6af718532342', '2026-09-10', '19:00:00', '21:00:00', 3, true, '2026-08-27 08:48:41.524301+00');
INSERT INTO public.group_booking_time_slots (id, group_booking_id, slot_date, start_time, end_time, vote_count, is_winner, created_at) VALUES ('925c7e3f-d8b9-49ef-b0b5-dd18319e4d6a', 'eeaf701d-c749-49f6-b98b-f3c2a82298df', '2026-09-21', '19:00:00', '20:00:00', 0, false, '2026-08-27 09:18:58.070635+00');
INSERT INTO public.group_booking_time_slots (id, group_booking_id, slot_date, start_time, end_time, vote_count, is_winner, created_at) VALUES ('7a7e079e-ae8a-47e8-a6ab-32418f28e331', 'eeaf701d-c749-49f6-b98b-f3c2a82298df', '2026-09-20', '19:00:00', '20:00:00', 1, true, '2026-08-27 09:18:58.068774+00');


--
-- Data for Name: group_booking_participants; Type: TABLE DATA; Schema: public; Owner: brodit
--

INSERT INTO public.group_booking_participants (id, group_booking_id, customer_id, status, availability_json, vote_slot_id, split_amount, is_organizer, joined_at, confirmed_at) VALUES ('3a9cfa40-6b62-4cbe-b905-89f1cccfde55', 'b996e436-266b-44b8-a0fe-f0648891cbfa', 'f3f38ac3-1cc2-42e2-bafd-a8ab91753923', 'accepted', '[]', NULL, 0, true, '2026-08-27 08:48:37.867592+00', NULL);
INSERT INTO public.group_booking_participants (id, group_booking_id, customer_id, status, availability_json, vote_slot_id, split_amount, is_organizer, joined_at, confirmed_at) VALUES ('a3de3009-1d35-4581-8b4e-98562aaf01d4', '4277d36f-0599-442a-95f5-6af718532342', 'f3f38ac3-1cc2-42e2-bafd-a8ab91753923', 'confirmed', '[]', '74ea28a5-59f6-4c9a-9cb9-649527fe2bd6', 75316, true, '2026-08-27 08:48:41.521552+00', '2026-08-27 09:02:26.804219+00');
INSERT INTO public.group_booking_participants (id, group_booking_id, customer_id, status, availability_json, vote_slot_id, split_amount, is_organizer, joined_at, confirmed_at) VALUES ('b2d898ea-6633-4c12-bc4d-7172e1fdc922', '4277d36f-0599-442a-95f5-6af718532342', '4a3c8931-2740-4989-81b0-2719474ef180', 'confirmed', '[]', '74ea28a5-59f6-4c9a-9cb9-649527fe2bd6', 75315, false, '2026-08-27 08:49:19.146197+00', '2026-08-27 09:02:26.805377+00');
INSERT INTO public.group_booking_participants (id, group_booking_id, customer_id, status, availability_json, vote_slot_id, split_amount, is_organizer, joined_at, confirmed_at) VALUES ('05324e87-13f7-40f0-a64b-8fadccb84f75', '4277d36f-0599-442a-95f5-6af718532342', '837637b4-2ffb-4254-94c0-abc753963219', 'confirmed', '[]', '74ea28a5-59f6-4c9a-9cb9-649527fe2bd6', 75315, false, '2026-08-27 08:49:19.14908+00', '2026-08-27 09:02:26.806363+00');
INSERT INTO public.group_booking_participants (id, group_booking_id, customer_id, status, availability_json, vote_slot_id, split_amount, is_organizer, joined_at, confirmed_at) VALUES ('894ce5fb-7185-49b7-860e-09c4ce29af9c', 'eeaf701d-c749-49f6-b98b-f3c2a82298df', 'f3f38ac3-1cc2-42e2-bafd-a8ab91753923', 'confirmed', '[]', '7a7e079e-ae8a-47e8-a6ab-32418f28e331', 129548, true, '2026-08-27 09:18:58.065043+00', '2026-08-27 09:19:21.94669+00');
INSERT INTO public.group_booking_participants (id, group_booking_id, customer_id, status, availability_json, vote_slot_id, split_amount, is_organizer, joined_at, confirmed_at) VALUES ('ff38d69b-c4fc-4590-8404-929bb2a61227', 'eeaf701d-c749-49f6-b98b-f3c2a82298df', '4a3c8931-2740-4989-81b0-2719474ef180', 'confirmed', '[]', NULL, 129547, false, '2026-08-27 09:19:21.854755+00', '2026-08-27 09:19:21.94795+00');


--
-- Data for Name: holidays; Type: TABLE DATA; Schema: public; Owner: brodit
--

INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2025-01-01', '2025-01-01', 'Tahun Baru 2025', 'national', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2025-01-27', '2025-01-27', 'Isra Mikraj Nabi Muhammad SAW', 'religious', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2025-01-29', '2025-01-29', 'Tahun Baru Imlek 2576', 'religious', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2025-03-29', '2025-03-29', 'Hari Raya Nyepi', 'religious', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2025-03-31', '2025-03-31', 'Wafat Isa Almasih', 'religious', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2025-04-18', '2025-04-18', 'Jumat Agung', 'religious', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2025-05-01', '2025-05-01', 'Hari Buruh Internasional', 'national', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2025-05-12', '2025-05-12', 'Hari Raya Waisak', 'religious', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2025-05-29', '2025-05-29', 'Kenaikan Isa Almasih', 'religious', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2025-06-01', '2025-06-01', 'Hari Lahir Pancasila', 'national', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2025-06-07', '2025-06-07', 'Hari Raya Idul Fitri 1446H', 'religious', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2025-06-08', '2025-06-08', 'Hari Raya Idul Fitri 1446H (H2)', 'religious', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2025-06-09', '2025-06-09', 'Cuti Bersama Idul Fitri', 'joint_leave', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2025-06-10', '2025-06-10', 'Cuti Bersama Idul Fitri', 'joint_leave', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2025-06-11', '2025-06-11', 'Cuti Bersama Idul Fitri', 'joint_leave', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2025-06-12', '2025-06-12', 'Cuti Bersama Idul Fitri', 'joint_leave', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2025-07-07', '2025-07-07', 'Hari Raya Idul Adha 1446H', 'religious', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2025-07-08', '2025-07-08', 'Cuti Bersama Idul Adha', 'joint_leave', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2025-07-27', '2025-07-27', 'Tahun Baru Islam 1447H', 'religious', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2025-08-17', '2025-08-17', 'Hari Kemerdekaan RI', 'national', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2025-09-05', '2025-09-05', 'Maulid Nabi Muhammad SAW', 'religious', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2025-12-25', '2025-12-25', 'Hari Raya Natal', 'religious', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2025-12-26', '2025-12-26', 'Cuti Bersama Natal', 'joint_leave', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2026-01-01', '2026-01-01', 'Tahun Baru 2026', 'national', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2026-01-17', '2026-01-17', 'Isra Mikraj Nabi Muhammad SAW', 'religious', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2026-02-17', '2026-02-17', 'Tahun Baru Imlek 2577', 'religious', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2026-03-20', '2026-03-20', 'Hari Raya Nyepi', 'religious', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2026-03-21', '2026-03-21', 'Cuti Bersama Nyepi', 'joint_leave', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2026-04-03', '2026-04-03', 'Wafat Isa Almasih', 'religious', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2026-05-01', '2026-05-01', 'Hari Buruh Internasional', 'national', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2026-05-14', '2026-05-14', 'Kenaikan Isa Almasih', 'religious', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2026-05-26', '2026-05-26', 'Hari Raya Waisak', 'religious', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2026-05-27', '2026-05-27', 'Cuti Bersama Waisak', 'joint_leave', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2026-06-01', '2026-06-01', 'Hari Lahir Pancasila', 'national', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2026-05-28', '2026-05-28', 'Hari Raya Idul Fitri 1447H (H2)', 'religious', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2026-05-29', '2026-05-29', 'Cuti Bersama Idul Fitri', 'joint_leave', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2026-06-26', '2026-06-26', 'Hari Raya Idul Adha 1447H', 'religious', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2026-06-27', '2026-06-27', 'Cuti Bersama Idul Adha', 'joint_leave', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2026-07-17', '2026-07-17', 'Tahun Baru Islam 1448H', 'religious', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2026-08-17', '2026-08-17', 'Hari Kemerdekaan RI', 'national', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2026-08-25', '2026-08-25', 'Maulid Nabi Muhammad SAW', 'religious', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2026-12-25', '2026-12-25', 'Hari Raya Natal', 'religious', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2027-01-01', '2027-01-01', 'Tahun Baru 2027', 'national', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2027-01-07', '2027-01-07', 'Isra Mikraj Nabi Muhammad SAW', 'religious', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2027-02-06', '2027-02-06', 'Tahun Baru Imlek 2578', 'religious', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2027-03-10', '2027-03-10', 'Hari Raya Nyepi', 'religious', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2027-03-26', '2027-03-26', 'Wafat Isa Almasih', 'religious', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2027-05-01', '2027-05-01', 'Hari Buruh Internasional', 'national', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2027-05-16', '2027-05-16', 'Hari Raya Idul Fitri 1448H', 'religious', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2027-05-17', '2027-05-17', 'Hari Raya Idul Fitri 1448H (H2)', 'religious', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2027-06-01', '2027-06-01', 'Hari Lahir Pancasila', 'national', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2027-06-15', '2027-06-15', 'Hari Raya Idul Adha 1448H', 'religious', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2027-07-07', '2027-07-07', 'Tahun Baru Islam 1449H', 'religious', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2027-08-17', '2027-08-17', 'Hari Kemerdekaan RI', 'national', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2027-09-15', '2027-09-15', 'Maulid Nabi Muhammad SAW', 'religious', '', true, '2026-07-13 05:56:47.022155+00');
INSERT INTO public.holidays (id, date, name, type, description, is_active, created_at) VALUES ('h-2027-12-25', '2027-12-25', 'Hari Raya Natal', 'religious', '', true, '2026-07-13 05:56:47.022155+00');


--
-- Data for Name: loyalty_tiers; Type: TABLE DATA; Schema: public; Owner: brodit
--

INSERT INTO public.loyalty_tiers (id, name, min_points, multiplier, benefits, is_active, created_at) VALUES ('164d896a-291d-41c9-ac80-e8612ced256d', 'Bronze', 0, 1.00, '{"discount": 0, "priority_booking": false, "flash_deal_priority": false}', true, '2026-08-27 08:57:50.418536+00');
INSERT INTO public.loyalty_tiers (id, name, min_points, multiplier, benefits, is_active, created_at) VALUES ('cae4f7ec-0d0b-4bbd-9bc9-1acadd4771e4', 'Silver', 500, 1.20, '{"discount": 5, "priority_booking": false, "flash_deal_priority": false}', true, '2026-08-27 08:57:50.418536+00');
INSERT INTO public.loyalty_tiers (id, name, min_points, multiplier, benefits, is_active, created_at) VALUES ('565e0c15-42db-4300-9b46-783042990035', 'Gold', 2000, 1.50, '{"discount": 10, "priority_booking": false, "flash_deal_priority": true}', true, '2026-08-27 08:57:50.418536+00');
INSERT INTO public.loyalty_tiers (id, name, min_points, multiplier, benefits, is_active, created_at) VALUES ('78f15906-e728-498f-a0f1-36300c407f77', 'Platinum', 5000, 2.00, '{"discount": 15, "priority_booking": true, "flash_deal_priority": true}', true, '2026-08-27 08:57:50.418536+00');


--
-- Data for Name: loyalty_transactions; Type: TABLE DATA; Schema: public; Owner: brodit
--

INSERT INTO public.loyalty_transactions (id, customer_id, booking_id, booking_code, type, points, description, created_at, expires_at) VALUES ('4e1f639d-073c-4b55-a6c9-7a1c54870cb7', '85017077-dbeb-4b09-a686-2070f4dd65aa', 'bk-3e746fde', NULL, 'earned', 16, 'Booking #BK-260827-7070 - sport-padel at venue-greenfield', '2026-08-27 09:45:04.140637+00', NULL);
INSERT INTO public.loyalty_transactions (id, customer_id, booking_id, booking_code, type, points, description, created_at, expires_at) VALUES ('549be8de-3b6b-440d-b81a-3a39e6588aad', '85017077-dbeb-4b09-a686-2070f4dd65aa', NULL, NULL, 'bonus', 50000, 'Bonus referral: teman bergabung', '2026-08-27 09:45:25.036578+00', NULL);
INSERT INTO public.loyalty_transactions (id, customer_id, booking_id, booking_code, type, points, description, created_at, expires_at) VALUES ('e65489a7-299c-4dcc-b637-85ccefe7bc4b', '5e3ad1e5-5b58-46c2-8a9c-3c4c4250bb02', NULL, NULL, 'bonus', 25000, 'Bonus menggunakan kode referral REF-BGWRHW', '2026-08-27 09:45:25.036578+00', NULL);
INSERT INTO public.loyalty_transactions (id, customer_id, booking_id, booking_code, type, points, description, created_at, expires_at) VALUES ('788460aa-69a4-4533-b35f-da1d1757b1c3', 'fb913253-5cc7-4f5c-8504-43a7bf2d1d66', 'bk-7c776dc4', NULL, 'earned', 18, 'Booking #BK-260827-41D8 - sport-padel at venue-greenfield', '2026-08-27 09:51:56.374138+00', NULL);
INSERT INTO public.loyalty_transactions (id, customer_id, booking_id, booking_code, type, points, description, created_at, expires_at) VALUES ('63eec29d-b912-4550-9993-d54a9f0d6551', '8f8874af-4b82-4542-aece-0823e67f304d', NULL, NULL, 'bonus', 50000, 'Bonus referral: teman bergabung', '2026-08-27 13:30:41.603776+00', NULL);
INSERT INTO public.loyalty_transactions (id, customer_id, booking_id, booking_code, type, points, description, created_at, expires_at) VALUES ('58c8ca01-abfe-40e0-83c2-d8a2dee07b3d', '5338b1e8-aa19-441f-8fa4-f167a6d7482f', NULL, NULL, 'bonus', 25000, 'Bonus menggunakan kode referral REF-7UP8JF', '2026-08-27 13:30:41.603776+00', NULL);
INSERT INTO public.loyalty_transactions (id, customer_id, booking_id, booking_code, type, points, description, created_at, expires_at) VALUES ('fa065b0d-b179-4ffe-b709-4f95fb811f28', '3f911abb-d744-460b-a1e4-15d7c400e689', NULL, NULL, 'bonus', 50000, 'Bonus referral: teman bergabung', '2026-08-27 14:00:22.49057+00', NULL);
INSERT INTO public.loyalty_transactions (id, customer_id, booking_id, booking_code, type, points, description, created_at, expires_at) VALUES ('2bced5e2-2534-466a-9ac1-3894970913fa', 'caee7a15-bda7-48e8-8c2c-147d026adf9e', NULL, NULL, 'bonus', 25000, 'Bonus menggunakan kode referral REF-GZWWUW', '2026-08-27 14:00:22.49057+00', NULL);
INSERT INTO public.loyalty_transactions (id, customer_id, booking_id, booking_code, type, points, description, created_at, expires_at) VALUES ('ee32f6dd-2f10-40e4-83ff-3bd2aeec4324', '454faf71-0c5a-475a-882b-57c7d5fc91b1', 'bk-58bd289b', NULL, 'earned', 10, 'Booking #BK-260829-AC90 - sport-basket at venue-greenfield', '2026-08-30 15:36:13.427397+00', NULL);


--
-- Data for Name: notification_logs; Type: TABLE DATA; Schema: public; Owner: brodit
--

INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('2e95bb29-8dc0-4c21-9423-a3b751f27f9b', 'booking_created', 'email', 'da@fad.com', 'Booking BK-260713-976D — Menunggu Pembayaran', 'Halo dshfds,

Booking Anda telah dibuat.

Kode Booking: BK-260713-976D
Tanggal: Senin, 13 Juli 2026
Jam: 17:00 — 19:00
Total: Rp 250.159

Silakan lakukan pembayaran untuk mengkonfirmasi booking Anda.

Terima kasih,
Lapangin', 'sent', 'bk-6f64fb0f', 'BK-260713-976D', NULL, '2026-07-13 08:39:25.020029+00', NULL, '2026-07-13 08:39:25.020029+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('a96e401f-fe2b-4338-9642-8adb30eeecc6', 'admin_new_booking', 'in_app', 'admin', '[Admin] Booking Baru: BK-260713-976D', 'Booking baru masuk.

Kode: BK-260713-976D
Pelanggan: dshfds
Tanggal: Senin, 13 Juli 2026
Jam: 17:00 — 19:00
Total: Rp 250.159

Silakan review di dashboard admin.', 'sent', 'bk-6f64fb0f', 'BK-260713-976D', NULL, '2026-07-13 08:39:25.023659+00', NULL, '2026-07-13 08:39:25.023659+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('c8c9943b-e41d-4ee4-b5be-95996891b210', 'booking_created', 'email', 'raka.padel.baru@example.com', 'Booking BK-260827-9EF0 — Menunggu Pembayaran', 'Halo Raka Padel Baru,

Booking Anda telah dibuat.

Kode Booking: BK-260827-9EF0
Tanggal: Kamis, 27 Agustus 2026
Jam: 20:00 — 21:00
Total: Rp 187.866

Silakan lakukan pembayaran untuk mengkonfirmasi booking Anda.

Terima kasih,
Lapangin', 'sent', 'bk-fe6f783e', 'BK-260827-9EF0', NULL, '2026-08-27 09:36:16.008069+00', NULL, '2026-08-27 09:36:16.008069+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('6b4ce250-5d3a-4e64-bf48-19a2d2cd58d1', 'admin_new_booking', 'in_app', 'admin', '[Admin] Booking Baru: BK-260827-9EF0', 'Booking baru masuk.

Kode: BK-260827-9EF0
Pelanggan: Raka Padel Baru
Tanggal: Kamis, 27 Agustus 2026
Jam: 20:00 — 21:00
Total: Rp 187.866

Silakan review di dashboard admin.', 'sent', 'bk-fe6f783e', 'BK-260827-9EF0', NULL, '2026-08-27 09:36:16.019014+00', NULL, '2026-08-27 09:36:16.019014+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('b5efc097-c21a-4418-8dd1-329954050782', 'booking_created', 'email', 'john@example.com', 'Booking BK-260827-FE9B — Menunggu Pembayaran', 'Halo John Doe,

Booking Anda telah dibuat.

Kode Booking: BK-260827-FE9B
Tanggal: Kamis, 10 September 2026
Jam: 19:00 — 21:00
Total: Rp 225.740

Silakan lakukan pembayaran untuk mengkonfirmasi booking Anda.

Terima kasih,
Lapangin', 'sent', NULL, 'BK-260827-FE9B', NULL, '2026-08-27 08:57:52.91763+00', NULL, '2026-08-27 08:57:52.91763+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('82104f4d-cfff-4798-869f-537e99d85052', 'admin_new_booking', 'in_app', 'admin', '[Admin] Booking Baru: BK-260827-FE9B', 'Booking baru masuk.

Kode: BK-260827-FE9B
Pelanggan: John Doe
Tanggal: Kamis, 10 September 2026
Jam: 19:00 — 21:00
Total: Rp 225.740

Silakan review di dashboard admin.', 'sent', NULL, 'BK-260827-FE9B', NULL, '2026-08-27 08:57:52.921724+00', NULL, '2026-08-27 08:57:52.921724+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('e3120215-2490-4f04-a29c-10fc78479ab2', 'booking_created', 'email', 'raka.padel.baru2@example.com', 'Booking BK-260827-8840 — Menunggu Pembayaran', 'Halo Raka Padel Baru,

Booking Anda telah dibuat.

Kode Booking: BK-260827-8840
Tanggal: Kamis, 27 Agustus 2026
Jam: 21:00 — 22:00
Total: Rp 129.097

Silakan lakukan pembayaran untuk mengkonfirmasi booking Anda.

Terima kasih,
Lapangin', 'sent', 'bk-e30ddf2e', 'BK-260827-8840', NULL, '2026-08-27 09:36:33.073869+00', NULL, '2026-08-27 09:36:33.073869+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('4d834727-0e57-4cba-b053-fd28ba1eec9b', 'admin_new_booking', 'in_app', 'admin', '[Admin] Booking Baru: BK-260827-8840', 'Booking baru masuk.

Kode: BK-260827-8840
Pelanggan: Raka Padel Baru
Tanggal: Kamis, 27 Agustus 2026
Jam: 21:00 — 22:00
Total: Rp 129.097

Silakan review di dashboard admin.', 'sent', 'bk-e30ddf2e', 'BK-260827-8840', NULL, '2026-08-27 09:36:33.076839+00', NULL, '2026-08-27 09:36:33.076839+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('7c2f74a0-1397-4b3b-88c9-4021139d1407', 'booking_created', 'email', 'john@example.com', 'Booking BK-260827-7E95 — Menunggu Pembayaran', 'Halo John Doe,

Booking Anda telah dibuat.

Kode Booking: BK-260827-7E95
Tanggal: Kamis, 10 September 2026
Jam: 19:00 — 21:00
Total: Rp 225.415

Silakan lakukan pembayaran untuk mengkonfirmasi booking Anda.

Terima kasih,
Lapangin', 'sent', NULL, 'BK-260827-7E95', NULL, '2026-08-27 09:01:40.732768+00', NULL, '2026-08-27 09:01:40.732768+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('ad4bfba2-1ff4-451d-9706-e0e8f17817e9', 'admin_new_booking', 'in_app', 'admin', '[Admin] Booking Baru: BK-260827-7E95', 'Booking baru masuk.

Kode: BK-260827-7E95
Pelanggan: John Doe
Tanggal: Kamis, 10 September 2026
Jam: 19:00 — 21:00
Total: Rp 225.415

Silakan review di dashboard admin.', 'sent', NULL, 'BK-260827-7E95', NULL, '2026-08-27 09:01:40.735349+00', NULL, '2026-08-27 09:01:40.735349+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('484844ec-bf44-400d-ba8d-c50663edc184', 'booking_created', 'email', 'john@example.com', 'Booking BK-260827-A1FB — Menunggu Pembayaran', 'Halo John Doe,

Booking Anda telah dibuat.

Kode Booking: BK-260827-A1FB
Tanggal: Kamis, 10 September 2026
Jam: 19:00 — 21:00
Total: Rp 225.946

Silakan lakukan pembayaran untuk mengkonfirmasi booking Anda.

Terima kasih,
Lapangin', 'sent', 'bk-02edd7c1', 'BK-260827-A1FB', NULL, '2026-08-27 09:02:26.800546+00', NULL, '2026-08-27 09:02:26.800546+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('2493932a-00ff-4c4b-9d8e-e22fe674c39d', 'admin_new_booking', 'in_app', 'admin', '[Admin] Booking Baru: BK-260827-A1FB', 'Booking baru masuk.

Kode: BK-260827-A1FB
Pelanggan: John Doe
Tanggal: Kamis, 10 September 2026
Jam: 19:00 — 21:00
Total: Rp 225.946

Silakan review di dashboard admin.', 'sent', 'bk-02edd7c1', 'BK-260827-A1FB', NULL, '2026-08-27 09:02:26.803035+00', NULL, '2026-08-27 09:02:26.803035+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('a0d486e9-701f-47b5-b109-0f3d02427ae4', 'booking_created', 'email', 'john@example.com', 'Booking BK-260827-85FD — Menunggu Pembayaran', 'Halo John Doe,

Booking Anda telah dibuat.

Kode Booking: BK-260827-85FD
Tanggal: Minggu, 20 September 2026
Jam: 19:00 — 20:00
Total: Rp 259.095

Silakan lakukan pembayaran untuk mengkonfirmasi booking Anda.

Terima kasih,
Lapangin', 'sent', 'bk-7e08f382', 'BK-260827-85FD', NULL, '2026-08-27 09:19:21.93651+00', NULL, '2026-08-27 09:19:21.93651+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('60ff84bd-94b9-4686-89aa-b1ef3ab2d07a', 'admin_new_booking', 'in_app', 'admin', '[Admin] Booking Baru: BK-260827-85FD', 'Booking baru masuk.

Kode: BK-260827-85FD
Pelanggan: John Doe
Tanggal: Minggu, 20 September 2026
Jam: 19:00 — 20:00
Total: Rp 259.095

Silakan review di dashboard admin.', 'sent', 'bk-7e08f382', 'BK-260827-85FD', NULL, '2026-08-27 09:19:21.944608+00', NULL, '2026-08-27 09:19:21.944608+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('de229ad5-b674-4ee9-8ba3-3ccf68d6ebaa', 'booking_created', 'email', 'john@example.com', 'Booking BK-260827-F689 — Menunggu Pembayaran', 'Halo John Doe,

Booking Anda telah dibuat.

Kode Booking: BK-260827-F689
Tanggal: Kamis, 27 Agustus 2026
Jam: 19:00 — 20:00
Total: Rp 225.846

Silakan lakukan pembayaran untuk mengkonfirmasi booking Anda.

Terima kasih,
Lapangin', 'sent', 'bk-7adfa04a', 'BK-260827-F689', NULL, '2026-08-27 09:24:56.750632+00', NULL, '2026-08-27 09:24:56.750632+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('c13e38b2-4fb9-4766-bdfd-e0d3a2735e87', 'admin_new_booking', 'in_app', 'admin', '[Admin] Booking Baru: BK-260827-F689', 'Booking baru masuk.

Kode: BK-260827-F689
Pelanggan: John Doe
Tanggal: Kamis, 27 Agustus 2026
Jam: 19:00 — 20:00
Total: Rp 225.846

Silakan review di dashboard admin.', 'sent', 'bk-7adfa04a', 'BK-260827-F689', NULL, '2026-08-27 09:24:56.752443+00', NULL, '2026-08-27 09:24:56.752443+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('a7ed4ac3-c381-403b-bd0d-ecaca29fa708', 'booking_created', 'email', 'padelbaru1787823777@example.com', 'Booking BK-260827-7070 — Menunggu Pembayaran', 'Halo Raka Padel Baru,

Booking Anda telah dibuat.

Kode Booking: BK-260827-7070
Tanggal: Kamis, 27 Agustus 2026
Jam: 18:00 — 19:00
Total: Rp 169.646

Silakan lakukan pembayaran untuk mengkonfirmasi booking Anda.

Terima kasih,
Lapangin', 'sent', 'bk-3e746fde', 'BK-260827-7070', NULL, '2026-08-27 09:43:55.480747+00', NULL, '2026-08-27 09:43:55.480747+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('589855f8-e23b-42da-9e32-e0c47c1e5e21', 'admin_new_booking', 'in_app', 'admin', '[Admin] Booking Baru: BK-260827-7070', 'Booking baru masuk.

Kode: BK-260827-7070
Pelanggan: Raka Padel Baru
Tanggal: Kamis, 27 Agustus 2026
Jam: 18:00 — 19:00
Total: Rp 169.646

Silakan review di dashboard admin.', 'sent', 'bk-3e746fde', 'BK-260827-7070', NULL, '2026-08-27 09:43:55.483723+00', NULL, '2026-08-27 09:43:55.483723+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('f293aad9-0d09-4609-b3e6-c74bbc276799', 'booking_created', 'email', 'rakalive1787824000@example.com', 'Booking BK-260827-41D8 — Menunggu Pembayaran', 'Halo Raka Live Padel,

Booking Anda telah dibuat.

Kode Booking: BK-260827-41D8
Tanggal: Kamis, 27 Agustus 2026
Jam: 19:00 — 20:00
Total: Rp 188.013

Silakan lakukan pembayaran untuk mengkonfirmasi booking Anda.

Terima kasih,
Lapangin', 'sent', 'bk-7c776dc4', 'BK-260827-41D8', NULL, '2026-08-27 09:50:57.623179+00', NULL, '2026-08-27 09:50:57.623179+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('cfd4fe52-7be0-4d2d-b559-ffac56b9e71f', 'admin_new_booking', 'in_app', 'admin', '[Admin] Booking Baru: BK-260827-41D8', 'Booking baru masuk.

Kode: BK-260827-41D8
Pelanggan: Raka Live Padel
Tanggal: Kamis, 27 Agustus 2026
Jam: 19:00 — 20:00
Total: Rp 188.013

Silakan review di dashboard admin.', 'sent', 'bk-7c776dc4', 'BK-260827-41D8', NULL, '2026-08-27 09:50:57.627019+00', NULL, '2026-08-27 09:50:57.627019+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('6811070f-f81e-4c45-bea1-673abffc4119', 'booking_created', 'email', 'live-basket-1787831352236@test.com', 'Booking BK-260827-14CE — Menunggu Pembayaran', 'Halo Live Basket Tester,

Booking Anda telah dibuat.

Kode Booking: BK-260827-14CE
Tanggal: Jumat, 28 Agustus 2026
Jam: 06:00 — 07:00
Total: Rp 90.580

Silakan lakukan pembayaran untuk mengkonfirmasi booking Anda.

Terima kasih,
Lapangin', 'sent', 'bk-2fb478b3', 'BK-260827-14CE', NULL, '2026-08-27 11:49:13.315781+00', NULL, '2026-08-27 11:49:13.315781+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('146999ab-4cae-4dd5-a9b9-f4eefe156a42', 'admin_new_booking', 'in_app', 'admin', '[Admin] Booking Baru: BK-260827-14CE', 'Booking baru masuk.

Kode: BK-260827-14CE
Pelanggan: Live Basket Tester
Tanggal: Jumat, 28 Agustus 2026
Jam: 06:00 — 07:00
Total: Rp 90.580

Silakan review di dashboard admin.', 'sent', 'bk-2fb478b3', 'BK-260827-14CE', NULL, '2026-08-27 11:49:13.320152+00', NULL, '2026-08-27 11:49:13.320152+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('9f6af0fb-97ed-4798-96cb-97c6490bc09a', 'booking_created', 'email', 'basket-1787837438@test.com', 'Booking BK-260827-408A — Menunggu Pembayaran', 'Halo Tester Basket,

Booking Anda telah dibuat.

Kode Booking: BK-260827-408A
Tanggal: Jumat, 28 Agustus 2026
Jam: 07:00 — 08:00
Total: Rp 81.517

Silakan lakukan pembayaran untuk mengkonfirmasi booking Anda.

Terima kasih,
Lapangin', 'sent', 'bk-92f91ddd', 'BK-260827-408A', NULL, '2026-08-27 13:30:39.942368+00', NULL, '2026-08-27 13:30:39.942368+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('c570ceb2-a23c-474f-aff5-7a4e7ed15137', 'admin_new_booking', 'in_app', 'admin', '[Admin] Booking Baru: BK-260827-408A', 'Booking baru masuk.

Kode: BK-260827-408A
Pelanggan: Tester Basket
Tanggal: Jumat, 28 Agustus 2026
Jam: 07:00 — 08:00
Total: Rp 81.517

Silakan review di dashboard admin.', 'sent', 'bk-92f91ddd', 'BK-260827-408A', NULL, '2026-08-27 13:30:39.944379+00', NULL, '2026-08-27 13:30:39.944379+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('6b31cadf-88c0-4311-a127-65f59e5591c9', 'booking_created', 'email', 'live-1788024465@test.com', 'Booking BK-260829-AC90 — Menunggu Pembayaran', 'Halo Live Test,

Booking Anda telah dibuat.

Kode Booking: BK-260829-AC90
Tanggal: Senin, 31 Agustus 2026
Jam: 08:00 — 09:00
Total: Rp 100.534

Silakan lakukan pembayaran untuk mengkonfirmasi booking Anda.

Terima kasih,
Lapangin', 'sent', 'bk-58bd289b', 'BK-260829-AC90', NULL, '2026-08-29 17:27:50.122797+00', NULL, '2026-08-29 17:27:50.122797+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('d4b10fd0-846c-4907-bc65-624c20754a2a', 'admin_new_booking', 'in_app', 'admin', '[Admin] Booking Baru: BK-260829-AC90', 'Booking baru masuk.

Kode: BK-260829-AC90
Pelanggan: Live Test
Tanggal: Senin, 31 Agustus 2026
Jam: 08:00 — 09:00
Total: Rp 100.534

Silakan review di dashboard admin.', 'sent', 'bk-58bd289b', 'BK-260829-AC90', NULL, '2026-08-29 17:27:50.130714+00', NULL, '2026-08-29 17:27:50.130714+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('7805af85-29c1-4778-b719-75b699bf5963', 'booking_created', 'email', 'spora.gz@gmail.com', 'Booking BK-261013-5800 — Menunggu Pembayaran', 'Halo Mayun Subania,

Booking Anda telah dibuat.

Kode Booking: BK-261013-5800
Tanggal: Rabu, 14 Oktober 2026
Jam: 07:00 — 09:00
Total: Rp 153.684

Silakan lakukan pembayaran untuk mengkonfirmasi booking Anda.

Terima kasih,
Lapabook', 'sent', 'bk-b20c6455', 'BK-261013-5800', NULL, '2026-10-13 22:28:45.471907+00', NULL, '2026-10-13 22:28:45.471907+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('60cbfc8e-1105-45b4-95de-f9bd3ef7e08f', 'admin_new_booking', 'in_app', 'admin', '[Admin] Booking Baru: BK-261013-5800', 'Booking baru masuk.

Kode: BK-261013-5800
Pelanggan: Mayun Subania
Tanggal: Rabu, 14 Oktober 2026
Jam: 07:00 — 09:00
Total: Rp 153.684

Silakan review di dashboard admin.', 'sent', 'bk-b20c6455', 'BK-261013-5800', NULL, '2026-10-13 22:28:45.482498+00', NULL, '2026-10-13 22:28:45.482498+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('dcb3271e-c5a4-4aa6-98ba-aa78f2752620', 'booking_created', 'email', 'spora.gz@gmail.com', 'Booking BK-261013-9C4C — Menunggu Pembayaran', 'Halo Mayun Subania,

Booking Anda telah dibuat.

Kode Booking: BK-261013-9C4C
Tanggal: Rabu, 14 Oktober 2026
Jam: 12:00 — 14:00
Total: Rp 200.268

Silakan lakukan pembayaran untuk mengkonfirmasi booking Anda.

Terima kasih,
Lapabook', 'sent', 'bk-84ea0398', 'BK-261013-9C4C', NULL, '2026-10-13 22:29:02.301702+00', NULL, '2026-10-13 22:29:02.301702+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('8cd0c26c-4f01-4a8e-96bf-6da38da88005', 'admin_new_booking', 'in_app', 'admin', '[Admin] Booking Baru: BK-261013-9C4C', 'Booking baru masuk.

Kode: BK-261013-9C4C
Pelanggan: Mayun Subania
Tanggal: Rabu, 14 Oktober 2026
Jam: 12:00 — 14:00
Total: Rp 200.268

Silakan review di dashboard admin.', 'sent', 'bk-84ea0398', 'BK-261013-9C4C', NULL, '2026-10-13 22:29:02.303772+00', NULL, '2026-10-13 22:29:02.303772+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('2a210eb6-8ce8-4447-85fc-9f77865df366', 'booking_created', 'whatsapp', '8123456789', 'Booking BK-261014-019F — Menunggu Pembayaran', 'Halo Test Voucher,

Booking Anda telah dibuat.

Kode Booking: BK-261014-019F
Tanggal: Senin, 30 November 2026
Jam: 10:00 — 11:00
Total: Rp 162.549

Silakan lakukan pembayaran untuk mengkonfirmasi booking Anda.

Terima kasih,
Lapabook', 'sent', NULL, 'BK-261014-019F', NULL, '2026-10-13 22:54:43.136938+00', NULL, '2026-10-13 22:54:43.136938+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('ddb859b1-9f25-4956-a05b-9f6055cc4536', 'admin_new_booking', 'in_app', 'admin', '[Admin] Booking Baru: BK-261014-019F', 'Booking baru masuk.

Kode: BK-261014-019F
Pelanggan: Test Voucher
Tanggal: Senin, 30 November 2026
Jam: 10:00 — 11:00
Total: Rp 162.549

Silakan review di dashboard admin.', 'sent', NULL, 'BK-261014-019F', NULL, '2026-10-13 22:54:43.145816+00', NULL, '2026-10-13 22:54:43.145816+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('18750ec3-a198-4b18-b411-847cc25ce233', 'booking_created', 'whatsapp', '8123456789', 'Booking BK-261014-3197 — Menunggu Pembayaran', 'Halo Test Voucher,

Booking Anda telah dibuat.

Kode Booking: BK-261014-3197
Tanggal: Selasa, 1 Desember 2026
Jam: 10:00 — 11:00
Total: Rp 180.895

Silakan lakukan pembayaran untuk mengkonfirmasi booking Anda.

Terima kasih,
Lapabook', 'sent', NULL, 'BK-261014-3197', NULL, '2026-10-13 22:54:43.193915+00', NULL, '2026-10-13 22:54:43.193915+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('8412a647-6f9b-419c-b638-a7a09e9edfb6', 'admin_new_booking', 'in_app', 'admin', '[Admin] Booking Baru: BK-261014-3197', 'Booking baru masuk.

Kode: BK-261014-3197
Pelanggan: Test Voucher
Tanggal: Selasa, 1 Desember 2026
Jam: 10:00 — 11:00
Total: Rp 180.895

Silakan review di dashboard admin.', 'sent', NULL, 'BK-261014-3197', NULL, '2026-10-13 22:54:43.196295+00', NULL, '2026-10-13 22:54:43.196295+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('64c6dc65-1b2c-4555-b1f7-9b4d89ba94a9', 'booking_created', 'email', 'spora.gz@gmail.com', 'Booking BK-261014-6B15 — Menunggu Pembayaran', 'Halo Mayun Subania,

Booking Anda telah dibuat.

Kode Booking: BK-261014-6B15
Tanggal: Rabu, 14 Oktober 2026
Jam: 20:00 — 22:00
Total: Rp 275.509

Silakan lakukan pembayaran untuk mengkonfirmasi booking Anda.

Terima kasih,
Lapabook', 'sent', 'bk-b0d4ff7c', 'BK-261014-6B15', NULL, '2026-10-14 08:20:16.313839+00', NULL, '2026-10-14 08:20:16.313839+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('99e92e7d-9eb6-4fa4-bb70-cf97fa9ee371', 'admin_new_booking', 'in_app', 'admin', '[Admin] Booking Baru: BK-261014-6B15', 'Booking baru masuk.

Kode: BK-261014-6B15
Pelanggan: Mayun Subania
Tanggal: Rabu, 14 Oktober 2026
Jam: 20:00 — 22:00
Total: Rp 275.509

Silakan review di dashboard admin.', 'sent', 'bk-b0d4ff7c', 'BK-261014-6B15', NULL, '2026-10-14 08:20:16.317205+00', NULL, '2026-10-14 08:20:16.317205+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('51f83edb-2e1f-4f10-962a-bf2b94fd0b0e', 'booking_created', 'email', 'test@example.com', 'Booking BK-261014-C7D4 — Menunggu Pembayaran', 'Halo Test Guest,

Booking Anda telah dibuat.

Kode Booking: BK-261014-C7D4
Tanggal: Selasa, 20 Oktober 2026
Jam: 20:00 — 21:00
Total: Rp 138.417

Silakan lakukan pembayaran untuk mengkonfirmasi booking Anda.

Terima kasih,
Lapabook', 'sent', 'bk-f1844d06', 'BK-261014-C7D4', NULL, '2026-10-14 08:30:57.462031+00', NULL, '2026-10-14 08:30:57.462031+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('e7f1b2bb-1fc8-46cf-bc5e-ce21f59e17f5', 'admin_new_booking', 'in_app', 'admin', '[Admin] Booking Baru: BK-261014-C7D4', 'Booking baru masuk.

Kode: BK-261014-C7D4
Pelanggan: Test Guest
Tanggal: Selasa, 20 Oktober 2026
Jam: 20:00 — 21:00
Total: Rp 138.417

Silakan review di dashboard admin.', 'sent', 'bk-f1844d06', 'BK-261014-C7D4', NULL, '2026-10-14 08:30:57.465007+00', NULL, '2026-10-14 08:30:57.465007+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('66bf71ed-2c44-47cc-985c-755101d94759', 'booking_created', 'email', 'test@msr.dev', 'Booking BK-261014-CF47 — Menunggu Pembayaran', 'Halo Test Guest MSR,

Booking Anda telah dibuat.

Kode Booking: BK-261014-CF47
Tanggal: Rabu, 21 Oktober 2026
Jam: 20:00 — 21:00
Total: Rp 138.289

Silakan lakukan pembayaran untuk mengkonfirmasi booking Anda.

Terima kasih,
Lapabook', 'sent', NULL, 'BK-261014-CF47', NULL, '2026-10-14 08:33:52.70474+00', NULL, '2026-10-14 08:33:52.70474+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('8d908197-a437-428d-a4c6-4ff25440e0d2', 'admin_new_booking', 'in_app', 'admin', '[Admin] Booking Baru: BK-261014-CF47', 'Booking baru masuk.

Kode: BK-261014-CF47
Pelanggan: Test Guest MSR
Tanggal: Rabu, 21 Oktober 2026
Jam: 20:00 — 21:00
Total: Rp 138.289

Silakan review di dashboard admin.', 'sent', NULL, 'BK-261014-CF47', NULL, '2026-10-14 08:33:52.70725+00', NULL, '2026-10-14 08:33:52.70725+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('2196ac43-3448-4a3a-8c0a-00eb5f10a534', 'booking_created', 'email', 'john@example.com', 'Booking BK-261014-8D28 — Menunggu Pembayaran', 'Halo John Doe,

Booking Anda telah dibuat.

Kode Booking: BK-261014-8D28
Tanggal: Kamis, 22 Oktober 2026
Jam: 19:00 — 20:00
Total: Rp 163.222

Silakan lakukan pembayaran untuk mengkonfirmasi booking Anda.

Terima kasih,
Lapabook', 'sent', NULL, 'BK-261014-8D28', NULL, '2026-10-14 08:58:54.282509+00', NULL, '2026-10-14 08:58:54.282509+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('7c90b595-e09a-4839-9bf9-7f782b947c4e', 'admin_new_booking', 'in_app', 'admin', '[Admin] Booking Baru: BK-261014-8D28', 'Booking baru masuk.

Kode: BK-261014-8D28
Pelanggan: John Doe
Tanggal: Kamis, 22 Oktober 2026
Jam: 19:00 — 20:00
Total: Rp 163.222

Silakan review di dashboard admin.', 'sent', NULL, 'BK-261014-8D28', NULL, '2026-10-14 08:58:54.286003+00', NULL, '2026-10-14 08:58:54.286003+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('d68fea73-3464-4964-b144-67ee398bc9ba', 'booking_created', 'email', 'gueste2e@msr.dev', 'Booking BK-261014-0361 — Menunggu Pembayaran', 'Halo Test Guest E2E,

Booking Anda telah dibuat.

Kode Booking: BK-261014-0361
Tanggal: Jumat, 23 Oktober 2026
Jam: 10:00 — 11:00
Total: Rp 130.454

Silakan lakukan pembayaran untuk mengkonfirmasi booking Anda.

Terima kasih,
Lapabook', 'sent', NULL, 'BK-261014-0361', NULL, '2026-10-14 09:00:48.17825+00', NULL, '2026-10-14 09:00:48.17825+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('c191b8d6-2cb8-46e9-aa1e-87dbbc605591', 'admin_new_booking', 'in_app', 'admin', '[Admin] Booking Baru: BK-261014-0361', 'Booking baru masuk.

Kode: BK-261014-0361
Pelanggan: Test Guest E2E
Tanggal: Jumat, 23 Oktober 2026
Jam: 10:00 — 11:00
Total: Rp 130.454

Silakan review di dashboard admin.', 'sent', NULL, 'BK-261014-0361', NULL, '2026-10-14 09:00:48.180465+00', NULL, '2026-10-14 09:00:48.180465+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('d41d506d-9bf8-42de-b933-36f429d9ed2e', 'booking_created', 'whatsapp', '08199990001', 'Booking BK-261014-0FFD — Menunggu Pembayaran', 'Halo Test DP E2E,

Booking Anda telah dibuat.

Kode Booking: BK-261014-0FFD
Tanggal: Senin, 26 Oktober 2026
Jam: 10:00 — 11:00
Total: Rp 130.578

Silakan lakukan pembayaran untuk mengkonfirmasi booking Anda.

Terima kasih,
Lapabook', 'sent', NULL, 'BK-261014-0FFD', NULL, '2026-10-14 18:03:31.699376+00', NULL, '2026-10-14 18:03:31.699376+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('88e72a35-6083-46f8-9b33-8d04d9644a48', 'admin_new_booking', 'in_app', 'admin', '[Admin] Booking Baru: BK-261014-0FFD', 'Booking baru masuk.

Kode: BK-261014-0FFD
Pelanggan: Test DP E2E
Tanggal: Senin, 26 Oktober 2026
Jam: 10:00 — 11:00
Total: Rp 130.578

Silakan review di dashboard admin.', 'sent', NULL, 'BK-261014-0FFD', NULL, '2026-10-14 18:03:31.706831+00', NULL, '2026-10-14 18:03:31.706831+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('72ac402f-67be-4a4c-9bea-b82412884a82', 'payment_confirmed', 'whatsapp', '022-5551234', 'WA confirm BK-261014-0FFD', 'https://wa.me/62225551234?text=Halo%2C%20saya%20Test%20DP%20E2E.%20Booking%20saya%20sudah%20dikonfirmasi.%0AKode%20Booking%3A%20BK-261014-0FFD%0ATanggal%3A%202026-10-26%0AJam%3A%2010%3A00%20-%2011%3A00%0ATotal%3A%20Rp%20130.578%0ATerima%20kasih.', 'sent', NULL, 'BK-261014-0FFD', NULL, '2026-10-14 18:05:05.061919+00', NULL, '2026-10-14 18:05:05.061919+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('3c465583-5b42-4733-9583-32e39fd2a3bf', 'payment_confirmed', 'whatsapp', '022-5551234', 'WA confirm BK-261014-0FFD', 'https://wa.me/62225551234?text=Halo%2C%20saya%20Test%20DP%20E2E.%20Booking%20saya%20sudah%20dikonfirmasi.%0AKode%20Booking%3A%20BK-261014-0FFD%0ATanggal%3A%202026-10-26%0AJam%3A%2010%3A00%20-%2011%3A00%0ATotal%3A%20Rp%20130.578%0ATerima%20kasih.', 'sent', NULL, 'BK-261014-0FFD', NULL, '2026-10-14 18:05:11.860699+00', NULL, '2026-10-14 18:05:11.860699+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('4d6dab6a-17e7-4bd8-bbf9-ca263691e179', 'booking_created', 'email', 'aditia.news98@gmail.com', 'Booking BK-261015-A754 — Menunggu Pembayaran', 'Halo Aditia Energi Juang,

Booking Anda telah dibuat.

Kode Booking: BK-261015-A754
Tanggal: Kamis, 15 Oktober 2026
Jam: 18:00 — 20:00
Total: Rp 238.133

Silakan lakukan pembayaran untuk mengkonfirmasi booking Anda.

Terima kasih,
Lapabook', 'sent', 'bk-cab37ff4', 'BK-261015-A754', NULL, '2026-10-15 07:08:28.958308+00', NULL, '2026-10-15 07:08:28.958308+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('4aff1cb2-ce60-4def-aff0-b725b6b99418', 'admin_new_booking', 'in_app', 'admin', '[Admin] Booking Baru: BK-261015-A754', 'Booking baru masuk.

Kode: BK-261015-A754
Pelanggan: Aditia Energi Juang
Tanggal: Kamis, 15 Oktober 2026
Jam: 18:00 — 20:00
Total: Rp 238.133

Silakan review di dashboard admin.', 'sent', 'bk-cab37ff4', 'BK-261015-A754', NULL, '2026-10-15 07:08:28.961789+00', NULL, '2026-10-15 07:08:28.961789+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('a1c48a6d-af30-4eda-877b-435feecaf008', 'booking_created', 'whatsapp', '08199990002', 'Booking BK-261015-5055 — Menunggu Pembayaran', 'Halo Test DP50 Guest,

Booking Anda telah dibuat.

Kode Booking: BK-261015-5055
Tanggal: Rabu, 28 Oktober 2026
Jam: 18:00 — 20:00
Total: Rp 238.263

Silakan lakukan pembayaran untuk mengkonfirmasi booking Anda.

Terima kasih,
Lapabook', 'sent', NULL, 'BK-261015-5055', NULL, '2026-10-15 07:13:39.070094+00', NULL, '2026-10-15 07:13:39.070094+00');
INSERT INTO public.notification_logs (id, type, channel, recipient, subject, message, status, booking_id, booking_code, error_message, sent_at, read_at, created_at) VALUES ('ba2ab1ef-1c43-4b5c-9c5e-f601650a62a2', 'admin_new_booking', 'in_app', 'admin', '[Admin] Booking Baru: BK-261015-5055', 'Booking baru masuk.

Kode: BK-261015-5055
Pelanggan: Test DP50 Guest
Tanggal: Rabu, 28 Oktober 2026
Jam: 18:00 — 20:00
Total: Rp 238.263

Silakan review di dashboard admin.', 'sent', NULL, 'BK-261015-5055', NULL, '2026-10-15 07:13:39.072309+00', NULL, '2026-10-15 07:13:39.072309+00');


--
-- Data for Name: notification_preferences; Type: TABLE DATA; Schema: public; Owner: brodit
--



--
-- Data for Name: operating_hours; Type: TABLE DATA; Schema: public; Owner: brodit
--

INSERT INTO public.operating_hours (id, court_id, day_of_week, open_time, close_time, is_active, created_at, updated_at) VALUES ('oh-f1-0', 'court-f1', 0, '06:00:00', '23:00:00', true, '2026-07-13 05:56:46.981342+00', '2026-07-13 05:56:46.981342+00');
INSERT INTO public.operating_hours (id, court_id, day_of_week, open_time, close_time, is_active, created_at, updated_at) VALUES ('oh-f1-1', 'court-f1', 1, '06:00:00', '23:00:00', true, '2026-07-13 05:56:46.981342+00', '2026-07-13 05:56:46.981342+00');
INSERT INTO public.operating_hours (id, court_id, day_of_week, open_time, close_time, is_active, created_at, updated_at) VALUES ('oh-f1-2', 'court-f1', 2, '06:00:00', '23:00:00', true, '2026-07-13 05:56:46.981342+00', '2026-07-13 05:56:46.981342+00');
INSERT INTO public.operating_hours (id, court_id, day_of_week, open_time, close_time, is_active, created_at, updated_at) VALUES ('oh-f1-3', 'court-f1', 3, '06:00:00', '23:00:00', true, '2026-07-13 05:56:46.981342+00', '2026-07-13 05:56:46.981342+00');
INSERT INTO public.operating_hours (id, court_id, day_of_week, open_time, close_time, is_active, created_at, updated_at) VALUES ('oh-f1-4', 'court-f1', 4, '06:00:00', '23:00:00', true, '2026-07-13 05:56:46.981342+00', '2026-07-13 05:56:46.981342+00');
INSERT INTO public.operating_hours (id, court_id, day_of_week, open_time, close_time, is_active, created_at, updated_at) VALUES ('oh-f1-5', 'court-f1', 5, '06:00:00', '23:00:00', true, '2026-07-13 05:56:46.981342+00', '2026-07-13 05:56:46.981342+00');
INSERT INTO public.operating_hours (id, court_id, day_of_week, open_time, close_time, is_active, created_at, updated_at) VALUES ('oh-f1-6', 'court-f1', 6, '06:00:00', '23:00:00', true, '2026-07-13 05:56:46.981342+00', '2026-07-13 05:56:46.981342+00');
INSERT INTO public.operating_hours (id, court_id, day_of_week, open_time, close_time, is_active, created_at, updated_at) VALUES ('oh-f2-0', 'court-f2', 0, '06:00:00', '23:00:00', true, '2026-07-13 05:56:46.981342+00', '2026-07-13 05:56:46.981342+00');
INSERT INTO public.operating_hours (id, court_id, day_of_week, open_time, close_time, is_active, created_at, updated_at) VALUES ('oh-f2-1', 'court-f2', 1, '06:00:00', '23:00:00', true, '2026-07-13 05:56:46.981342+00', '2026-07-13 05:56:46.981342+00');
INSERT INTO public.operating_hours (id, court_id, day_of_week, open_time, close_time, is_active, created_at, updated_at) VALUES ('oh-f2-2', 'court-f2', 2, '06:00:00', '23:00:00', true, '2026-07-13 05:56:46.981342+00', '2026-07-13 05:56:46.981342+00');
INSERT INTO public.operating_hours (id, court_id, day_of_week, open_time, close_time, is_active, created_at, updated_at) VALUES ('oh-f2-3', 'court-f2', 3, '06:00:00', '23:00:00', true, '2026-07-13 05:56:46.981342+00', '2026-07-13 05:56:46.981342+00');
INSERT INTO public.operating_hours (id, court_id, day_of_week, open_time, close_time, is_active, created_at, updated_at) VALUES ('oh-f2-4', 'court-f2', 4, '06:00:00', '23:00:00', true, '2026-07-13 05:56:46.981342+00', '2026-07-13 05:56:46.981342+00');
INSERT INTO public.operating_hours (id, court_id, day_of_week, open_time, close_time, is_active, created_at, updated_at) VALUES ('oh-f2-5', 'court-f2', 5, '06:00:00', '23:00:00', true, '2026-07-13 05:56:46.981342+00', '2026-07-13 05:56:46.981342+00');
INSERT INTO public.operating_hours (id, court_id, day_of_week, open_time, close_time, is_active, created_at, updated_at) VALUES ('oh-f2-6', 'court-f2', 6, '06:00:00', '23:00:00', true, '2026-07-13 05:56:46.981342+00', '2026-07-13 05:56:46.981342+00');
INSERT INTO public.operating_hours (id, court_id, day_of_week, open_time, close_time, is_active, created_at, updated_at) VALUES ('oh-b1-0', 'court-b1', 0, '06:00:00', '23:00:00', true, '2026-07-13 05:56:46.981342+00', '2026-07-13 05:56:46.981342+00');
INSERT INTO public.operating_hours (id, court_id, day_of_week, open_time, close_time, is_active, created_at, updated_at) VALUES ('oh-b1-1', 'court-b1', 1, '06:00:00', '23:00:00', true, '2026-07-13 05:56:46.981342+00', '2026-07-13 05:56:46.981342+00');
INSERT INTO public.operating_hours (id, court_id, day_of_week, open_time, close_time, is_active, created_at, updated_at) VALUES ('oh-b1-2', 'court-b1', 2, '06:00:00', '23:00:00', true, '2026-07-13 05:56:46.981342+00', '2026-07-13 05:56:46.981342+00');
INSERT INTO public.operating_hours (id, court_id, day_of_week, open_time, close_time, is_active, created_at, updated_at) VALUES ('oh-b1-3', 'court-b1', 3, '06:00:00', '23:00:00', true, '2026-07-13 05:56:46.981342+00', '2026-07-13 05:56:46.981342+00');
INSERT INTO public.operating_hours (id, court_id, day_of_week, open_time, close_time, is_active, created_at, updated_at) VALUES ('oh-b1-4', 'court-b1', 4, '06:00:00', '23:00:00', true, '2026-07-13 05:56:46.981342+00', '2026-07-13 05:56:46.981342+00');
INSERT INTO public.operating_hours (id, court_id, day_of_week, open_time, close_time, is_active, created_at, updated_at) VALUES ('oh-b1-5', 'court-b1', 5, '06:00:00', '23:00:00', true, '2026-07-13 05:56:46.981342+00', '2026-07-13 05:56:46.981342+00');
INSERT INTO public.operating_hours (id, court_id, day_of_week, open_time, close_time, is_active, created_at, updated_at) VALUES ('oh-b1-6', 'court-b1', 6, '06:00:00', '23:00:00', true, '2026-07-13 05:56:46.981342+00', '2026-07-13 05:56:46.981342+00');
INSERT INTO public.operating_hours (id, court_id, day_of_week, open_time, close_time, is_active, created_at, updated_at) VALUES ('oh-b4-0', 'court-b4', 0, '07:00:00', '22:00:00', true, '2026-07-13 05:56:46.981342+00', '2026-07-13 05:56:46.981342+00');
INSERT INTO public.operating_hours (id, court_id, day_of_week, open_time, close_time, is_active, created_at, updated_at) VALUES ('oh-b4-1', 'court-b4', 1, '07:00:00', '22:00:00', true, '2026-07-13 05:56:46.981342+00', '2026-07-13 05:56:46.981342+00');
INSERT INTO public.operating_hours (id, court_id, day_of_week, open_time, close_time, is_active, created_at, updated_at) VALUES ('oh-b4-2', 'court-b4', 2, '07:00:00', '22:00:00', true, '2026-07-13 05:56:46.981342+00', '2026-07-13 05:56:46.981342+00');
INSERT INTO public.operating_hours (id, court_id, day_of_week, open_time, close_time, is_active, created_at, updated_at) VALUES ('oh-b4-3', 'court-b4', 3, '07:00:00', '22:00:00', true, '2026-07-13 05:56:46.981342+00', '2026-07-13 05:56:46.981342+00');
INSERT INTO public.operating_hours (id, court_id, day_of_week, open_time, close_time, is_active, created_at, updated_at) VALUES ('oh-b4-4', 'court-b4', 4, '07:00:00', '22:00:00', true, '2026-07-13 05:56:46.981342+00', '2026-07-13 05:56:46.981342+00');
INSERT INTO public.operating_hours (id, court_id, day_of_week, open_time, close_time, is_active, created_at, updated_at) VALUES ('oh-b4-5', 'court-b4', 5, '07:00:00', '22:00:00', true, '2026-07-13 05:56:46.981342+00', '2026-07-13 05:56:46.981342+00');
INSERT INTO public.operating_hours (id, court_id, day_of_week, open_time, close_time, is_active, created_at, updated_at) VALUES ('oh-b4-6', 'court-b4', 6, '07:00:00', '22:00:00', true, '2026-07-13 05:56:46.981342+00', '2026-07-13 05:56:46.981342+00');


--
-- Data for Name: payment_methods; Type: TABLE DATA; Schema: public; Owner: brodit
--

INSERT INTO public.payment_methods (id, name, label, type, account_name, account_number, bank_name, provider, details, instructions, is_active, created_at, updated_at) VALUES ('pm-1', 'BCA Transfer', 'BCA Transfer', 'bank_transfer', 'PT Lapangin Indonesia', '1234567890', 'BCA', '', '', 'Transfer ke rekening BCA atas nama PT Lapangin Indonesia. Setelah transfer, kirim bukti pembayaran.', true, '2026-07-13 05:56:46.993996+00', '2026-07-13 05:56:46.993996+00');
INSERT INTO public.payment_methods (id, name, label, type, account_name, account_number, bank_name, provider, details, instructions, is_active, created_at, updated_at) VALUES ('pm-2', 'Mandiri Transfer', 'Mandiri Transfer', 'bank_transfer', 'PT Lapangin Indonesia', '0987654321', 'Mandiri', '', '', 'Transfer ke rekening Mandiri atas nama PT Lapangin Indonesia. Setelah transfer, kirim bukti pembayaran.', true, '2026-07-13 05:56:46.993996+00', '2026-07-13 05:56:46.993996+00');
INSERT INTO public.payment_methods (id, name, label, type, account_name, account_number, bank_name, provider, details, instructions, is_active, created_at, updated_at) VALUES ('pm-3', 'QRIS', 'QRIS', 'qris', 'PT Lapangin Indonesia', 'QRIS-LAPANGIN', NULL, '', '', 'Scan QR code yang diberikan. Setelah transfer, kirim bukti pembayaran.', true, '2026-07-13 05:56:46.993996+00', '2026-07-13 05:56:46.993996+00');


--
-- Data for Name: payouts; Type: TABLE DATA; Schema: public; Owner: brodit
--



--
-- Data for Name: pickup_games; Type: TABLE DATA; Schema: public; Owner: brodit
--



--
-- Data for Name: pickup_game_messages; Type: TABLE DATA; Schema: public; Owner: brodit
--



--
-- Data for Name: pickup_game_participants; Type: TABLE DATA; Schema: public; Owner: brodit
--



--
-- Data for Name: platform_settings; Type: TABLE DATA; Schema: public; Owner: brodit
--

INSERT INTO public.platform_settings (id, key, value, updated_by, updated_at) VALUES (1, 'platform_fee_default', '10', 'super_admin', '2026-10-13 22:24:02.029192+00');
INSERT INTO public.platform_settings (id, key, value, updated_by, updated_at) VALUES (2, 'settlement_cutoff_hour', '23', 'super_admin', '2026-10-13 22:24:02.035729+00');
INSERT INTO public.platform_settings (id, key, value, updated_by, updated_at) VALUES (3, 'app_name', '"Lapabook"', 'super_admin', '2026-10-13 22:24:02.037098+00');


--
-- Data for Name: player_achievements; Type: TABLE DATA; Schema: public; Owner: brodit
--



--
-- Data for Name: player_streaks; Type: TABLE DATA; Schema: public; Owner: brodit
--



--
-- Data for Name: pricing_rules; Type: TABLE DATA; Schema: public; Owner: brodit
--

INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('pr-f1-weekday', 'court-f1', 'weekday', '06:00:00', '17:00:00', 120000, 1, true, '2026-07-13 05:56:46.97768+00', '2026-07-13 05:56:46.97768+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('pr-f1-peak', 'court-f1', 'weekday', '17:00:00', '23:00:00', 150000, 2, true, '2026-07-13 05:56:46.97768+00', '2026-07-13 05:56:46.97768+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('pr-f1-weekend', 'court-f1', 'weekend', '06:00:00', '23:00:00', 180000, 3, true, '2026-07-13 05:56:46.97768+00', '2026-07-13 05:56:46.97768+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('pr-f2-weekday', 'court-f2', 'weekday', '06:00:00', '17:00:00', 100000, 1, true, '2026-07-13 05:56:46.97768+00', '2026-07-13 05:56:46.97768+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('pr-f2-peak', 'court-f2', 'weekday', '17:00:00', '23:00:00', 120000, 2, true, '2026-07-13 05:56:46.97768+00', '2026-07-13 05:56:46.97768+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('pr-f2-weekend', 'court-f2', 'weekend', '06:00:00', '23:00:00', 150000, 3, true, '2026-07-13 05:56:46.97768+00', '2026-07-13 05:56:46.97768+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('pr-b1-weekday', 'court-b1', 'weekday', '06:00:00', '17:00:00', 65000, 1, true, '2026-07-13 05:56:46.97768+00', '2026-07-13 05:56:46.97768+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('pr-b1-peak', 'court-b1', 'weekday', '17:00:00', '23:00:00', 80000, 2, true, '2026-07-13 05:56:46.97768+00', '2026-07-13 05:56:46.97768+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('pr-b1-weekend', 'court-b1', 'weekend', '06:00:00', '23:00:00', 90000, 3, true, '2026-07-13 05:56:46.97768+00', '2026-07-13 05:56:46.97768+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('pr-b4-weekday', 'court-b4', 'weekday', '06:00:00', '17:00:00', 75000, 1, true, '2026-07-13 05:56:46.97768+00', '2026-07-13 05:56:46.97768+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('pr-b4-peak', 'court-b4', 'weekday', '17:00:00', '22:00:00', 90000, 2, true, '2026-07-13 05:56:46.97768+00', '2026-07-13 05:56:46.97768+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('pr-b4-weekend', 'court-b4', 'weekend', '06:00:00', '22:00:00', 100000, 3, true, '2026-07-13 05:56:46.97768+00', '2026-07-13 05:56:46.97768+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('price-dps-f1-wd', 'court-dps-f1', 'weekday', '07:00:00', '23:00:00', 120000, 0, true, '2026-10-13 17:12:38.767801+00', '2026-10-13 17:12:38.767801+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('price-dps-f1-we', 'court-dps-f1', 'weekend', '07:00:00', '23:00:00', 150000, 1, true, '2026-10-13 17:12:38.767801+00', '2026-10-13 17:12:38.767801+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('price-dps-f2-wd', 'court-dps-f2', 'weekday', '07:00:00', '23:00:00', 110000, 0, true, '2026-10-13 17:12:38.767801+00', '2026-10-13 17:12:38.767801+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('price-dps-f2-we', 'court-dps-f2', 'weekend', '07:00:00', '23:00:00', 140000, 1, true, '2026-10-13 17:12:38.767801+00', '2026-10-13 17:12:38.767801+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('price-dps-b1-wd', 'court-dps-b1', 'weekday', '07:00:00', '23:00:00', 65000, 0, true, '2026-10-13 17:12:38.767801+00', '2026-10-13 17:12:38.767801+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('price-dps-b1-we', 'court-dps-b1', 'weekend', '07:00:00', '23:00:00', 80000, 1, true, '2026-10-13 17:12:38.767801+00', '2026-10-13 17:12:38.767801+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('price-dps-b2-wd', 'court-dps-b2', 'weekday', '07:00:00', '23:00:00', 65000, 0, true, '2026-10-13 17:12:38.767801+00', '2026-10-13 17:12:38.767801+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('price-dps-b2-we', 'court-dps-b2', 'weekend', '07:00:00', '23:00:00', 80000, 1, true, '2026-10-13 17:12:38.767801+00', '2026-10-13 17:12:38.767801+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('price-mdn-f1-wd', 'court-mdn-f1', 'weekday', '07:00:00', '23:00:00', 100000, 0, true, '2026-10-13 17:12:38.767801+00', '2026-10-13 17:12:38.767801+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('price-mdn-f1-we', 'court-mdn-f1', 'weekend', '07:00:00', '23:00:00', 125000, 1, true, '2026-10-13 17:12:38.767801+00', '2026-10-13 17:12:38.767801+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('price-mdn-f2-wd', 'court-mdn-f2', 'weekday', '07:00:00', '23:00:00', 90000, 0, true, '2026-10-13 17:12:38.767801+00', '2026-10-13 17:12:38.767801+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('price-mdn-f2-we', 'court-mdn-f2', 'weekend', '07:00:00', '23:00:00', 115000, 1, true, '2026-10-13 17:12:38.767801+00', '2026-10-13 17:12:38.767801+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('price-mdn-bsk1-wd', 'court-mdn-bsk1', 'weekday', '07:00:00', '23:00:00', 140000, 0, true, '2026-10-13 17:12:38.767801+00', '2026-10-13 17:12:38.767801+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('price-mdn-bsk1-we', 'court-mdn-bsk1', 'weekend', '07:00:00', '23:00:00', 175000, 1, true, '2026-10-13 17:12:38.767801+00', '2026-10-13 17:12:38.767801+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('price-smg-f1-wd', 'court-smg-f1', 'weekday', '06:00:00', '23:00:00', 95000, 0, true, '2026-10-13 17:12:38.767801+00', '2026-10-13 17:12:38.767801+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('price-smg-f1-we', 'court-smg-f1', 'weekend', '06:00:00', '23:00:00', 120000, 1, true, '2026-10-13 17:12:38.767801+00', '2026-10-13 17:12:38.767801+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('price-smg-f2-wd', 'court-smg-f2', 'weekday', '06:00:00', '23:00:00', 85000, 0, true, '2026-10-13 17:12:38.767801+00', '2026-10-13 17:12:38.767801+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('price-smg-f2-we', 'court-smg-f2', 'weekend', '06:00:00', '23:00:00', 110000, 1, true, '2026-10-13 17:12:38.767801+00', '2026-10-13 17:12:38.767801+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('price-smg-p1-wd', 'court-smg-p1', 'weekday', '06:00:00', '23:00:00', 200000, 0, true, '2026-10-13 17:12:38.767801+00', '2026-10-13 17:12:38.767801+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('price-smg-p1-we', 'court-smg-p1', 'weekend', '06:00:00', '23:00:00', 250000, 1, true, '2026-10-13 17:12:38.767801+00', '2026-10-13 17:12:38.767801+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('price-sby-f1-wd', 'court-sby-f1', 'weekday', '07:00:00', '23:00:00', 110000, 0, true, '2026-10-13 17:12:38.767801+00', '2026-10-13 17:12:38.767801+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('price-sby-f1-we', 'court-sby-f1', 'weekend', '07:00:00', '23:00:00', 140000, 1, true, '2026-10-13 17:12:38.767801+00', '2026-10-13 17:12:38.767801+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('price-sby-f2-wd', 'court-sby-f2', 'weekday', '07:00:00', '23:00:00', 100000, 0, true, '2026-10-13 17:12:38.767801+00', '2026-10-13 17:12:38.767801+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('price-sby-f2-we', 'court-sby-f2', 'weekend', '07:00:00', '23:00:00', 130000, 1, true, '2026-10-13 17:12:38.767801+00', '2026-10-13 17:12:38.767801+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('price-sby-b1-wd', 'court-sby-b1', 'weekday', '07:00:00', '23:00:00', 55000, 0, true, '2026-10-13 17:12:38.767801+00', '2026-10-13 17:12:38.767801+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('price-sby-b1-we', 'court-sby-b1', 'weekend', '07:00:00', '23:00:00', 70000, 1, true, '2026-10-13 17:12:38.767801+00', '2026-10-13 17:12:38.767801+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('price-sby-b2-wd', 'court-sby-b2', 'weekday', '07:00:00', '23:00:00', 55000, 0, true, '2026-10-13 17:12:38.767801+00', '2026-10-13 17:12:38.767801+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('price-sby-b2-we', 'court-sby-b2', 'weekend', '07:00:00', '23:00:00', 70000, 1, true, '2026-10-13 17:12:38.767801+00', '2026-10-13 17:12:38.767801+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('price-yog-f1-wd', 'court-yog-f1', 'weekday', '06:00:00', '23:00:00', 80000, 0, true, '2026-10-13 17:12:38.767801+00', '2026-10-13 17:12:38.767801+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('price-yog-f1-we', 'court-yog-f1', 'weekend', '06:00:00', '23:00:00', 100000, 1, true, '2026-10-13 17:12:38.767801+00', '2026-10-13 17:12:38.767801+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('price-yog-f2-wd', 'court-yog-f2', 'weekday', '06:00:00', '23:00:00', 75000, 0, true, '2026-10-13 17:12:38.767801+00', '2026-10-13 17:12:38.767801+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('price-yog-f2-we', 'court-yog-f2', 'weekend', '06:00:00', '23:00:00', 95000, 1, true, '2026-10-13 17:12:38.767801+00', '2026-10-13 17:12:38.767801+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('price-yog-t1-wd', 'court-yog-t1', 'weekday', '06:00:00', '23:00:00', 90000, 0, true, '2026-10-13 17:12:38.767801+00', '2026-10-13 17:12:38.767801+00');
INSERT INTO public.pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES ('price-yog-t1-we', 'court-yog-t1', 'weekend', '06:00:00', '23:00:00', 115000, 1, true, '2026-10-13 17:12:38.767801+00', '2026-10-13 17:12:38.767801+00');


--
-- Data for Name: referrals; Type: TABLE DATA; Schema: public; Owner: brodit
--

INSERT INTO public.referrals (id, referrer_id, referee_id, referral_code, status, points_awarded, created_at, completed_at) VALUES ('ref-jane-001', '4a3c8931-2740-4989-81b0-2719474ef180', NULL, 'JANE-XYZ789', 'pending', 0, '2026-07-01 14:00:00+00', NULL);
INSERT INTO public.referrals (id, referrer_id, referee_id, referral_code, status, points_awarded, created_at, completed_at) VALUES ('ref-john-001', 'f3f38ac3-1cc2-42e2-bafd-a8ab91753923', '4a3c8931-2740-4989-81b0-2719474ef180', 'JOHN-ABC123', 'completed', 100, '2026-06-15 10:00:00+00', '2026-07-02 10:00:00+00');
INSERT INTO public.referrals (id, referrer_id, referee_id, referral_code, status, points_awarded, created_at, completed_at) VALUES ('ref-1787823917325', '85017077-dbeb-4b09-a686-2070f4dd65aa', '5e3ad1e5-5b58-46c2-8a9c-3c4c4250bb02', 'REF-BGWRHW', 'completed', 50000, '2026-08-27 09:45:17.325175+00', '2026-08-27 09:45:25.032418+00');
INSERT INTO public.referrals (id, referrer_id, referee_id, referral_code, status, points_awarded, created_at, completed_at) VALUES ('ref-1787824329826', 'fb913253-5cc7-4f5c-8504-43a7bf2d1d66', NULL, 'REF-4JSV08', 'pending', 0, '2026-08-27 09:52:09.826272+00', NULL);
INSERT INTO public.referrals (id, referrer_id, referee_id, referral_code, status, points_awarded, created_at, completed_at) VALUES ('ref-1787837440667', '8f8874af-4b82-4542-aece-0823e67f304d', '5338b1e8-aa19-441f-8fa4-f167a6d7482f', 'REF-7UP8JF', 'completed', 50000, '2026-08-27 13:30:40.667216+00', '2026-08-27 13:30:41.598199+00');
INSERT INTO public.referrals (id, referrer_id, referee_id, referral_code, status, points_awarded, created_at, completed_at) VALUES ('ref-1787839221609', '3f911abb-d744-460b-a1e4-15d7c400e689', 'caee7a15-bda7-48e8-8c2c-147d026adf9e', 'REF-GZWWUW', 'completed', 50000, '2026-08-27 14:00:21.609646+00', '2026-08-27 14:00:22.487899+00');


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: brodit
--

INSERT INTO public.reviews (id, booking_id, customer_id, venue_id, court_id, rating, comment, is_visible, created_at, updated_at) VALUES ('review-001', 'booking-001', 'f3f38ac3-1cc2-42e2-bafd-a8ab91753923', 'venue-greenfield', 'court-f1', 5, 'Lapangan bersih, fasilitas lengkap! Staff ramah banget. Pasti balik lagi.', true, '2026-07-01 10:00:00+00', '2026-07-01 10:00:00+00');
INSERT INTO public.reviews (id, booking_id, customer_id, venue_id, court_id, rating, comment, is_visible, created_at, updated_at) VALUES ('review-002', 'booking-002', '4a3c8931-2740-4989-81b0-2719474ef180', 'venue-greenfield', 'court-f1', 4, 'Lapangan bagus, cuma parkir agak sempit. Overall recommended!', true, '2026-07-02 14:00:00+00', '2026-07-02 14:00:00+00');
INSERT INTO public.reviews (id, booking_id, customer_id, venue_id, court_id, rating, comment, is_visible, created_at, updated_at) VALUES ('review-003', 'booking-003', '837637b4-2ffb-4254-94c0-abc753963219', 'venue-greenfield', 'court-b1', 5, 'Court bulu tangkis terbaik di Jakarta Selatan! Lantai tidak licin, pencahayaan bagus.', true, '2026-07-03 18:00:00+00', '2026-07-03 18:00:00+00');
INSERT INTO public.reviews (id, booking_id, customer_id, venue_id, court_id, rating, comment, is_visible, created_at, updated_at) VALUES ('review-004', 'booking-004', '4a3c8931-2740-4989-81b0-2719474ef180', 'venue-greenfield', 'court-f2', 4, 'Standar FIFA beneran! Net dan tiang bagus. Recommended buat latihan serius.', true, '2026-07-05 09:00:00+00', '2026-07-05 09:00:00+00');
INSERT INTO public.reviews (id, booking_id, customer_id, venue_id, court_id, rating, comment, is_visible, created_at, updated_at) VALUES ('review-005', 'booking-005', '837637b4-2ffb-4254-94c0-abc753963219', 'venue-rahasian', 'court-b4', 3, 'Lapangan cukup bagus tapi harga agak mahal untuk area sini. AC kurang dingin.', true, '2026-07-06 20:00:00+00', '2026-07-06 20:00:00+00');


--
-- Data for Name: review_photos; Type: TABLE DATA; Schema: public; Owner: brodit
--



--
-- Data for Name: rewards; Type: TABLE DATA; Schema: public; Owner: brodit
--

INSERT INTO public.rewards (id, name, description, type, points_cost, value, is_active, created_at) VALUES ('reward-disc-10', 'Diskon 10%', 'Diskon 10% untuk booking berikutnya (maks Rp 50.000)', 'discount_percentage', 100, 10, true, '2026-07-13 05:56:47.012459+00');
INSERT INTO public.rewards (id, name, description, type, points_cost, value, is_active, created_at) VALUES ('reward-disc-25k', 'Diskon Rp 25.000', 'Potongan langsung Rp 25.000 untuk booking berikutnya', 'discount_amount', 200, 25000, true, '2026-07-13 05:56:47.012459+00');
INSERT INTO public.rewards (id, name, description, type, points_cost, value, is_active, created_at) VALUES ('reward-free-1h', 'Gratis 1 Jam', 'Booking 1 jam gratis untuk lapangan mana saja', 'free_hour', 500, 1, true, '2026-07-13 05:56:47.012459+00');
INSERT INTO public.rewards (id, name, description, type, points_cost, value, is_active, created_at) VALUES ('reward-free-session', 'Gratis Sesi', 'Booking 1 sesi penuh gratis (2 jam)', 'free_session', 800, 2, true, '2026-07-13 05:56:47.012459+00');


--
-- Data for Name: reward_redemptions; Type: TABLE DATA; Schema: public; Owner: brodit
--



--
-- Data for Name: team_wallets; Type: TABLE DATA; Schema: public; Owner: brodit
--



--
-- Data for Name: team_wallet_deposits; Type: TABLE DATA; Schema: public; Owner: brodit
--



--
-- Data for Name: team_wallet_members; Type: TABLE DATA; Schema: public; Owner: brodit
--



--
-- Data for Name: team_wallet_splits; Type: TABLE DATA; Schema: public; Owner: brodit
--



--
-- Data for Name: team_wallet_split_members; Type: TABLE DATA; Schema: public; Owner: brodit
--



--
-- Data for Name: team_wallet_transactions; Type: TABLE DATA; Schema: public; Owner: brodit
--



--
-- Data for Name: vouchers; Type: TABLE DATA; Schema: public; Owner: brodit
--

INSERT INTO public.vouchers (id, code, label, discount_type, discount_value, min_booking_amount, max_uses, used_count, valid_until, is_active, created_at) VALUES ('vc-demo-25', 'GRATISMAIN', 'Potongan Rp 25.000', 'fixed', 25000, 100000, 50, 0, '2027-01-11 22:28:58.196514+00', true, '2026-10-13 22:28:58.196514+00');
INSERT INTO public.vouchers (id, code, label, discount_type, discount_value, min_booking_amount, max_uses, used_count, valid_until, is_active, created_at) VALUES ('vc-demo-10', 'LAPABOOK10', 'Diskon 10% untuk semua lapangan', 'percentage', 10, 50000, 100, 0, '2027-01-11 22:28:58.196514+00', true, '2026-10-13 22:28:58.196514+00');


--
-- Name: platform_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brodit
--

SELECT pg_catalog.setval('public.platform_settings_id_seq', 9, true);


--
-- PostgreSQL database dump complete
--

\unrestrict AZtFIh23VrQSY1NN5cWO85mVR4gEdiO3QWbAjJNOBUb4Srvsbb9cdD7RKz1WxOe

