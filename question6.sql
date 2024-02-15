-- goal: find the top 10 most popular tracks sold, total value they sold for, and the most popular media type of those tracks


-- Step 1: find the top 10 most popular tracks sold
SELECT
  inv.TrackId track_id,
  tracks.Name track_name,
  SUM(inv.UnitPrice) track_sales,
  genres.Name genre,
  media_types.Name file_type
FROM invoice_items inv
  JOIN tracks ON inv.TrackId = tracks.TrackId
  JOIN media_types ON tracks.MediaTypeId = media_types.MediaTypeId
  JOIN genres ON tracks.GenreId = genres.GenreId
  GROUP BY inv.TrackId
  ORDER BY total_track_sales DESC
