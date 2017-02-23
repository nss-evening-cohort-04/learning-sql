SELECT MT.Name, SUM(Invoice.Total) FROM Invoice
JOIN InvoiceLine on Invoice.InvoiceId == InvoiceLine.InvoiceId
JOIN Track on Track.TrackId == InvoiceLine.TrackId
JOIN MediaType MT on MT.MediaTypeID = Track.MediaTypeID
GROUP BY MT.MediaTypeId
ORDER BY sum(Invoice.Total) desc
LIMIT 5