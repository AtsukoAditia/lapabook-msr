-- Migration 016: Venue Cameras
-- Sprint 14: Trust & Transparency

BEGIN;

CREATE TABLE IF NOT EXISTS venue_cameras (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    venue_id UUID REFERENCES venues(id) ON DELETE CASCADE,
    court_id UUID REFERENCES courts(id),
    name VARCHAR(100) NOT NULL,
    camera_url TEXT,
    snapshot_url TEXT,
    camera_type VARCHAR(20) NOT NULL DEFAULT 'snapshot',
    is_public BOOLEAN DEFAULT TRUE,
    crowd_level VARCHAR(20),
    last_updated TIMESTAMPTZ,
    status VARCHAR(20) DEFAULT 'active',
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_venue_cameras_venue ON venue_cameras(venue_id);
CREATE INDEX idx_venue_cameras_court ON venue_cameras(court_id);
CREATE INDEX idx_venue_cameras_status ON venue_cameras(status);

COMMIT;
