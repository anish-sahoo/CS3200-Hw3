-- SELECT DISTINCT Name FROM tracks --3257

-- some sql to analyze the dataset
SELECT DISTINCT Name, SUM(MediaTypeId) media
FROM tracks
GROUP BY TrackId
ORDER BY media DESC