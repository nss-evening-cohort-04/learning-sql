SELECT Track.Name, COUNT(InvoiceLine.TrackId) AS TotalCountAllTime
FROM Invoice
JOIN InvoiceLine ON InvoiceLine.InvoiceId == Invoice.InvoiceId
JOIN Track ON Track.TrackId == InvoiceLine.TrackId
GROUP BY InvoiceLine.TrackId
ORDER BY TotalCountAllTime DESC
LIMIT 5