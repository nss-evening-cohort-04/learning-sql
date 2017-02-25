SELECT MediaType.Name, MediaType.MediaTypeId, SUM(InvoiceLine.UnitPrice) AS "Sales" FROM MediaType
JOIN Track ON MediaType.MediaTypeId == Track.MediaTypeId
JOIN InvoiceLine ON InvoiceLine.TrackId == Track.TrackId
GROUP BY MediaType.MediaTypeId
ORDER BY Sales DESC
LIMIT 1