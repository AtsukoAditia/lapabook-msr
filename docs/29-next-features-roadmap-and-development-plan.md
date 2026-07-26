# Lapangin — Next Features Roadmap & Development Plan

**Date:** 2026-07-15
**Status:** 📋 Planned — Development Ready
**Horizon:** 5 Sprint (~10 weeks)

---

## Vision

Transform Lapangin dari **booking tool** menjadi **social sports marketplace** Indonesia. Satu platform di mana player menemukan teman main, owner maximize occupancy, dan komunitas olahraga berkembang.

**Differentiator:** Tidak ada kompetitor Indonesia yang menggabungkan booking + social matching + shared wallet dalam satu platform.

---

## Feature Overview

| # | Feature | Module | Player Impact | Owner Impact | Priority |
|---|---------|--------|--------------|--------------|----------|
| 1 | Pickup Game Finder | `pickup-game` | Cari teman main | Kurangi slot kosong | P0 |
| 2 | Team Wallet & Split Bill | `team-wallet` | Gak drama split bayar | Konfirmasi lebih cepat | P0 |
| 3 | Skill-Based Matchmaking | `matchmaking` | Match fair, progress terasa | Player balik terus | P1 |
| 4 | Streak & Badge System | `leaderboard` | Social currency, flex | Player retention | P1 |
| 5 | Last-Minute Flash Deals | `flash-sale` | Deal bagus terakhir menit | Revenue recovery | P1 |
| 6 | Smart Recommendation | `smart-recommendation` | Venue relevan | Visibility meningkat | P2 |
| 7 | Tournament Builder | `tournament` | Kompetisi terstruktur | Revenue tambahan | P2 |
| 8 | Court Live Cam | `livecam` | Transparansi real-time | Premium listing | P2 |
| 9 | Venue Quality Verification | `venue-verification` | Trust signal kuat | Barter ke standar industri | P3 |

---

## Sprint Breakdown

### Sprint 11 — Social Core ⚡
**Duration:** 2 weeks
**Goal:** Fondasi social + pembayaran kolektif. Dua fitur paling langsung nempak.

#### Modul 1: Pickup Game Finder

**Sub-modul:**
- `pickup-games` — Buat & kelola open play session
- `pickup-join` — Gabung session yang ada
- `pickup-split` — Hitung split cost otomatis
- `pickup-chat` — Chat antar member session (light, polling)

**DB Tables:**
```sql
CREATE TABLE pickup_games (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    court_id UUID REFERENCES courts(id) ON DELETE CASCADE,
    host_customer_id UUID REFERENCES customers(id) ON DELETE SET NULL,
    title VARCHAR(255) NOT NULL,
    sport_type VARCHAR(50) NOT NULL,
    scheduled_at TIMESTAMPTZ NOT NULL,
    duration_minutes INT NOT NULL DEFAULT 60,
    max_players INT NOT NULL,
    current_players INT NOT NULL DEFAULT 1,
    price_per_person DECIMAL(12,2) NOT NULL,
    total_price DECIMAL(12,2) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'open', -- open, full, cancelled, completed
    description TEXT,
    skill_level VARCHAR(20), -- beginner, intermediate, advanced, all
    is_recurring BOOLEAN DEFAULT FALSE,
    recurring_pattern VARCHAR(20), -- weekly, biweekly
    recurring_until DATE,
    location_name VARCHAR(255),
    latitude DECIMAL(10,7),
    longitude DECIMAL(10,7),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE pickup_game_participants (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    pickup_game_id UUID REFERENCES pickup_games(id) ON DELETE CASCADE,
    customer_id UUID REFERENCES customers(id) ON DELETE CASCADE,
    split_amount DECIMAL(12,2) NOT NULL,
    payment_status VARCHAR(20) NOT NULL DEFAULT 'pending', -- pending, paid, refunded
    joined_at TIMESTAMPTZ DEFAULT NOW(),
    skill_level VARCHAR(20),
    position VARCHAR(50),
    is_host BOOLEAN DEFAULT FALSE,
    UNIQUE(pickup_game_id, customer_id)
);

CREATE TABLE pickup_game_messages (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    pickup_game_id UUID REFERENCES pickup_games(id) ON DELETE CASCADE,
    sender_id UUID REFERENCES customers(id) ON DELETE SET NULL,
    message TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);
```

