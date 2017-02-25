SELECT *
FROM (SELECT COUNT(Album.ArtistId) AS TotalSales, Track.Name AS TrackName, Artist.Name AS ArtistName
		FROM Album
		JOIN Artist ON Artist.ArtistId = Album.ArtistId
		JOIN Track ON Track.AlbumId = Album.AlbumId
		JOIN Invoice ON Invoice.InvoiceId = InvoiceLine.InvoiceId
		JOIN InvoiceLine ON Track.TrackId = InvoiceLine.TrackId
		GROUP BY ArtistName)
		ORDER BY TotalSales 
		DESC LIMIT 3