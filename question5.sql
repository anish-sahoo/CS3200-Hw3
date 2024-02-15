-- Question: Write a query that lists all the tracks that are not in one of the top 5 genres with longer duration in the database. 


-- --My Progression:

-- -- select genres from tracks, where:
-- -- genre in:
-- -- select from genres order by avg descending

-- SELECT GenreId AS "Genre ID", SUM(Milliseconds) AS "Genre Duration" FROM tracks GROUP BY GenreId ORDER BY "Genre Duration" DESC LIMIT(5);

-- SELECT * FROM tracks
-- WHERE
--   GenreId NOT IN
--     SELECT
--       GenreId,
--       SUM(Milliseconds) AS genre_duration
--     FROM tracks 
--     GROUP BY GenreId
--     ORDER BY genre_duration DESC
--     LIMIT(5);

SELECT * 
  FROM tracks
WHERE
  tracks.GenreId NOT IN (
    SELECT 
      GenreId 
    FROM (
      SELECT
        GenreId,
        SUM(Milliseconds) genre_duration -- you can also replace this with AVG, and it should still work
      FROM tracks 
        GROUP BY GenreId
        ORDER BY genre_duration DESC
        LIMIT(5)
    )
  );