**API Endpoints:**
```
GET    /api/pickup-games              — List pickup games (filter: sport, date, location, skill_level, status)
POST   /api/pickup-games              — Create pickup game (host only)
GET    /api/pickup-games/[id]         — Detail pickup game
PUT    /api/pickup-games/[id]         — Update pickup game (host only)
DELETE /api/pickup-games/[id]         — Cancel pickup game (host only)
POST   /api/pickup-games/[id]/join    — Join pickup game
DELETE /api/pickup-games/[id]/leave   — Leave pickup game
GET    /api/pickup-games/[id]/participants — List participants
POST   /api/pickup-games/[id]/messages     — Send message (participant only)
GET    /api/pickup-games/[id]/messages     — Get messages (participant only, polling)
GET    /api/pickup-games/my            — My hosted & joined pickup games
POST   /api/pickup-games/[id]/close    — Close game & finalize (host only)
```

**Pages:**
```
/pickup-games               — Browse all open pickup games
/pickup-games/create        — Create new pickup game (step wizard)
/pickup-games/[id]          — Detail + participants + chat
/pickup-games/[id]/join     — Join confirmation + payment split
/profile/pickup-games       — My pickup game history (tab di profile)
```

---

#### Modul 2: Team Wallet & Split Bill

**Sub-modul:**
- `team-wallets` — Buat & kelola wallet tim
- `wallet-members` — Invite/remove member
- `wallet-deposits` — Top up dari berbagai member
- `wallet-transactions` — Ledger transaksi dari wallet ke booking
- `wallet-splits` — Split bill antar member (equal, custom ratio, siapa bayar duluan)

**DB Tables:**
```sql
CREATE TABLE team_wallets (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    owner_customer_id UUID REFERENCES customers(id) ON DELETE CASCADE,
    name VARCHAR(100) NOT NULL,
    sport_type VARCHAR(50),
    avatar_url TEXT,
    balance DECIMAL(12,2) NOT NULL DEFAULT 0,
    total_spent DECIMAL(12,2) NOT NULL DEFAULT 0,
    member_count INT NOT NULL DEFAULT 1,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE team_wallet_members (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    wallet_id UUID REFERENCES team_wallets(id) ON DELETE CASCADE,
    customer_id UUID REFERENCES customers(id) ON DELETE CASCADE,
    role VARCHAR(20) NOT NULL DEFAULT 'member', -- owner, admin, member
    balance DECIMAL(12,2) NOT NULL DEFAULT 0,
    total_contributed DECIMAL(12,2) NOT NULL DEFAULT 0,
    joined_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(wallet_id, customer_id)
);

CREATE TABLE team_wallet_deposits (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    wallet_id UUID REFERENCES team_wallets(id) ON DELETE CASCADE,
    from_customer_id UUID REFERENCES customers(id) ON DELETE SET NULL,
    amount DECIMAL(12,2) NOT NULL,
    payment_method VARCHAR(50),
    payment_proof_url TEXT,
    status VARCHAR(20) NOT NULL DEFAULT 'pending', -- pending, confirmed
    notes TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    confirmed_at TIMESTAMPTZ
);

CREATE TABLE team_wallet_transactions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    wallet_id UUID REFERENCES team_wallets(id) ON DELETE CASCADE,
    type VARCHAR(30) NOT NULL, -- deposit, booking_payment, split_refund, withdrawal
    amount DECIMAL(12,2) NOT NULL,
    description TEXT,
    reference_id UUID, -- booking_id if booking_payment
    customer_id UUID REFERENCES customers(id), -- affected customer
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE team_wallet_splits (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    booking_id UUID REFERENCES bookings(id) ON DELETE SET NULL,
    total_amount DECIMAL(12,2) NOT NULL,
    split_type VARCHAR(20) NOT NULL DEFAULT 'equal', -- equal, custom, single_payer
    single_payer_id UUID REFERENCES customers(id),
    settled_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ DEFAULT NOW()
);
```

