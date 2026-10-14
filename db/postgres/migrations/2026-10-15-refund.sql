-- Refund request flow: customer/owner ajukan refund untuk booking paid/dp_paid yang dibatalkan.
-- Idempotent. JANGAN apply ke live (file-only, tunggu review).
ALTER TABLE bookings ADD COLUMN IF NOT EXISTS refund_reason TEXT NULL;
ALTER TABLE bookings ADD COLUMN IF NOT EXISTS refund_requested_at TIMESTAMPTZ NULL;

-- Tambah 'refund_requested' ke CHECK hanya bila belum ada.
-- Constraint anonim di schema.sql → cari nama constraint dinamis.
DO $$
DECLARE
  cname TEXT;
BEGIN
  SELECT conname INTO cname
  FROM pg_constraint
  WHERE conrelid = 'bookings'::regclass
    AND contype = 'c'
    AND pg_get_constraintdef(oid) LIKE '%payment_status%';
  IF cname IS NOT NULL AND pg_get_constraintdef((SELECT oid FROM pg_constraint WHERE conname = cname AND conrelid = 'bookings'::regclass)) NOT LIKE '%refund_requested%' THEN
    EXECUTE format('ALTER TABLE bookings DROP CONSTRAINT %I', cname);
    ALTER TABLE bookings ADD CHECK (
      payment_status IN ('unpaid', 'waiting_confirmation', 'dp_paid', 'paid', 'rejected', 'refunded', 'refund_requested')
    );
  END IF;
END $$;
