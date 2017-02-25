SELECT COUNT(MediaType.Name) AS Top_SALE, MediaType.Name
FROM MediaType
JOIN Track
ON MediaType.MediaTypeId == Track.MediaTypeId
JOIN InvoiceLine
ON Track.TrackId == InvoiceLine.TrackId	
GROUP BY MediaType.Name
ORDER BY Top_SALE DESC
LIMIT 1
