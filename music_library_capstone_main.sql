-- CREATE DATABASE IF NOT EXISTS music_library;
-- USE music_library;

-- 1. Artists
CREATE TABLE artists (
    artist_id INT PRIMARY KEY AUTO_INCREMENT,
    artist_name VARCHAR(100) NOT NULL
);

-- 2. Albums
CREATE TABLE albums (
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    album_title VARCHAR(150) NOT NULL,
    release_year INT,
    artist_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

-- 3. Genres
CREATE TABLE genres (
    genre_id INT PRIMARY KEY AUTO_INCREMENT,
    genre_name VARCHAR(50) NOT NULL UNIQUE
);

-- 4. Tracks
CREATE TABLE tracks (
    track_id INT PRIMARY KEY AUTO_INCREMENT,
    track_title VARCHAR(150) NOT NULL,
    album_id INT NOT NULL,
    duration_seconds INT,
    FOREIGN KEY (album_id) REFERENCES albums(album_id)
);

-- 5. Track Genres
CREATE TABLE track_genres (
    track_id INT,
    genre_id INT,
    PRIMARY KEY (track_id, genre_id),
    FOREIGN KEY (track_id) REFERENCES tracks(track_id),
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

-- 6. Users
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL UNIQUE
);

-- 7. Playlists
CREATE TABLE playlists (
    playlist_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    playlist_name VARCHAR(100) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- 8. Playlist Tracks
CREATE TABLE playlist_tracks (
    playlist_id INT,
    track_id INT,
    position INT NOT NULL,
    PRIMARY KEY (playlist_id, track_id),
    FOREIGN KEY (playlist_id) REFERENCES playlists(playlist_id),
    FOREIGN KEY (track_id) REFERENCES tracks(track_id)
);

-- 9. Listening History
CREATE TABLE listening_history (
    history_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    track_id INT NOT NULL,
    played_at DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (track_id) REFERENCES tracks(track_id)
);

-- Insert Data
INSERT INTO artists (artist_name) VALUES
('Daniel Caesar'), ('The Weeknd'), ('Joji'), ('Steve Lacy');

INSERT INTO albums (album_title, release_year, artist_id) VALUES
('Freudian', 2017, 1), ('After Hours', 2020, 2), ('BALLADS 1', 2018, 3), ('Gemini Rights', 2022, 4);

INSERT INTO genres (genre_name) VALUES ('R&B'), ('Alternative R&B');

INSERT INTO tracks (track_title, album_id, duration_seconds) VALUES
('Get You', 1, 278), ('Best Part', 1, 209), ('Japanese Denim', 1, 257),
('Blinding Lights', 2, 200), ('Save Your Tears', 2, 215), ('In Your Eyes', 2, 237),
('Slow Dancing in the Dark', 3, 209), ('Yeah Right', 3, 174), ('Attention', 3, 120),
('Bad Habit', 4, 232), ('Static', 4, 107), ('Helmet', 4, 182);

INSERT INTO track_genres (track_id, genre_id) VALUES
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1),
(7, 2), (8, 2), (9, 2), (10, 2), (11, 2), (12, 2);

INSERT INTO users (username) VALUES ('user_one'), ('user_two');

INSERT INTO playlists (user_id, playlist_name) VALUES (1, 'Late Night Vibes'), (2, 'R&B Collection');

INSERT INTO playlist_tracks (playlist_id, track_id, position) VALUES
(1, 1, 1), (1, 2, 2), (1, 7, 3), (1, 10, 4), (1, 4, 5),
(2, 3, 1), (2, 5, 2), (2, 8, 3), (2, 11, 4);

INSERT INTO listening_history (user_id, track_id, played_at) VALUES
(1,1,'2026-11-01 09:00:00'), (1,1,'2026-11-01 10:00:00'), (1,1,'2026-11-02 09:00:00'),
(1,1,'2026-11-02 10:00:00'), (1,1,'2026-11-03 09:00:00'), (1,1,'2026-11-03 10:00:00'),
(1,2,'2026-11-01 09:00:00'), (1,2,'2026-11-01 10:00:00'), (1,2,'2026-11-02 09:00:00'),
(1,2,'2026-11-02 10:00:00'), (1,2,'2026-11-03 09:00:00'), (1,3,'2026-11-01 09:00:00'),
(1,3,'2026-11-01 10:00:00'), (1,3,'2026-11-02 09:00:00'), (1,3,'2026-11-03 09:00:00'),
(1,4,'2026-11-01 09:00:00'), (1,4,'2026-11-02 09:00:00'), (1,4,'2026-11-03 09:00:00'),
(1,5,'2026-11-01 09:00:00'), (1,5,'2026-11-03 09:00:00'), (1,6,'2026-11-02 09:00:00'),
(1,7,'2026-11-01 09:00:00'), (1,7,'2026-11-01 10:00:00'), (1,7,'2026-11-02 09:00:00'),
(1,7,'2026-11-02 10:00:00'), (1,7,'2026-11-03 09:00:00'), (1,7,'2026-11-03 10:00:00'),
(1,8,'2026-11-01 09:00:00'), (1,8,'2026-11-01 10:00:00'), (1,8,'2026-11-02 09:00:00'),
(1,8,'2026-11-02 10:00:00'), (1,8,'2026-11-03 09:00:00'), (1,9,'2026-11-01 09:00:00'),
(1,9,'2026-11-01 10:00:00'), (1,9,'2026-11-02 09:00:00'), (1,9,'2026-11-03 09:00:00'),
(1,10,'2026-11-01 09:00:00'), (1,10,'2026-11-02 09:00:00'), (1,10,'2026-11-03 09:00:00'),
(1,11,'2026-11-01 09:00:00'), (1,11,'2026-11-03 09:00:00'), (1,12,'2026-11-02 09:00:00');

-- ----------------------------------------------------
-- CRUD Operations
-- ----------------------------------------------------
-- Insert a new track
INSERT INTO tracks (track_title, album_id, duration_seconds) VALUES ('Snooze', 1, 201);

-- Update a track
SET SQL_SAFE_UPDATES = 0;
UPDATE tracks SET duration_seconds = 210 WHERE track_title = 'Snooze';

-- Delete a track
DELETE FROM tracks WHERE track_title = 'Snooze';
SET SQL_SAFE_UPDATES = 1;

-- Subquery: Tracks longer than average
SELECT track_title, duration_seconds
FROM tracks
WHERE duration_seconds > (SELECT AVG(duration_seconds) FROM tracks)
ORDER BY duration_seconds DESC;

-- ----------------------------------------------------
-- Indexing 
-- ----------------------------------------------------
-- Creating FULLTEXT indexes to meet capstone requirements (Replaced B-Tree indexes)
CREATE FULLTEXT INDEX idx_track_title ON tracks(track_title);
CREATE FULLTEXT INDEX idx_artist_name ON artists(artist_name);

-- Composite index on playlist tracks (playlist_id, position)
CREATE INDEX idx_playlist_position ON playlist_tracks(playlist_id, position);

-- EXPLAIN Comparisons
-- 1. Compare LIKE '%text%' (Leading wildcard prevents standard index usage)
EXPLAIN SELECT * FROM tracks WHERE track_title LIKE '%Lights%';

-- 2. Prefix search (Can utilize B-Tree index if one existed, but shows standard scan behavior here)
EXPLAIN SELECT * FROM tracks WHERE track_title LIKE 'Blind%';

-- 3. FULLTEXT search (Utilizes the FULLTEXT index created above)
EXPLAIN SELECT * FROM tracks WHERE MATCH(track_title) AGAINST('Lights');

-- ----------------------------------------------------
-- Views
-- ----------------------------------------------------
-- 1. Track details view
CREATE VIEW track_details AS
SELECT
    t.track_id, t.track_title, al.album_title, ar.artist_name, g.genre_name, t.duration_seconds
FROM tracks t
JOIN albums al ON t.album_id = al.album_id
JOIN artists ar ON al.artist_id = ar.artist_id
JOIN track_genres tg ON t.track_id = tg.track_id
JOIN genres g ON tg.genre_id = g.genre_id;

-- 2. Top artists view based on play counts (Replaces basic track count to meet requirements)
CREATE VIEW top_artists_by_plays AS
SELECT
    ar.artist_id, ar.artist_name, COUNT(lh.history_id) AS total_plays
FROM artists ar
JOIN albums al ON ar.artist_id = al.artist_id
JOIN tracks t ON al.album_id = t.album_id
JOIN listening_history lh ON t.track_id = lh.track_id
GROUP BY ar.artist_id, ar.artist_name
ORDER BY total_plays DESC;

-- ----------------------------------------------------
-- Window Functions
-- ----------------------------------------------------
-- 1. DENSE_RANK(): Top 5 tracks per genre by play count
WITH track_plays AS (
    SELECT g.genre_name, t.track_title, COUNT(lh.history_id) AS total_plays
    FROM tracks t
    JOIN track_genres tg ON t.track_id = tg.track_id
    JOIN genres g ON tg.genre_id = g.genre_id
    JOIN listening_history lh ON t.track_id = lh.track_id
    GROUP BY g.genre_name, t.track_id, t.track_title
),
ranked_tracks AS (
    SELECT genre_name, track_title, total_plays,
           DENSE_RANK() OVER (PARTITION BY genre_name ORDER BY total_plays DESC) AS song_rank
    FROM track_plays
)
SELECT * FROM ranked_tracks WHERE song_rank <= 5 ORDER BY genre_name, song_rank;

-- 2. LEAD(): Next track played in user's listening history
SELECT
    u.username, t.track_title AS current_track, lh.played_at,
    LEAD(t.track_title) OVER (PARTITION BY u.user_id ORDER BY lh.played_at) AS next_track
FROM listening_history lh
JOIN users u ON lh.user_id = u.user_id
JOIN tracks t ON lh.track_id = t.track_id;

-- 3. Running total of plays per day
SELECT
    DATE(played_at) AS play_date, COUNT(*) AS daily_plays,
    SUM(COUNT(*)) OVER (ORDER BY DATE(played_at)) AS running_total
FROM listening_history
GROUP BY DATE(played_at)
ORDER BY play_date;

-- 4. SUM() OVER (PARTITION BY album_id): Percentage contribution of each track to album's plays
WITH track_plays AS (
    SELECT t.track_id, t.track_title, t.album_id, COUNT(lh.history_id) AS total_track_plays
    FROM tracks t
    LEFT JOIN listening_history lh ON t.track_id = lh.track_id
    GROUP BY t.track_id, t.track_title, t.album_id
),
album_totals AS (
    SELECT track_title, album_id, total_track_plays,
           SUM(total_track_plays) OVER (PARTITION BY album_id) AS total_album_plays
    FROM track_plays
)
SELECT track_title, total_track_plays, total_album_plays,
       ROUND(total_track_plays * 100.0 / NULLIF(total_album_plays, 0), 2) AS percentage_contribution
FROM album_totals
ORDER BY album_id, track_title;
