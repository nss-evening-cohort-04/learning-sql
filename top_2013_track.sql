SELECT Track.Name, COUNT(InvoiceLine.TrackId) AS TotalCount
FROM Invoice
JOIN InvoiceLine ON InvoiceLine.InvoiceId == Invoice.InvoiceId
JOIN Track ON Track.TrackId == InvoiceLine.TrackId
WHERE strftime('%Y', InvoiceDate) == "2013"
GROUP BY InvoiceLine.TrackId
ORDER BY TotalCount DESC
LIMIT 1