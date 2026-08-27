-- Migration 017: Venue Verifications
-- Sprint 14: Trust & Transparency

BEGIN;

CREATE TABLE IF NOT EXISTS venue_verifications (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    venue_id UUID UNIQUE REFERENCES venues(id) ON DELETE CASCADE,
    requested_by UUID REFERENCES venue_owners(id),
    verified_by UUID REFERENCES admins(id),
    status VARCHAR(20) NOT NULL DEFAULT 'pending',
    overall_score DECIMAL(3,2),
    field_condition_score DECIMAL(3,2),
    lighting_score DECIMAL(3,2),
    cleanliness_score DECIMAL(3,2),
    parking_score DECIMAL(3,2),
    accessibility_score DECIMAL(3,2),
    amenities_score DECIMAL(3,2),
    verified_at TIMESTAMPTZ,
    notes TEXT,
    report_url TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS venue_verification_photos (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    verification_id UUID REFERENCES venue_verifications(id) ON DELETE CASCADE,
    category VARCHAR(30) NOT NULL,
    photo_url TEXT NOT NULL,
    caption TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_venue_verifications_venue ON venue_verifications(venue_id);
CREATE INDEX idx_venue_verifications_status ON venue_verifications(status);
CREATE INDEX idx_venue_verification_photos_verification ON venue_verification_photos(verification_id);

COMMIT;
