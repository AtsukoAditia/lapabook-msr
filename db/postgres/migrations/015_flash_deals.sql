-- Migration 015: Flash Deals
-- Sprint 13: Revenue Recovery

BEGIN;

CREATE TABLE IF NOT EXISTS flash_deals (
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
    status VARCHAR(20) NOT NULL DEFAULT 'active',
    deal_type VARCHAR(20) NOT NULL DEFAULT 'last_minute',
    starts_at TIMESTAMPTZ NOT NULL,
    expires_at TIMESTAMPTZ NOT NULL,
    claimed_by UUID REFERENCES customers(id),
    claimed_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS flash_deal_notifications (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    customer_id UUID REFERENCES customers(id) ON DELETE CASCADE,
    flash_deal_id UUID REFERENCES flash_deals(id) ON DELETE CASCADE,
    sent_at TIMESTAMPTZ DEFAULT NOW(),
    clicked BOOLEAN DEFAULT FALSE,
    converted BOOLEAN DEFAULT FALSE
);

CREATE INDEX idx_flash_deals_court ON flash_deals(court_id);
CREATE INDEX idx_flash_deals_status ON flash_deals(status);
CREATE INDEX idx_flash_deals_date ON flash_deals(slot_date);
CREATE INDEX idx_flash_deals_expires ON flash_deals(expires_at);
CREATE INDEX idx_flash_deal_notif_customer ON flash_deal_notifications(customer_id);

COMMIT;