**API Endpoints:**
```
GET    /api/team-wallets              — My wallets (as owner/member)
POST   /api/team-wallets              — Create team wallet
GET    /api/team-wallets/[id]         — Wallet detail + balance
PUT    /api/team-wallets/[id]         — Update wallet
DELETE /api/team-wallets/[id]         — Delete wallet (owner only)

POST   /api/team-wallets/[id]/members      — Invite member (by email/customer_id)
DELETE /api/team-wallets/[id]/members/[customerId] — Remove member
PUT    /api/team-wallets/[id]/members/[customerId] — Update member role

POST   /api/team-wallets/[id]/deposit      — Deposit to wallet
GET    /api/team-wallets/[id]/deposits     — Deposit history

GET    /api/team-wallets/[id]/transactions — Transaction ledger
GET    /api/team-wallets/[id]/balance      — Current balance breakdown

POST   /api/team-wallets/[id]/booking      — Pay booking from wallet
POST   /api/team-wallets/[id]/split        — Split a bill among members
GET    /api/team-wallets/[id]/splits/[bookingId] — Get split for booking
```

**Pages:**
```
/profile/wallets             — My team wallets
/team-wallet/[id]            — Wallet detail (balance, members, history)
/team-wallet/[id]/invite     — Invite member
/team-wallet/[id]/deposit    — Deposit form
/team-wallet/[id]/book       — Pay booking from wallet
/profile/wallet-history      — Wallet transaction history
```

---

### Sprint 12 — Matchmaking & Social Status 🏆
**Duration:** 2 weeks
**Goal:** Player punya identity + sistem matchmaking.

#### Modul 3: Skill-Based Matchmaking

**Sub-modul:**
- `player-profiles` — Extended profile dengan skill data
- `skill-ratings` — Peer rating setelah game
- `matchmaking-engine` — Algoritma pairing berdasarkan skill, sport, location
- `match-requests` — Request to play, accept/decline

**DB Tables:**
```sql
CREATE TABLE player_profiles (
    customer_id UUID PRIMARY KEY REFERENCES customers(id) ON DELETE CASCADE,
    preferred_position VARCHAR(50),
    preferred_sport VARCHAR(50),
    dominant_foot VARCHAR(20), -- left, right, both
    play_style VARCHAR(30), -- defensive, attacking, balanced, versatile
    bio TEXT,
    height_cm INT,
    weight_kg INT,
    availability JSONB DEFAULT '[]', -- ["weekday_morning", "weekend_evening"]
    preferred_play_time JSONB DEFAULT '[]', -- ["morning", "afternoon", "evening"]
    skill_level_overall VARCHAR(20) DEFAULT 'intermediate', -- beginner, intermediate, advanced, pro
    total_games_played INT DEFAULT 0,
    win_rate DECIMAL(5,2) DEFAULT 0,
    joined_teams INT DEFAULT 0,
    avatar_sport_url TEXT,
    is_public BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE player_skill_ratings (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    customer_id UUID REFERENCES customers(id) ON DELETE CASCADE,
    rated_by_customer_id UUID REFERENCES customers(id) ON DELETE SET NULL,
    pickup_game_id UUID REFERENCES pickup_games(id) ON DELETE CASCADE,
    skill_score INT NOT NULL CHECK (skill_score BETWEEN 1 AND 5),
    attitude_score INT NOT NULL CHECK (attitude_score BETWEEN 1 AND 5),
    punctuality_score INT NOT NULL CHECK (punctuality_score BETWEEN 1 AND 5),
    review_text TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(customer_id, pickup_game_id, rated_by_customer_id)
);

CREATE TABLE match_requests (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    requester_id UUID REFERENCES customers(id) ON DELETE CASCADE,
    target_customer_id UUID REFERENCES customers(id) ON DELETE CASCADE,
    sport_type VARCHAR(50),
    proposed_date TIMESTAMPTZ,
    proposed_location VARCHAR(255),
    message TEXT,
    status VARCHAR(20) NOT NULL DEFAULT 'pending', -- pending, accepted, declined, expired
    pickup_game_id UUID REFERENCES pickup_games(id),
    responded_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ DEFAULT NOW()
);
```

**API Endpoints:**
```
GET    /api/players                     — Search players (filter: sport, skill_level, location)
GET    /api/players/[id]                — Player profile (public)
PUT    /api/players/[id]                — Update player profile
GET    /api/players/[id]/stats          — Player stats & ratings

POST   /api/players/[id]/rate           — Rate a player after game
GET    /api/players/[id]/ratings        — Get player ratings received

POST   /api/match-requests             — Send match request
GET    /api/match-requests             — My incoming & outgoing requests
PUT    /api/match-requests/[id]        — Accept/decline request
DELETE /api/match-requests/[id]        — Cancel request

GET    /api/matchmaking/find           — Find players based on criteria
POST   /api/matchmaking/pair           — Create match pair
```

