-- Migration 009: Pickup Game System
-- Adds: pickup_games, pickup_game_participants, pickup_game_messages

BEGIN;

CREATE TABLE IF NOT EXISTS pickup_games (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    court_id UUID REFERENCES courts(id) ON DELETE SET NULL,
    host_customer_id UUID REFERENCES customers(id) ON DELETE SET NULL,
    venue_id UUID REFERENCES venues(id) ON DELETE SET NULL,
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
    split_amount DECIMAL(12,2) NOT NULL,
    payment_status VARCHAR(20) NOT NULL DEFAULT 'pending',
    joined_at TIMESTAMPTZ DEFAULT NOW(),
    skill_level VARCHAR(20),
    position VARCHAR(50),
    is_host BOOLEAN DEFAULT FALSE,
    UNIQUE(pickup_game_id, customer_id)
);

CREATE TABLE IF NOT EXISTS pickup_game_messages (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    pickup_game_id UUID REFERENCES pickup_games(id) ON DELETE CASCADE,
    sender_id UUID REFERENCES customers(id) ON DELETE SET NULL,
    message TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_pickup_games_sport ON pickup_games(sport_type);
CREATE INDEX idx_pickup_games_status ON pickup_games(status);
CREATE INDEX idx_pickup_games_scheduled ON pickup_games(scheduled_at);
CREATE INDEX idx_pickup_games_location ON pickup_games(latitude, longitude);
CREATE INDEX idx_pickup_participants_game ON pickup_game_participants(pickup_game_id);
CREATE INDEX idx_pickup_participants_customer ON pickup_game_participants(customer_id);
CREATE INDEX idx_pickup_messages_game ON pickup_game_messages(pickup_game_id);
CREATE INDEX idx_pickup_messages_created ON pickup_game_messages(created_at);

COMMIT;
