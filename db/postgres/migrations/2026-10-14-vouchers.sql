-- Vouchers / promo codes
CREATE TABLE IF NOT EXISTS vouchers (
  id varchar PRIMARY KEY,
  code varchar UNIQUE NOT NULL,
  label varchar,
  discount_type varchar NOT NULL CHECK (discount_type IN ('percentage','fixed')),
  discount_value int NOT NULL,
  min_booking_amount int NOT NULL DEFAULT 0,
  max_uses int,
  used_count int NOT NULL DEFAULT 0,
  valid_until timestamptz,
  is_active bool NOT NULL DEFAULT true,
  created_at timestamptz NOT NULL DEFAULT now()
);

ALTER TABLE bookings ADD COLUMN IF NOT EXISTS voucher_code varchar;

INSERT INTO vouchers (id, code, label, discount_type, discount_value, min_booking_amount, max_uses, valid_until)
VALUES
  ('vc-demo-10', 'LAPABOOK10', 'Diskon 10% untuk semua lapangan', 'percentage', 10, 50000, 100, now() + interval '90 days'),
  ('vc-demo-25', 'GRATISMAIN', 'Potongan Rp 25.000', 'fixed', 25000, 100000, 50, now() + interval '90 days')
ON CONFLICT (code) DO NOTHING;
