-- Migration 014: Player Achievements & Streaks
-- Sprint 12: Streak & Badge System

BEGIN;

CREATE TABLE IF NOT EXISTS player_achievements (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    customer_id UUID REFERENCES customers(id) ON DELETE CASCADE,
    achievement_id UUID REFERENCES achievements(id) ON DELETE CASCADE,
    progress_current INT DEFAULT 0,
    progress_target INT NOT NULL,
    is_unlocked BOOLEAN DEFAULT FALSE,
    unlocked_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(customer_id, achievement_id)
);

CREATE TABLE IF NOT EXISTS player_streaks (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    customer_id UUID REFERENCES customers(id) ON DELETE CASCADE,
    streak_type VARCHAR(30) NOT NULL,
    current_streak INT DEFAULT 0,
    longest_streak INT DEFAULT 0,
    last_activity_at TIMESTAMPTZ,
    streak_data JSONB DEFAULT '{}',
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(customer_id, streak_type)
);

CREATE INDEX idx_player_achievements_customer ON player_achievements(customer_id);
CREATE INDEX idx_player_achievements_unlocked ON player_achievements(is_unlocked);
CREATE INDEX idx_player_streaks_customer ON player_streaks(customer_id);
CREATE INDEX idx_player_streaks_type ON player_streaks(streak_type);

COMMIT;
