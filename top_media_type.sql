SELECT MediaName, TotalPlays
FROM (SELECT COUNT(Track.TrackId) AS TotalPlays, Track.Name AS TrackName, Artist.Name AS ArtistName, MediaType.Name AS MediaName
		FROM Album
		JOIN Artist ON Artist.ArtistId = Album.ArtistId
		JOIN Track ON Track.AlbumId = Album.AlbumId
		JOIN Invoice ON Invoice.InvoiceId = InvoiceLine.InvoiceId
		JOIN InvoiceLine ON Track.TrackId = InvoiceLine.TrackId
		JOIN MediaType ON MediaType.MediaTypeId = Track.MediaTypeId
		GROUP BY MediaName)
		ORDER BY TotalPlays 
		DESC LIMIT 1