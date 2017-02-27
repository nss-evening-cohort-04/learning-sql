#25. top_5_tracks.sql: Provide a query that shows the top 5 most purchased tracks over all.

SELECT * 
FROM(
	SELECT COUNT(TrackId) AS TrackCount, TrackId 
	FROM(
		SELECT * 
		FROM Invoice 
		JOIN InvoiceLine 
		ON Invoice.InvoiceId == InvoiceLine.InvoiceId) 
	AS X 
	GROUP BY TrackId) 
ORDER BY TrackCount DESC LIMIT 5