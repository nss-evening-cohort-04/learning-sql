SELECT Name
FROM Track
JOIN
	(SELECT COUNT(TrackId) AS Hits, TrackId
	FROM InvoiceLine
	GROUP BY Trackid
	ORDER BY Hits
	LIMIT 5) AS TopHit
ON Track.TrackId == TopHit.TrackId
	
