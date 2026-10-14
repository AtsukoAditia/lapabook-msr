-- Owner settlement/payout requests. NOT applied to live DB (migration file only).
CREATE TABLE IF NOT EXISTS payouts (
  id VARCHAR(50) PRIMARY KEY,
  owner_id VARCHAR(50) NOT NULL REFERENCES venue_owners(id) ON DELETE CASCADE,
  venue_id VARCHAR(50) REFERENCES venues(id) ON DELETE SET NULL,
  amount INT NOT NULL CHECK (amount > 0),
  status TEXT NOT NULL DEFAULT 'requested'
    CHECK (status IN ('requested', 'approved', 'rejected', 'paid')),
  note TEXT NOT NULL DEFAULT '',
  requested_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  decided_at TIMESTAMPTZ,
  decided_by TEXT
);
CREATE INDEX IF NOT EXISTS payouts_owner_idx ON payouts (owner_id);
CREATE INDEX IF NOT EXISTS payouts_status_idx ON payouts (status);
