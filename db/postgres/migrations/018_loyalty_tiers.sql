-- Migration 018: Loyalty Tiers
-- Sprint 15: Loyalty Overhaul

BEGIN;

CREATE TABLE IF NOT EXISTS loyalty_tiers (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(50) NOT NULL,
    min_points INT NOT NULL,
    multiplier DECIMAL(3,2) NOT NULL DEFAULT 1.00,
    benefits JSONB DEFAULT '{}',
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

INSERT INTO loyalty_tiers (name, min_points, multiplier, benefits) VALUES
('Bronze', 0, 1.00, '{"discount": 0, "flash_deal_priority": false, "priority_booking": false}'),
('Silver', 500, 1.20, '{"discount": 5, "flash_deal_priority": false, "priority_booking": false}'),
('Gold', 2000, 1.50, '{"discount": 10, "flash_deal_priority": true, "priority_booking": false}'),
('Platinum', 5000, 2.00, '{"discount": 15, "flash_deal_priority": true, "priority_booking": true}')
ON CONFLICT DO NOTHING;

COMMIT;
