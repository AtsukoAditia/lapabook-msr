-- Migration 013: Achievements
-- Sprint 12: Streak & Badge System

BEGIN;

CREATE TABLE IF NOT EXISTS achievements (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    code VARCHAR(50) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    name_en VARCHAR(100),
    description TEXT,
    description_en TEXT,
    category VARCHAR(30) NOT NULL,
    icon VARCHAR(50),
    points_reward INT DEFAULT 0,
    badge_tier VARCHAR(20),
    criteria JSONB NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Seed achievements
INSERT INTO achievements (code, name, name_en, description, description_en, category, icon, points_reward, badge_tier, criteria) VALUES
('first_game', 'Game Pertama', 'First Game', 'Main game pertama kamu', 'Play your first game', 'loyalty', '🎮', 10, 'bronze', '{"type":"total_games","target":1}'),
('game_10', 'Sering Main', 'Regular Player', 'Main 10 game', 'Play 10 games', 'loyalty', '🏀', 50, 'bronze', '{"type":"total_games","target":10}'),
('game_50', 'Game Junkie', 'Game Junkie', 'Main 50 game', 'Play 50 games', 'loyalty', '🔥', 200, 'silver', '{"type":"total_games","target":50}'),
('game_100', 'Sultan Lapangan', 'Sultan Lapangan', 'Main 100 game', 'Play 100 games', 'loyalty', '👑', 500, 'gold', '{"type":"total_games","target":100}'),
('spend_1m', 'Investor Lapangan', 'Big Spender', 'Spend Rp 1jt di booking', 'Spend IDR 1M on bookings', 'loyalty', '💰', 100, 'bronze', '{"type":"total_spend","target":1000000}'),
('spend_5m', 'Regular Spender', 'Regular Spender', 'Spend Rp 5jt di booking', 'Spend IDR 5M on bookings', 'loyalty', '💳', 300, 'silver', '{"type":"total_spend","target":5000000}'),
('spend_10m', 'Lapangan Patron', 'Lapangan Patron', 'Spend Rp 10jt di booking', 'Spend IDR 10M on bookings', 'loyalty', '💎', 800, 'gold', '{"type":"total_spend","target":10000000}'),
('streak_7', 'Seminggu Penuh', 'Week Warrior', 'Main 7 hari berturut-turut', '7-day play streak', 'streak', '⚡', 70, 'bronze', '{"type":"streak_days","target":7}'),
('streak_30', 'Sebulan Penuh', 'Monthly Master', 'Main 30 hari berturut-turut', '30-day play streak', 'streak', '🌟', 300, 'silver', '{"type":"streak_days","target":30}'),
('streak_100', 'Seratus Hari', 'Century Club', 'Main 100 hari berturut-turut', '100-day play streak', 'streak', '🏆', 1000, 'gold', '{"type":"streak_days","target":100}'),
('venue_5_different', 'Jelajah', 'Explorer', 'Main di 5 lapangan berbeda', 'Play at 5 different venues', 'social', '🗺️', 75, 'silver', '{"type":"unique_venues","target":5}'),
('venue_10_different', 'Petualang', 'Adventurer', 'Main di 10 lapangan berbeda', 'Play at 10 different venues', 'social', '🌍', 200, 'gold', '{"type":"unique_venues","target":10}'),
('pickup_host_5', 'Host Ramai', 'Social Host', 'Buat 5 pickup game', 'Host 5 pickup games', 'community', '📢', 100, 'silver', '{"type":"pickup_hosted","target":5}'),
('pickup_join_10', 'Party Player', 'Party Player', 'Gabung 10 pickup game', 'Join 10 pickup games', 'community', '🎉', 50, 'bronze', '{"type":"pickup_joined","target":10}'),
('team_leader', 'Kapten Tim', 'Team Captain', 'Buat team wallet', 'Create a team wallet', 'community', '👥', 25, 'bronze', '{"type":"wallets_created","target":1}'),
('referrer_3', 'Ajak Teman', 'Recruiter', 'Refer 3 teman', 'Refer 3 friends', 'social', '🤝', 150, 'silver', '{"type":"referrals","target":3}'),
('rating_5_10', 'Bintang 5', 'Five Star', 'Dapat 10 rating 5 bintang', 'Get 10 five-star ratings', 'skill', '⭐', 200, 'gold', '{"type":"five_star_ratings","target":10}'),
('all_positions', 'Serba Bisa', 'Versatile', 'Main di semua posisi', 'Play all positions', 'skill', '🔄', 150, 'silver', '{"type":"positions_played","target":4}')
ON CONFLICT (code) DO NOTHING;

CREATE INDEX idx_achievements_code ON achievements(code);
CREATE INDEX idx_achievements_category ON achievements(category);

COMMIT;
