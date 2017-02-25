SELECT Name AS 'Best Selling Artist'
FROM Artist,	
	(SELECT COUNT(Album.ArtistId) AS Popularity, AlBum.ArtistId
	FROM Album
	INNER JOIN Track
	ON Album.AlbumId == Track.AlbumId
		INNER JOIN InvoiceLine
		ON Track.TrackId ==  InvoiceLine.TrackId
	GROUP BY Album.ArtistId
	ORDER BY Popularity DESC
	LIMIT 3) AS a
WHERE Artist.ArtistId == a.ArtistId

