SELECT Track.TrackId, Track.Name, COUNT(InvoiceLine.TrackId) AS "TotalCount" FROM Invoice
JOIN InvoiceLine ON Invoice.InvoiceId == InvoiceLine.InvoiceId
JOIN Track ON Track.TrackId == InvoiceLine.TrackId
GROUP BY InvoiceLine.TrackId
ORDER BY TotalCount DESC
LIMIT 5