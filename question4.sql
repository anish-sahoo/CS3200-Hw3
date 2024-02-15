SELECT DISTINCT 
  C.CustomerId,
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
-- Google Gemini (free version) explained how JOINs work in SQL, and gave some code for the second half of the query.
-- I then made some modifications and added some more code to it.

-- Prompt:
-- In this assignment you will practice the SQL skills developed in the course. For this, we will be using the sample SQLITE database found on https://www.sqlitetutorial.net/sqlite-sample-database/
-- Download the database, and then, complete the following tasks:
-- Write a query that lists all the customers that listen to longer-than-average tracks, excluding the tracks that are longer than 15 minutes.