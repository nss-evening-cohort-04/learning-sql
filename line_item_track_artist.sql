SELECT InvoiceLine.*, Track.Name AS "Track Name", Artist.Name AS "Artist Name" FROM InvoiceLine
JOIN Track ON Track.TrackId == InvoiceLine.TrackId
JOIN Album On Album.AlbumId == Track.AlbumId
JOIN Artist On Album.ArtistId == Artist.ArtistId
