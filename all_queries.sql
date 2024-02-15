-- ignore this file, it's a backup of all the SQL queries I've written for this project.

CREATE TABLE "MusicVideo" (
  "video_id" INTEGER,
  "track_id" INTEGER NOT NULL UNIQUE,
  "video_director" TEXT NOT NULL,
  PRIMARY KEY("video_id" AUTOINCREMENT),
  FOREIGN KEY("track_id") REFERENCES "tracks"("TrackId")
);

INSERT INTO MusicVideo(track_id, video_director) VALUES (3, 'John Doe');
INSERT INTO MusicVideo(track_id, video_director) VALUES (14, 'Wizard Man');
INSERT INTO MusicVideo(track_id, video_director) VALUES (51, 'Jerry Cantrell');
INSERT INTO MusicVideo(track_id, video_director) VALUES (78, 'Apocalyptica');
INSERT INTO MusicVideo(track_id, video_director) VALUES (196, 'Buddy Guy');
INSERT INTO MusicVideo(track_id, video_director) VALUES (428, 'Queen');
INSERT INTO MusicVideo(track_id, video_director) VALUES (447, 'Paul Stanley');
INSERT INTO MusicVideo(track_id, video_director) VALUES (547, 'Coverdale');
INSERT INTO MusicVideo(track_id, video_director) VALUES (704, 'J.C. Fogerty');
INSERT INTO MusicVideo(track_id, video_director) VALUES (1009, 'Foo Fighters');

INSERT INTO MusicVideo(track_id, video_director)
SELECT TrackId,
  Composer
FROM tracks
WHERE Name == 'Voodoo';


SELECT DISTINCT C.CustomerId,
  C.FirstName,
  C.LastName
FROM customers C
  JOIN invoices ON invoices.CustomerId = C.CustomerId
  JOIN invoice_items ON invoice_items.InvoiceId = invoices.InvoiceId
  JOIN tracks ON tracks.TrackId = invoice_items.TrackId
WHERE tracks.Milliseconds > (
  SELECT AVG(Milliseconds)
  FROM tracks
  WHERE Milliseconds <= 900000
);
-- Google Gemini (free version) explained how JOINs work in SQL, and gave me the code for the second half of the query.
-- I then made some modifications to it, to make it return nicer results. 

-- Prompt:
-- In this assignment you will practice the SQL skills developed in the course. For this, we will be using the sample SQLITE database found on https://www.sqlitetutorial.net/sqlite-sample-database/
-- Download the database, and then, complete the following tasks:
-- Write a query that lists all the customers that listen to longer-than-average tracks, excluding the tracks that are longer than 15 minutes.



SELECT * 
  FROM tracks
WHERE
  tracks.GenreId NOT IN (
    SELECT 
      GenreId 
    FROM (
      SELECT
        GenreId,
        SUM(Milliseconds) AS genre_duration
      FROM tracks 
        GROUP BY GenreId
        ORDER BY genre_duration DESC
        LIMIT(5)
    )
  );