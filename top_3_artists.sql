#26. top_3_artists.sql: Provide a query that shows the top 3 best selling artists.

SELECT * 
FROM(
	SELECT COUNT(TrackId) AS TrackCount, ArtistId, Name 
	FROM(
		SELECT * 
		FROM(
			SELECT * 
			FROM(
				SELECT * 
				FROM(
					SELECT * 
					FROM Album 
					JOIN Artist 
					ON Album.ArtistId == Artist.ArtistId) 
				AS X 
				JOIN Track 
				ON x.AlbumId == Track.AlbumId) 
			AS Y 
			JOIN InvoiceLine 
			ON y.TrackId == InvoiceLine.TrackId) 
		AS Z) 
	GROUP BY ArtistID) 
ORDER BY TrackCount 
DESC LIMIT 3

#Iron Maiden, U2, Metallica