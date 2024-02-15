-- goal: find the top 10 most popular tracks sold, total value they sold for, and the most popular media type of those tracks

SELECT
  inv.TrackId track_id,
  tracks.Name track_name,
  SUM(inv.Quantity) total_amount_sold,
  SUM(inv.UnitPrice) total_income_from_track,
  genres.Name genre,
  media_types.Name file_type
FROM invoice_items inv
  JOIN tracks ON inv.TrackId = tracks.TrackId
  JOIN media_types ON tracks.MediaTypeId = media_types.MediaTypeId
  JOIN genres ON tracks.GenreId = genres.GenreId
  GROUP BY inv.TrackId
  ORDER BY total_amount_sold DESC
