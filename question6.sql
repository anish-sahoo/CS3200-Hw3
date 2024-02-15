-- goal: find the most popular tracks sold, total value they sold for, and the most popular media type of those tracks


SELECT DISTINCT *
FROM invoice_item I
  JOIN tracks ON tracks.TrackId = I.TrackId
GROUP BY SUM(UnitPrice)