**Pages:**
```
/players                     — Browse/search players
/players/[id]                — Player profile + stats
/profile/edit-sport          — Edit sport profile
/match-requests              — Incoming & outgoing match requests
```

---

#### Modul 4: Streak & Badge System

**Sub-modul:**
- `achievements` — Define semua achievement/badge
- `player-achievements` — Track per-player achievement progress
- `streaks` — Daily/weekly/venue streak tracking
- `leaderboard` — Global & per-sport leaderboard
- `badges-display` — Render badge di profile

**DB Tables:**
```sql
CREATE TABLE achievements (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    code VARCHAR(50) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    name_en VARCHAR(100),
    description TEXT,
    description_en TEXT,
    category VARCHAR(30) NOT NULL, -- loyalty, community, skill, streak, social
    icon VARCHAR(50), -- emoji atau icon name
    points_reward INT DEFAULT 0,
    badge_tier VARCHAR(20), -- bronze, silver, gold, platinum
    criteria JSONB NOT NULL, -- { type: "total_games", value: 50 }
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE player_achievements (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    customer_id UUID REFERENCES customers(id) ON DELETE CASCADE,
    achievement_id UUID REFERENCES achievements(id) ON DELETE CASCADE,
    progress_current INT DEFAULT 0,
    progress_target INT NOT NULL,
    is_unlocked BOOLEAN DEFAULT FALSE,
    unlocked_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(customer_id, achievement_id)
);

CREATE TABLE player_streaks (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    customer_id UUID REFERENCES customers(id) ON DELETE CASCADE,
    streak_type VARCHAR(30) NOT NULL, -- daily_play, weekly_play, venue_loyalty, sport_mastery
    current_streak INT DEFAULT 0,
    longest_streak INT DEFAULT 0,
    last_activity_at TIMESTAMPTZ,
    streak_data JSONB DEFAULT '{}',
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(customer_id, streak_type)
);
```

**Achievement Codes (seed data):**
```sql
-- Loyalty
('first_game', 'Game Pertama', 'Play your first game', 10, 'bronze'),
('game_10', 'Sering Main', 'Play 10 games', 50, 'bronze'),
('game_50', 'Game Junkie', 'Play 50 games', 200, 'silver'),
('game_100', 'Sultan Lapangan', 'Play 100 games', 500, 'gold'),
('spend_1m', 'Investor Lapangan', 'Spend IDR 1M on bookings', 100, 'bronze'),
('spend_5m', 'Regular Spender', 'Spend IDR 5M on bookings', 300, 'silver'),
('spend_10m', 'Lapangan Patron', 'Spend IDR 10M on bookings', 800, 'gold'),

-- Streak
('streak_7', 'Seminggu Penuh', '7-day play streak', 70, 'bronze'),
('streak_30', 'Sebulan Penuh', '30-day play streak', 300, 'silver'),
('streak_100', 'Seratus Hari', '100-day play streak', 1000, 'gold'),
('venue_5_different', 'Jelajah', 'Play at 5 different venues', 75, 'silver'),
('venue_10_different', 'Petcels', 'Play at 10 different venues', 200, 'gold'),

-- Community
('pickup_host_5', 'Host Ramai', 'Host 5 pickup games', 100, 'silver'),
('pickup_join_10', 'Party Player', 'Join 10 pickup games', 50, 'bronze'),
('team_leader', 'Kapten Tim', 'Create a team wallet', 25, 'bronze'),
('referrer_3', ' recruiter', 'Refer 3 friends', 150, 'silver'),

-- Skill
('rating_5_10', 'Bintang 5', 'Get 10 five-star ratings', 200, 'gold'),
('all_positions', 'Serba Bisa', 'Play all positions', 150, 'silver'),
```

**API Endpoints:**
```
GET    /api/achievements              — List all achievements
GET    /api/achievements/my          — My achievements + progress
GET    /api/achievements/[id]        — Achievement detail

GET    /api/leaderboard              — Global leaderboard (top customers by points/games)
GET    /api/leaderboard/sport/[sport] — Per-sport leaderboard
GET    /api/leaderboard/venue/[venueId] — Per-venue regulars

GET    /api/streaks/my               — My streak status
POST   /api/streaks/check            — Check & update streaks (called after booking confirmed)
```

