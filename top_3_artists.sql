SELECT Artist.Name, Artist.ArtistID, SUM(InvoiceLine.UnitPrice) AS "Sales" FROM Artist
JOIN Album ON Artist.ArtistId == Album.ArtistId
JOIN Track ON Album.AlbumId == Track.AlbumId
JOIN InvoiceLine ON Track.TrackId == InvoiceLine.TrackId
GROUP BY Artist.ArtistId
ORDER BY Sales DESC
LIMIT 3