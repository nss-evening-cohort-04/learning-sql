SELECT Track.Name, Artist.Name, COUNT(InvoiceLine.TrackId) AS TotalCountAllTime
FROM Invoice
JOIN InvoiceLine ON InvoiceLine.InvoiceId == Invoice.InvoiceId
JOIN Track ON Track.TrackId == InvoiceLine.TrackId
JOIN Album ON Track.AlbumId == Album.AlbumId
JOIN Artist ON Album.ArtistId == Artist.ArtistId
GROUP BY InvoiceLine.TrackId
ORDER BY TotalCountAllTime DESC
LIMIT 3