**Pages:**
```
/profile/achievements      — All achievements + progress
/profile/streaks           — Streak status
/leaderboard               — Global leaderboard
/leaderboard/[sport]       — Sport-specific
```

---

### Sprint 13 — Revenue Recovery 💰
**Duration:** 2 weeks
**Goal:** Maxi

mize owner revenue & player deal discovery.

#### Modul 5: Last-Minute Flash Deals

**Sub-modul:**
- `flash-sales` — Auto-detect empty slots, generate deals
- `deal-notifications` — Push notifikasi ke player yang cocok
- `deal-redemption` — Redeem deal + booking langsung
- `deal-analytics` — Deal performance untuk owner

**DB Tables:**
```sql
CREATE TABLE flash_deals (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    court_id UUID REFERENCES courts(id) ON DELETE CASCADE,
    slot_date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    original_price DECIMAL(12,2) NOT NULL,
    deal_price DECIMAL(12,2) NOT NULL,
    discount_percent INT NOT NULL,
    min_players INT DEFAULT 1,
    max_players INT,
    status VARCHAR(20) NOT NULL DEFAULT 'active', -- active, claimed, expired, cancelled
    deal_type VARCHAR(20) NOT NULL DEFAULT 'last_minute', -- last_minute, early_bird, off_peak, special
    starts_at TIMESTAMPTZ NOT NULL,
    expires_at TIMESTAMPTZ NOT NULL,
    claimed_by UUID REFERENCES customers(id),
    claimed_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE flash_deal_notifications (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    customer_id UUID REFERENCES customers(id) ON DELETE CASCADE,
    flash_deal_id UUID REFERENCES flash_deals(id) ON DELETE CASCADE,
    sent_at TIMESTAMPTZ DEFAULT NOW(),
    clicked BOOLEAN DEFAULT FALSE,
    converted BOOLEAN DEFAULT FALSE
);
```

**API Endpoints:**
```
GET    /api/flash-deals              — Active flash deals (public, filter by location/sport/date)
GET    /api/flash-deals/[id]         — Deal detail
POST   /api/flash-deals/[id]/claim   — Claim deal (creates pending booking)
POST   /api/flash-deals/generate     — Admin/owner: generate deals for empty slots
GET    /api/flash-deals/my           — My claimed deals

-- Cron-triggered (internal)
POST   /api/flash-deals/auto-generate — Auto-generate based on empty slots 2h before
POST   /api/flash-deals/notify        — Send notifications to eligible customers
```

**Pages:**
```
/flash-deals              — Browse active flash deals
/flash-deals/[id]         — Deal detail + claim
/dashboard/flash-deals    — Owner: manage flash deals
```

---

#### Modul 6: Smart Recommendation

**Sub-modul:**
- `recommendations` — Scoring engine (collaborative + content-based)
- `weather-integration` — Weather-aware recommendations
- `demand-forecast` — Predict busy/slow slots
- `personalized-feed` — Feed yang dipersonalisasi per user

**API Endpoints:**
```
GET    /api/recommendations           — Personalized recommendations for logged-in user
GET    /api/recommendations/nearby    — Nearby venues based on location
GET    /api/recommendations/similar   — Similar to venues user liked
GET    /api/recommendations/trending  — Trending venues this week
GET    /api/recommendations/weather-aware — Account for weather forecast
```

**Logic:**
```typescript
// Recommendation scoring
score = (
  popularity_score * 0.2 +           // How popular is this venue/court?
  location_score * 0.3 +              // How close is it?
  price_score * 0.15 +                // Good value for money?
  skill_match_score * 0.2 +           // Matches user's skill level?
  weather_score * 0.1 +               // Weather looks good?
  social_score * 0.05                 // Friends played here?
)
```

---

### Sprint 14 — Trust & Transparency 🔍
**Duration:** 2 weeks
**Goal:** Bikin Lapangin jadi trust anchor untuk player & owner.

#### Modul 7: Court Live Cam

**Sub-modul:**
- `venue-cameras` — Register & manage cameras per venue
- `camera-feeds` — Serve thumbnail/latest frame
- `crowd-meter` — AI/heuristic crowd density estimation
- `camera-approval` — Admin verify camera authenticity

