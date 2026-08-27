-- Migration 010: Team Wallet System
-- Adds: team_wallets, team_wallet_members, team_wallet_deposits,
--       team_wallet_transactions, team_wallet_splits

BEGIN;

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
    reference_id UUID,
    customer_id UUID REFERENCES customers(id),
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS team_wallet_splits (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    wallet_id UUID REFERENCES team_wallets(id) ON DELETE CASCADE,
    booking_id UUID REFERENCES bookings(id) ON DELETE SET NULL,
    total_amount DECIMAL(12,2) NOT NULL,
    split_type VARCHAR(20) NOT NULL DEFAULT 'equal',
    settled_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS team_wallet_split_members (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    split_id UUID REFERENCES team_wallet_splits(id) ON DELETE CASCADE,
    customer_id UUID REFERENCES customers(id) ON DELETE CASCADE,
    amount DECIMAL(12,2) NOT NULL,
    paid BOOLEAN DEFAULT FALSE,
    paid_at TIMESTAMPTZ,
    UNIQUE(split_id, customer_id)
);

CREATE INDEX idx_wallet_owner ON team_wallets(owner_customer_id);
CREATE INDEX idx_wallet_members_wallet ON team_wallet_members(wallet_id);
CREATE INDEX idx_wallet_members_customer ON team_wallet_members(customer_id);
CREATE INDEX idx_wallet_deposits_wallet ON team_wallet_deposits(wallet_id);
CREATE INDEX idx_wallet_transactions_wallet ON team_wallet_transactions(wallet_id);
CREATE INDEX idx_wallet_transactions_customer ON team_wallet_transactions(customer_id);
CREATE INDEX idx_wallet_splits_wallet ON team_wallet_splits(wallet_id);
CREATE INDEX idx_wallet_splits_booking ON team_wallet_splits(booking_id);

COMMIT;
