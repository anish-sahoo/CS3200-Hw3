SELECT DISTINCT C.CustomerId, C.FirstName, C.LastName
FROM customers C
  JOIN invoices ON invoices.CustomerId = C.CustomerId
  JOIN invoice_items ON invoice_items.InvoiceId = invoices.InvoiceId
  JOIN tracks ON tracks.TrackId = invoice_items.TrackId
WHERE tracks.Milliseconds > (
  SELECT AVG(Milliseconds)
  FROM tracks
  WHERE Milliseconds <= 900000
);
-- Google Gemini explained how JOINs work in SQL, and gave me the code for the second half of the query.
-- I made some modifications to the query it generated