**DB Tables:**
```sql
CREATE TABLE venue_cameras (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    venue_id UUID REFERENCES venues(id) ON DELETE CASCADE,
    court_id UUID REFERENCES courts(id),
    name VARCHAR(100) NOT NULL,
    camera_url TEXT, -- RTSP/hls stream URL or snapshot endpoint
    snapshot_url TEXT, -- Latest frame image URL
    camera_type VARCHAR(20) NOT NULL DEFAULT 'snapshot', -- snapshot, stream
    is_public BOOLEAN DEFAULT TRUE,
    crowd_level VARCHAR(20), -- empty, few, moderate, busy
    last_updated TIMESTAMPTZ,
    status VARCHAR(20) DEFAULT 'active', -- active, offline, pending_approval
    created_at TIMESTAMPTZ DEFAULT NOW()
);
```

**API Endpoints:**
```
GET    /api/venues/[id]/cameras      — Get cameras for venue
POST   /api/venues/[id]/cameras       — Add camera (owner only)
PUT    /api/venues/[id]/cameras/[cameraId] — Update camera
DELETE /api/venues/[id]/cameras/[cameraId] — Remove camera
GET    /api/venues/[id]/cameras/[cameraId]/snapshot — Get latest frame
PUT    /api/venues/[id]/cameras/[cameraId]/crowd — Update crowd level
```

**Pages:**
```
/cari/[sport]/[venueId]        — Camera feed displayed on venue detail
/dashboard/venues/[id]/cameras — Owner camera management
```

---

#### Modul 8: Venue Quality Verification

**Sub-modul:**
- `verification-requests` — Venue apply for verification
- `verification-checklist` — Admin conduct verification
- `verification-scores` — Per-category scores
- `verification-badges` — Display verified badge

**DB Tables:**
```sql
CREATE TABLE venue_verifications (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    venue_id UUID REFERENCES venues(id) ON DELETE CASCADE,
    requested_by UUID REFERENCES venue_owners(id),
    verified_by UUID REFERENCES admins(id),
    status VARCHAR(20) NOT NULL DEFAULT 'pending', -- pending, in_progress, approved, rejected
    overall_score DECIMAL(3,2), -- 0.00 to 5.00
    field_condition_score DECIMAL(3,2),
    lighting_score DECIMAL(3,2),
    cleanliness_score DECIMAL(3,2),
    parking_score DECIMAL(3,2),
    accessibility_score DECIMAL(3,2),
    amenities_score DECIMAL(3,2),
    verified_at TIMESTAMPTZ,
    notes TEXT,
    report_url TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(venue_id)
);

CREATE TABLE venue_verification_photos (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    verification_id UUID REFERENCES venue_verifications(id) ON DELETE CASCADE,
    category VARCHAR(30) NOT NULL, -- field, lighting, bathroom, parking, entrance
    photo_url TEXT NOT NULL,
    caption TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);
```

**Verification Categories & Scores:**
| Category | Weight | Checklist Items |
|----------|--------|-----------------|
| Field Condition | 30% | Grass/field quality, line markings, goal posts, net condition |
| Lighting | 20% | Brightness, no dark spots, night play capability |
| Cleanliness | 20% | Changing rooms, bathroom, floor mopping |
| Parking | 15% | Parking space, accessibility, security |
| Accessibility | 10% | Near public transport, easy to find, signage |
| Amenities | 5% | Cafeteria, lockers, wifi, seating |

**API Endpoints:**
```
POST   /api/venues/[id]/verification/request     — Request verification (owner)
GET    /api/venues/[id]/verification             — Get verification status
POST   /api/admin/verifications                  — Admin: start verification
PUT    /api/admin/verifications/[id]             — Admin: update/submit verification
GET    /api/admin/verifications                  — Admin: list pending verifications
GET    /api/verifications/[id]/report            — Public verification report
```

**Badge Display:**
```
🏅 Lapangin Verified        — Score >= 4.0
🥈 Quality Assured           — Score >= 3.5
✅ Basic Verified            — Score >= 3.0
```

---

### Sprint 15 — Loyalty Overhaul & Polish ✨
**Duration:** 2 weeks
**Goal:** Integrasi semua fitur, polish, testing, launch prep.

#### Modul 9: Loyalty System Overhaul

