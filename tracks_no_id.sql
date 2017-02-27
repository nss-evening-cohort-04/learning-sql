#16. tracks_no_id.sql: Provide a query that shows all the Tracks, but displays no IDs. The result should include the Album name, Media type and Genre.

SELECT 
	y.Title AS "Album Name",
	Genre.Name AS "Genre Name", 
	y."Name:1" AS "Media Type"
FROM
	(SELECT * 
	FROM
		(SELECT * 
		FROM Track 
		JOIN Album 
		ON Track.AlbumId == Album.AlbumId 
		GROUP BY TrackId)
	AS x 
	JOIN MediaType 
	ON MediaType.MediaTypeId == x.MediaTypeId) 
AS Y 
JOIN Genre 
ON y.GenreId == Genre.GenreId