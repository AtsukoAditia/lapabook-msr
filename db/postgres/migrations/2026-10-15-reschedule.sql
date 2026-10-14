-- Reschedule booking customer (max 1x, H-3). JANGAN apply ke live otomatis.
ALTER TABLE bookings ADD COLUMN IF NOT EXISTS rescheduled_from JSONB;
ALTER TABLE bookings ADD COLUMN IF NOT EXISTS reschedule_count INT NOT NULL DEFAULT 0;

CREATE INDEX IF NOT EXISTS bookings_reschedule_idx ON bookings (reschedule_count) WHERE reschedule_count > 0;
