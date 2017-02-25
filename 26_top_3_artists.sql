/*26_top_3_artists.sql: Provide a query that shows the top 3 best selling artists.*/
SELECT Track.Name, Count(Track.Name) AS "Count"
FROM Invoice
JOIN InvoiceLine ON Invoice.InvoiceId == InvoiceLine.InvoiceId
JOIN Track ON InvoiceLine.TrackId == Track.TrackId
JOIN Album ON Track.AlbumId == Album.AlbumId
GROUP BY Track.Name
ORDER BY ""