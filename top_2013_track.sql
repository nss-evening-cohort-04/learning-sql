SELECT Name
FROM Track
JOIN
	(SELECT COUNT(TrackId) AS Hits, TrackId
	FROM InvoiceLine
	WHERE InvoiceId IN
		(SELECT InvoiceId
		FROM Invoice
		WHERE strftime('%Y',InvoiceDate) in ('2013'))
	GROUP BY Trackid
	ORDER BY Hits
	LIMIT 1) AS MaxHit
ON Track.TrackId == MaxHit.TrackId
	
