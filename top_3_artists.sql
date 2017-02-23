SELECT Artist.Name, SUM(Invoice.Total) FROM Invoice
JOIN InvoiceLine on Invoice.InvoiceId == InvoiceLine.InvoiceId
JOIN Track on Track.TrackId == InvoiceLine.TrackId
JOIN Artist on Artist.ArtistId == Track.TrackId
GROUP BY Artist.ArtistId
ORDER BY sum(Invoice.Total) desc
LIMIT 3