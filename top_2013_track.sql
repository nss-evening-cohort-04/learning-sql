#24. top_2013_track.sql: Provide a query that shows the most purchased track of 2013.

SELECT MAX(y.TrackCount), y.TrackId 
FROM(
	SELECT COUNT(TrackId) AS TrackCount, TrackId 
	FROM(
		SELECT * 
		FROM Invoice 
		JOIN InvoiceLine 
		ON Invoice.InvoiceId == InvoiceLine.InvoiceId 
		WHERE InvoiceDate 
		LIKE "2013%") 
	AS X GROUP BY TrackId) 
AS Y