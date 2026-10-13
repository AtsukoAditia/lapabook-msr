-- Seed venues di 5 kota non-Bandung (Denpasar, Medan, Semarang, Surabaya, Yogyakarta)
-- Tanggal: 2026-10-14
-- Owner: reuse owner-demo-1 (Lapangin Demo Owner) — venue demo multi-kota
-- Areas memakai area_id (kolom live DB); idempotent via ON CONFLICT DO NOTHING

INSERT INTO venues (id, owner_id, area_id, name, slug, address, phone, email, description, open_time, close_time, facilities, is_active, approval_status, rain_discount_config, created_at, updated_at) VALUES
  ('venue-dps-sunset', 'owner-demo-1', 'area-blp-kota',
   'Sunset Sports Bali', 'sunset-sports-bali',
   'Jl. Pantai Berawa No. 88, Denpasar', '0361-555001', 'info@sunsetsportsbali.id',
   'Venue futsal outdoor dan badminton indoor dekat pantai. Sunset view dari sideline.',
   '07:00', '23:00',
   '["Parkir","Toilet","Kantin","Shower"]'::jsonb,
   true, 'active', '{"enabled":false}'::jsonb, NOW(), NOW()),

  ('venue-mdn-merdeka', 'owner-demo-1', 'area-mdn-kota',
   'Merdeka Futsal Medan', 'merdeka-futsal-medan',
   'Jl. Merdeka No. 12, Medan', '061-555002', 'booking@merdekafutsal.id',
   'Futsal indoor premium dan lapangan basket standar di pusat kota Medan.',
   '07:00', '23:00',
   '["Parkir","Toilet","Kantin","Ruang Ganti","AC"]'::jsonb,
   true, 'active', '{"enabled":false}'::jsonb, NOW(), NOW()),

  ('venue-smg-tinjomoyo', 'owner-demo-1', 'area-smg-kota',
   'Tinjomoyo Sport Center', 'tinjomoyo-sport-center',
   'Jl. Tinjomoyo Raya No. 45, Semarang', '024-555003', 'halo@tinjomoyosport.id',
   'Sport center lengkap Semarang: futsal dan padel court pertama di kota.',
   '06:00', '23:00',
   '["Parkir","Toilet","Kantin","WiFi"]'::jsonb,
   true, 'active', '{"enabled":false}'::jsonb, NOW(), NOW()),

  ('venue-sby-mulyorejo', 'owner-demo-1', 'area-sby-kota',
   'Mulyorejo Sports Surabaya', 'mulyorejo-sports-surabaya',
   'Jl. Mulyorejo Utara No. 100, Surabaya', '031-555004', 'info@mulyorejosports.id',
   'Venue futsal dan bulu tangkis favorit warga Surabaya Timur.',
   '07:00', '23:00',
   '["Parkir","Toilet","Kantin","Ruang Ganti"]'::jsonb,
   true, 'active', '{"enabled":true,"levels":{"light":{"discountPercent":10},"moderate":{"discountPercent":20},"heavy":{"discountPercent":30}}}'::jsonb, NOW(), NOW()),

  ('venue-yog-maguwo', 'owner-demo-1', 'area-yog-kota',
   'Maguwo Sports Jogja', 'maguwo-sports-jogja',
   'Jl. Laksda Adisutjipto KM 8, Yogyakarta', '0274-555005', 'booking@maguwosports.id',
   'Arena futsal dan tenis dekat stadion Maguwoharjo. Parkir luas.',
   '06:00', '23:00',
   '["Parkir","Toilet","Kantin","WiFi"]'::jsonb,
   true, 'active', '{"enabled":false}'::jsonb, NOW(), NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO courts (id, venue_id, sport_id, name, slug, surface_type, indoor_type, capacity, base_price, is_active, created_at, updated_at) VALUES
  -- Denpasar: futsal outdoor ×2 + badminton indoor ×2
  ('court-dps-f1', 'venue-dps-sunset', 'sport-futsal', 'Futsal Court A (Sunset Side)', 'futsal-a', 'Rumput Sintetis', 'outdoor', 14, 120000, true, NOW(), NOW()),
  ('court-dps-f2', 'venue-dps-sunset', 'sport-futsal', 'Futsal Court B', 'futsal-b', 'Rumput Sintetis', 'outdoor', 14, 110000, true, NOW(), NOW()),
  ('court-dps-b1', 'venue-dps-sunset', 'sport-bulu-tangkis', 'Badminton Court 1', 'badminton-1', 'Vinyl', 'indoor', 4, 65000, true, NOW(), NOW()),
  ('court-dps-b2', 'venue-dps-sunset', 'sport-bulu-tangkis', 'Badminton Court 2', 'badminton-2', 'Vinyl', 'indoor', 4, 65000, true, NOW(), NOW()),

  -- Medan: futsal indoor ×2 + basket ×1
  ('court-mdn-f1', 'venue-mdn-merdeka', 'sport-futsal', 'Futsal Merdeka 1', 'futsal-1', 'Rumput Sintetis', 'indoor', 14, 100000, true, NOW(), NOW()),
  ('court-mdn-f2', 'venue-mdn-merdeka', 'sport-futsal', 'Futsal Merdeka 2', 'futsal-2', 'Rumput Sintetis', 'indoor', 14, 90000, true, NOW(), NOW()),
  ('court-mdn-bsk1', 'venue-mdn-merdeka', 'sport-basket', 'Basket Court Merdeka', 'basket-1', 'Vinyl', 'indoor', 12, 140000, true, NOW(), NOW()),

  -- Semarang: futsal ×2 + padel ×1
  ('court-smg-f1', 'venue-smg-tinjomoyo', 'sport-futsal', 'Futsal Tinjomoyo 1', 'futsal-1', 'Rumput Sintetis', 'indoor', 14, 95000, true, NOW(), NOW()),
  ('court-smg-f2', 'venue-smg-tinjomoyo', 'sport-futsal', 'Futsal Tinjomoyo 2', 'futsal-2', 'Rumput Sintetis', 'semi_outdoor', 14, 85000, true, NOW(), NOW()),
  ('court-smg-p1', 'venue-smg-tinjomoyo', 'sport-padel', 'Padel Court Semarang', 'padel-1', 'Artificial Turf', 'outdoor', 8, 200000, true, NOW(), NOW()),

  -- Surabaya: futsal ×2 + badminton ×2
  ('court-sby-f1', 'venue-sby-mulyorejo', 'sport-futsal', 'Futsal Mulyorejo 1', 'futsal-1', 'Rumput Sintetis', 'indoor', 14, 110000, true, NOW(), NOW()),
  ('court-sby-f2', 'venue-sby-mulyorejo', 'sport-futsal', 'Futsal Mulyorejo 2', 'futsal-2', 'Rumput Sintetis', 'indoor', 14, 100000, true, NOW(), NOW()),
  ('court-sby-b1', 'venue-sby-mulyorejo', 'sport-bulu-tangkis', 'Badminton SBY 1', 'badminton-1', 'Vinyl', 'indoor', 4, 55000, true, NOW(), NOW()),
  ('court-sby-b2', 'venue-sby-mulyorejo', 'sport-bulu-tangkis', 'Badminton SBY 2', 'badminton-2', 'Vinyl', 'indoor', 4, 55000, true, NOW(), NOW()),

  -- Yogyakarta: futsal ×2 + tenis ×1
  ('court-yog-f1', 'venue-yog-maguwo', 'sport-futsal', 'Futsal Maguwo 1', 'futsal-1', 'Rumput Sintetis', 'semi_outdoor', 14, 80000, true, NOW(), NOW()),
  ('court-yog-f2', 'venue-yog-maguwo', 'sport-futsal', 'Futsal Maguwo 2', 'futsal-2', 'Rumput Sintetis', 'semi_outdoor', 14, 75000, true, NOW(), NOW()),
  ('court-yog-t1', 'venue-yog-maguwo', 'sport-tenis', 'Tenis Maguwo', 'tenis-1', 'Hard Court', 'outdoor', 4, 90000, true, NOW(), NOW())
ON CONFLICT (id) DO NOTHING;

-- Pricing rules: weekday (base) + weekend (+~25%) per court
INSERT INTO pricing_rules (id, court_id, day_type, start_time, end_time, price_per_hour, priority, is_active, created_at, updated_at) VALUES
  ('price-dps-f1-wd', 'court-dps-f1', 'weekday', '07:00', '23:00', 120000, 0, true, NOW(), NOW()),
  ('price-dps-f1-we', 'court-dps-f1', 'weekend', '07:00', '23:00', 150000, 1, true, NOW(), NOW()),
  ('price-dps-f2-wd', 'court-dps-f2', 'weekday', '07:00', '23:00', 110000, 0, true, NOW(), NOW()),
  ('price-dps-f2-we', 'court-dps-f2', 'weekend', '07:00', '23:00', 140000, 1, true, NOW(), NOW()),
  ('price-dps-b1-wd', 'court-dps-b1', 'weekday', '07:00', '23:00', 65000, 0, true, NOW(), NOW()),
  ('price-dps-b1-we', 'court-dps-b1', 'weekend', '07:00', '23:00', 80000, 1, true, NOW(), NOW()),
  ('price-dps-b2-wd', 'court-dps-b2', 'weekday', '07:00', '23:00', 65000, 0, true, NOW(), NOW()),
  ('price-dps-b2-we', 'court-dps-b2', 'weekend', '07:00', '23:00', 80000, 1, true, NOW(), NOW()),

  ('price-mdn-f1-wd', 'court-mdn-f1', 'weekday', '07:00', '23:00', 100000, 0, true, NOW(), NOW()),
  ('price-mdn-f1-we', 'court-mdn-f1', 'weekend', '07:00', '23:00', 125000, 1, true, NOW(), NOW()),
  ('price-mdn-f2-wd', 'court-mdn-f2', 'weekday', '07:00', '23:00', 90000, 0, true, NOW(), NOW()),
  ('price-mdn-f2-we', 'court-mdn-f2', 'weekend', '07:00', '23:00', 115000, 1, true, NOW(), NOW()),
  ('price-mdn-bsk1-wd', 'court-mdn-bsk1', 'weekday', '07:00', '23:00', 140000, 0, true, NOW(), NOW()),
  ('price-mdn-bsk1-we', 'court-mdn-bsk1', 'weekend', '07:00', '23:00', 175000, 1, true, NOW(), NOW()),

  ('price-smg-f1-wd', 'court-smg-f1', 'weekday', '06:00', '23:00', 95000, 0, true, NOW(), NOW()),
  ('price-smg-f1-we', 'court-smg-f1', 'weekend', '06:00', '23:00', 120000, 1, true, NOW(), NOW()),
  ('price-smg-f2-wd', 'court-smg-f2', 'weekday', '06:00', '23:00', 85000, 0, true, NOW(), NOW()),
  ('price-smg-f2-we', 'court-smg-f2', 'weekend', '06:00', '23:00', 110000, 1, true, NOW(), NOW()),
  ('price-smg-p1-wd', 'court-smg-p1', 'weekday', '06:00', '23:00', 200000, 0, true, NOW(), NOW()),
  ('price-smg-p1-we', 'court-smg-p1', 'weekend', '06:00', '23:00', 250000, 1, true, NOW(), NOW()),

  ('price-sby-f1-wd', 'court-sby-f1', 'weekday', '07:00', '23:00', 110000, 0, true, NOW(), NOW()),
  ('price-sby-f1-we', 'court-sby-f1', 'weekend', '07:00', '23:00', 140000, 1, true, NOW(), NOW()),
  ('price-sby-f2-wd', 'court-sby-f2', 'weekday', '07:00', '23:00', 100000, 0, true, NOW(), NOW()),
  ('price-sby-f2-we', 'court-sby-f2', 'weekend', '07:00', '23:00', 130000, 1, true, NOW(), NOW()),
  ('price-sby-b1-wd', 'court-sby-b1', 'weekday', '07:00', '23:00', 55000, 0, true, NOW(), NOW()),
  ('price-sby-b1-we', 'court-sby-b1', 'weekend', '07:00', '23:00', 70000, 1, true, NOW(), NOW()),
  ('price-sby-b2-wd', 'court-sby-b2', 'weekday', '07:00', '23:00', 55000, 0, true, NOW(), NOW()),
  ('price-sby-b2-we', 'court-sby-b2', 'weekend', '07:00', '23:00', 70000, 1, true, NOW(), NOW()),

  ('price-yog-f1-wd', 'court-yog-f1', 'weekday', '06:00', '23:00', 80000, 0, true, NOW(), NOW()),
  ('price-yog-f1-we', 'court-yog-f1', 'weekend', '06:00', '23:00', 100000, 1, true, NOW(), NOW()),
  ('price-yog-f2-wd', 'court-yog-f2', 'weekday', '06:00', '23:00', 75000, 0, true, NOW(), NOW()),
  ('price-yog-f2-we', 'court-yog-f2', 'weekend', '06:00', '23:00', 95000, 1, true, NOW(), NOW()),
  ('price-yog-t1-wd', 'court-yog-t1', 'weekday', '06:00', '23:00', 90000, 0, true, NOW(), NOW()),
  ('price-yog-t1-we', 'court-yog-t1', 'weekend', '06:00', '23:00', 115000, 1, true, NOW(), NOW())
ON CONFLICT (id) DO NOTHING;
