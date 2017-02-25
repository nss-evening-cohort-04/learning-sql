SELECT Artist.Name, tAlbum.*
FROM Artist
JOIN (SELECT ArtistId, tTrack.* 
		FROM Album 
		JOIN (SELECT Track.Name, Track.AlbumId, InvoiceLine.* 
				FROM InvoiceLine 
				JOIN Track 
				ON  InvoiceLine.TrackId == Track.TrackId) AS tTrack
		ON Album.AlbumId == tTrack.AlbumId) AS tAlbum
ON Artist.ArtistId == tAlbum.ArtistId