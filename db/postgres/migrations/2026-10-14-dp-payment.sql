-- DP / partial payment: uang muka + pelunasan
-- Idempotent. Reuses existing payment_status 'dp_paid' (already in CHECK constraint).
ALTER TABLE bookings ADD COLUMN IF NOT EXISTS down_payment_amount INT NOT NULL DEFAULT 0;
ALTER TABLE bookings ADD COLUMN IF NOT EXISTS paid_amount INT NOT NULL DEFAULT 0;
