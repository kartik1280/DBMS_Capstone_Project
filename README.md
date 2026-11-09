Music Library Management System 🎵

DBMS Capstone Project (Topic 9)

📌 Project Overview

The Music Library Management System is a relational database designed in MySQL to organize and analyze digital music collections. It efficiently tracks artists, albums, tracks, and genres, while also recording user interactions such as custom playlists and detailed listening histories.

This project demonstrates proficiency in database schema design, advanced SQL querying, and database optimization techniques.

🗄️ Database Schema

The database (music_library) consists of 9 interconnected tables:

artists: Stores artist details.

albums: Stores album information linked to artists.

genres: Stores music genres.

tracks: Stores individual song details linked to albums.

track_genres: Junction table resolving the many-to-many relationship between tracks and genres.

users: Stores listener profiles.

playlists: Stores playlists created by users.

playlist_tracks: Junction table maintaining the ordered list of tracks within a playlist.

listening_history: Logs every instance a user plays a track, acting as the foundation for preference analysis.

🚀 Key Features & SQL Concepts Implemented

1. CRUD Operations & Basic Queries

Create, Read, Update, Delete operations are implemented to manage the track library.

Subqueries and aggregate functions (e.g., finding tracks longer than the library's average duration).

2. Advanced Indexing

FULLTEXT Indexes: Implemented on track_title and artist_name to optimize text-based search queries.

Composite Indexes: Implemented on playlist_tracks(playlist_id, position) to speed up ordered playlist retrievals.

EXPLAIN Analysis: Demonstrates query execution plans comparing leading wildcards (LIKE '%text%'), prefix searches, and FULLTEXT searches (MATCH() AGAINST()).

3. Database Views

track_details: A complex view joining 5 tables to easily fetch comprehensive track info (Title, Album, Artist, Genre, Duration) without repeatedly writing extensive JOIN statements.

top_artists_by_plays: A view that calculates and ranks artists based on their actual total play counts by joining the listening history.

4. Window Functions

DENSE_RANK(): Ranks the top 5 tracks per genre based on play counts.

LEAD(): Analyzes a user's listening history to find the next track played chronologically without using complex self-joins.

Running Totals: Calculates the cumulative sum of daily track plays over time.

SUM() OVER (PARTITION BY ...): Calculates the percentage contribution of an individual track's plays compared to its parent album's total plays.

🛠️ How to Run

Ensure you have MySQL and a client like MySQL Workbench installed.

Clone this repository.

Open the music_library_capstone_corrected.sql file in your MySQL client.

Execute the script from top to bottom. It will automatically create the schema, insert sample data, and run all analytical queries, views, and functions.

👨‍💻 Author

Kartik Sharma

Bachelor of Technology in CSE (Data Science)

K.R. Mangalam University
