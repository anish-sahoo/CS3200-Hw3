-- goal: find the top 10 most popular tracks sold, total value they sold for, and the most popular media type of those tracks


-- Step 1: find the top 10 most popular tracks sold
SELECT
  inv.TrackId,
  SUM(inv.UnitPrice) total_track_sales -- you can also replace this with AVG, and it should still work
FROM invoice_items inv 
  JOIN (SELECT DISTINCT Name, TrackId FROM tracks) arr ON arr.TrackId = invoice_items.TrackId
  GROUP BY TrackId
  ORDER BY total_track_sales DESC
