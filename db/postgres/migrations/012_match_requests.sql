-- Migration 012: Match Requests
-- Sprint 12: Skill-Based Matchmaking

BEGIN;

CREATE TABLE IF NOT EXISTS match_requests (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    requester_id UUID REFERENCES customers(id) ON DELETE CASCADE,
    target_customer_id UUID REFERENCES customers(id) ON DELETE CASCADE,
    sport_type VARCHAR(50),
    proposed_date TIMESTAMPTZ,
    proposed_location VARCHAR(255),
    message TEXT,
    status VARCHAR(20) NOT NULL DEFAULT 'pending',
    pickup_game_id UUID REFERENCES pickup_games(id) ON DELETE SET NULL,
    responded_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_match_requests_requester ON match_requests(requester_id);
CREATE INDEX idx_match_requests_target ON match_requests(target_customer_id);
CREATE INDEX idx_match_requests_status ON match_requests(status);

COMMIT;
