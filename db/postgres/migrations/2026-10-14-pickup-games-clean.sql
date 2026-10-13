-- Migration: 009 pickup_games + 010 team_wallets (clean, live-DB compatible)
-- Asumsi tipe id: customers.id=uuid, courts.id=varchar, venues.id=varchar, bookings.id=varchar
-- Kolom align dengan cara API route memakai (INSERT ... RETURNING *)

BEGIN;

-- ─── 1. PICKUP GAMES ───
CREATE TABLE IF NOT EXISTS pickup_games (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    court_id VARCHAR(50) REFERENCES courts(id) ON DELETE SET NULL,
    host_customer_id UUID REFERENCES customers(id) ON DELETE SET NULL,
    venue_id VARCHAR(50) REFERENCES venues(id) ON DELETE SET NULL,
    title VARCHAR(255) NOT NULL,
    sport_type VARCHAR(50) NOT NULL,
    scheduled_at TIMESTAMPTZ NOT NULL,
    duration_minutes INT NOT NULL DEFAULT 60,
    max_players INT NOT NULL,
    current_players INT NOT NULL DEFAULT 1,
    price_per_person DECIMAL(12,2) NOT NULL,
    total_price DECIMAL(12,2) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'open',
    description TEXT,
    skill_level VARCHAR(20) DEFAULT 'all',
    is_recurring BOOLEAN DEFAULT FALSE,
    recurring_pattern VARCHAR(20),
    recurring_until DATE,
    location_name VARCHAR(255),
    latitude DECIMAL(10,7),
    longitude DECIMAL(10,7),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS pickup_game_participants (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    pickup_game_id UUID REFERENCES pickup_games(id) ON DELETE CASCADE,
    customer_id UUID REFERENCES customers(id) ON DELETE CASCADE,
    split_amount DECIMAL(12,2),
    is_host BOOLEAN DEFAULT FALSE,
    joined_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(pickup_game_id, customer_id)
);

CREATE TABLE IF NOT EXISTS pickup_game_messages (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    pickup_game_id UUID REFERENCES pickup_games(id) ON DELETE CASCADE,
    customer_id UUID REFERENCES customers(id) ON DELETE SET NULL,
    message TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS pickup_games_sport_status_date_idx ON pickup_games (sport_type, status, scheduled_at);
CREATE INDEX IF NOT EXISTS pickup_game_participants_game_idx ON pickup_game_participants (pickup_game_id);

-- ─── 2. TEAM WALLETS ───
CREATE TABLE IF NOT EXISTS team_wallets (
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

CREATE TABLE IF NOT EXISTS team_wallet_members (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    wallet_id UUID REFERENCES team_wallets(id) ON DELETE CASCADE,
    customer_id UUID REFERENCES customers(id) ON DELETE CASCADE,
    role VARCHAR(20) NOT NULL DEFAULT 'member',
    balance DECIMAL(12,2) NOT NULL DEFAULT 0,
    total_contributed DECIMAL(12,2) NOT NULL DEFAULT 0,
    joined_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(wallet_id, customer_id)
);

CREATE TABLE IF NOT EXISTS team_wallet_deposits (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    wallet_id UUID REFERENCES team_wallets(id) ON DELETE CASCADE,
    from_customer_id UUID REFERENCES customers(id) ON DELETE SET NULL,
    amount DECIMAL(12,2) NOT NULL,
    payment_method VARCHAR(50),
    payment_proof_url TEXT,
    status VARCHAR(20) NOT NULL DEFAULT 'pending',
    notes TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    confirmed_at TIMESTAMPTZ
);

CREATE TABLE IF NOT EXISTS team_wallet_transactions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    wallet_id UUID REFERENCES team_wallets(id) ON DELETE CASCADE,
    type VARCHAR(30) NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    description TEXT,
    reference_id VARCHAR(100),
    customer_id UUID REFERENCES customers(id) ON DELETE SET NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS team_wallet_splits (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    wallet_id UUID REFERENCES team_wallets(id) ON DELETE CASCADE,
    booking_id VARCHAR(50) REFERENCES bookings(id) ON DELETE SET NULL,
    total_amount DECIMAL(12,2) NOT NULL,
    split_type VARCHAR(20) DEFAULT 'equal',
    status VARCHAR(20) DEFAULT 'pending',
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS team_wallet_split_members (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    split_id UUID REFERENCES team_wallet_splits(id) ON DELETE CASCADE,
    customer_id UUID REFERENCES customers(id) ON DELETE CASCADE,
    amount DECIMAL(12,2) NOT NULL,
    status VARCHAR(20) DEFAULT 'pending',
    paid_at TIMESTAMPTZ
);

CREATE INDEX IF NOT EXISTS team_wallet_members_wallet_idx ON team_wallet_members (wallet_id);
CREATE INDEX IF NOT EXISTS team_wallet_deposits_wallet_idx ON team_wallet_deposits (wallet_id);
CREATE INDEX IF NOT EXISTS team_wallet_transactions_wallet_idx ON team_wallet_transactions (wallet_id);
CREATE INDEX IF NOT EXISTS team_wallet_split_members_split_idx ON team_wallet_split_members (split_id);

COMMIT;
