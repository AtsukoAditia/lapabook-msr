-- Platform settings key-value store (P2 admin completion)
CREATE TABLE IF NOT EXISTS platform_settings (
  id SERIAL PRIMARY KEY,
  key VARCHAR(100) NOT NULL UNIQUE,
  value JSONB NOT NULL DEFAULT '{}'::jsonb,
  updated_by VARCHAR(100),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

INSERT INTO platform_settings (key, value) VALUES
  ('platform_fee_default', '10'),
  ('settlement_cutoff_hour', '23'),
  ('app_name', '"Lapabook"')
ON CONFLICT (key) DO NOTHING;
