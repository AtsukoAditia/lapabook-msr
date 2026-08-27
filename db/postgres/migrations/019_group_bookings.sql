-- Migration 019: Smart Group Booking Optimizer (fixed types to VARCHAR like base schema)
-- Sprint 16: Group booking coordination system

BEGIN;

CREATE TABLE IF NOT EXISTS group_bookings (
    id VARCHAR(50) PRIMARY KEY,
    organizer_id UUID NOT NULL REFERENCES customers(id) ON DELETE CASCADE,
    venue_id VARCHAR(50) NOT NULL REFERENCES venues(id) ON DELETE CASCADE,
    court_id VARCHAR(50) NOT NULL REFERENCES courts(id) ON DELETE CASCADE,
    sport_id VARCHAR(50) NOT NULL REFERENCES sports(id),
    title TEXT NOT NULL,
    description TEXT DEFAULT '',
    booking_date DATE,
    start_time TIME,
    end_time TIME,
    duration_minutes INT DEFAULT 60,
    min_participants INT NOT NULL DEFAULT 4,
    max_participants INT NOT NULL DEFAULT 10,
    price_per_slot INTEGER DEFAULT 0,
    status VARCHAR(30) NOT NULL DEFAULT 'draft' CHECK (status IN ('draft','voting','confirmed','cancelled','expired')),
    deadline TIMESTAMPTZ,
    final_booking_id VARCHAR(50) REFERENCES bookings(id),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS group_booking_time_slots (
    id VARCHAR(50) PRIMARY KEY,
    group_booking_id VARCHAR(50) NOT NULL REFERENCES group_bookings(id) ON DELETE CASCADE,
    slot_date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    vote_count INT DEFAULT 0,
    is_winner BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS group_booking_participants (
    id VARCHAR(50) PRIMARY KEY,
    group_booking_id VARCHAR(50) NOT NULL REFERENCES group_bookings(id) ON DELETE CASCADE,
    customer_id UUID NOT NULL REFERENCES customers(id) ON DELETE CASCADE,
    status VARCHAR(20) NOT NULL DEFAULT 'invited' CHECK (status IN ('invited','accepted','declined','confirmed','no_show')),
    availability_json JSONB DEFAULT '[]',
    vote_slot_id VARCHAR(50) REFERENCES group_booking_time_slots(id) ON DELETE SET NULL,
    split_amount INTEGER DEFAULT 0,
    is_organizer BOOLEAN DEFAULT FALSE,
    joined_at TIMESTAMPTZ DEFAULT NOW(),
    confirmed_at TIMESTAMPTZ,
    UNIQUE(group_booking_id, customer_id)
);

CREATE INDEX IF NOT EXISTS idx_group_bookings_organizer ON group_bookings(organizer_id);
CREATE INDEX IF NOT EXISTS idx_group_bookings_status ON group_bookings(status);
CREATE INDEX IF NOT EXISTS idx_group_bookings_venue ON group_bookings(venue_id);
CREATE INDEX IF NOT EXISTS idx_gb_participants_group ON group_booking_participants(group_booking_id);
CREATE INDEX IF NOT EXISTS idx_gb_participants_customer ON group_booking_participants(customer_id);
CREATE INDEX IF NOT EXISTS idx_gb_slots_group ON group_booking_time_slots(group_booking_id);

COMMIT;