**Sub-modul:**
- `loyalty-tiers` — Perbaiki tier system (Bronze/Silver/Gold/Platinum)
- `loyalty-benefits` — Benefit per tier (discount, priority booking, exclusive deals)
- `loyalty-dashboard` — Gamified loyalty dashboard
- `point-exchange` — Tukar poin dengan reward/voucher
- `cross-module-integration` — Semua aktivitas dari fitur lain nambah poin

**Improvements to existing loyalty:**
- Poin dari: pickup game join, hosting, achievement unlock, streak, referral, flash deal claim
- Tier benefits: Gold = free flash deal notification, Priority = first dibs on popular slots
- Point expiry: 12 months rolling

**API Endpoints:**
```
GET    /api/loyalty/tiers            — All tiers + benefits
GET    /api/loyalty/my-tier          — Current tier + progress to next
GET    /api/loyalty/benefits         — Benefits for current tier
GET    /api/loyalty/points-history   — Full points ledger
POST   /api/loyalty/redeem           — Redeem points for reward
GET    /api/loyalty/rewards          — Available rewards catalog
```

---

## Cross-Cutting Concerns

### Notification System Enhancement
All new features need notification support:
```typescript
type NotificationType =
  | 'pickup_game_invite'
  | 'pickup_game_join'
  | 'pickup_game_full'
  | 'pickup_game_cancelled'
  | 'match_request_received'
  | 'match_request_accepted'
  | 'achievement_unlocked'
  | 'streak_at_risk'
  | 'flash_deal_available'
  | 'flash_deal_expiring'
  | 'wallet_member_joined'
  | 'wallet_deposit_received'
  | 'venue_verified'
  | 'referral_signup'
  | 'referral_booking';
```

### Search Enhancement
New search dimensions:
- Skill level filter
- Pickup game availability
- Flash deal filter
- Verified venue filter
- Distance from user
- Social signals (friends played here)

### Performance Considerations
- Pickup game listing: paginate, cache 30s
- Leaderboard: cache 5 min, rebuild hourly
- Recommendation: async compute, cache per user 1h
- Flash deal: cron every 30 min, expire jobs every 5 min

---

## Git Branch Strategy

```
feature/sprint11-pickup-game         → develop → test → main
feature/sprint11-team-wallet          → (parallel with above, same branch)
feature/sprint12-matchmaking          → develop → test → main
feature/sprint12-leaderboard          → (parallel with above, same branch)
feature/sprint13-flash-sales          → develop → test → main
feature/sprint13-recommendations      → (parallel with above, same branch)
feature/sprint14-livecam              → develop → test → main
feature/sprint14-verification         → (parallel with above, same branch)
feature/sprint15-loyalty-overhaul     → develop → test → main
```

**Test checklist per sprint:**
1. `tsc --noEmit` ✅
2. `npm run lint` (0 new errors) ✅
3. `npm run build` ✅
4. API smoke test (curl) ✅
5. Auth gate test (unauthenticated → redirect) ✅
6. DB migration apply + rollback plan ✅

---

## DB Migration Order

Each sprint needs a migration file. Naming convention:
```
db/postgres/migrations/
  009_pickup_games.sql
  010_team_wallet.sql
  011_player_profiles.sql
  012_match_requests.sql
  013_achievements.sql
  014_player_achievements.sql
  015_flash_deals.sql
  016_venue_cameras.sql
  017_venue_verifications.sql
  018_loyalty_tiers.sql
```

---

## Timeline

```
Jul 28  → Sprint 11 start (Social Core)
Aug 11  → Sprint 11 end, Sprint 12 start
Aug 25  → Sprint 12 end, Sprint 13 start
Sep 8   → Sprint 13 end, Sprint 14 start
Sep 22  → Sprint 14 end, Sprint 15 start
Oct 6   → Sprint 15 end — Soft Launch
Oct 13  → Public Launch + Marketing Push
```

---

## Open Questions

1. **Payment split for pickup games** — Host pays full first then claim from others? Or everyone pays to Lapangin escrow?
2. **Tournament Builder** — deferred to post-launch (Sprint 16+), needs bracket logic complex
3. **WhatsApp Business API** — perlu integrasi nyata untuk auto-notif pickup game & flash deals
4. **Mystery shopper program** — perlu tim ops, deferred until venue count > 50
5. **Location services** — need user location permission + geocoding
