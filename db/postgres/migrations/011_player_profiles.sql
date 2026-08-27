-- Migration 011: Player Profiles
-- Sprint 12: Skill-Based Matchmaking

BEGIN;

CREATE TABLE IF NOT EXISTS player_profiles (
    customer_id UUID PRIMARY KEY REFERENCES customers(id) ON DELETE CASCADE,
    preferred_position VARCHAR(50),
    preferred_sport VARCHAR(50),
    dominant_foot VARCHAR(20),
    play_style VARCHAR(30),
    bio TEXT,
    height_cm INT,
    weight_kg INT,
    availability JSONB DEFAULT '[]',
    preferred_play_time JSONB DEFAULT '[]',
    skill_level_overall VARCHAR(20) DEFAULT 'intermediate',
    total_games_played INT DEFAULT 0,
    win_rate DECIMAL(5,2) DEFAULT 0,
    joined_teams INT DEFAULT 0,
    avatar_sport_url TEXT,
    is_public BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS player_skill_ratings (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    customer_id UUID REFERENCES customers(id) ON DELETE CASCADE,
    rated_by_customer_id UUID REFERENCES customers(id) ON DELETE SET NULL,
    pickup_game_id UUID REFERENCES pickup_games(id) ON DELETE CASCADE,
    skill_score INT NOT NULL CHECK (skill_score BETWEEN 1 AND 5),
    attitude_score INT NOT NULL CHECK (attitude_score BETWEEN 1 AND 5),
    punctuality_score INT NOT NULL CHECK (punctuality_score BETWEEN 1 AND 5),
    review_text TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(customer_id, pickup_game_id, rated_by_customer_id)
);

CREATE INDEX idx_player_profiles_sport ON player_profiles(preferred_sport);
CREATE INDEX idx_player_profiles_skill ON player_profiles(skill_level_overall);
CREATE INDEX idx_player_profiles_public ON player_profiles(is_public);
CREATE INDEX idx_skill_ratings_customer ON player_skill_ratings(customer_id);
CREATE INDEX idx_skill_ratings_game ON player_skill_ratings(pickup_game_id);

COMMIT;
