SELECT Track.Name, MediaType.Name, COUNT(InvoiceLine.TrackId) AS TotalCountAllTime
FROM Invoice
JOIN InvoiceLine ON InvoiceLine.InvoiceId == Invoice.InvoiceId
JOIN Track ON Track.TrackId == InvoiceLine.TrackId
JOIN MediaType ON Track.MediaTypeId == MediaType.MediaTypeId
GROUP BY InvoiceLine.TrackId
ORDER BY TotalCountAllTime DESC
LIMIT 1