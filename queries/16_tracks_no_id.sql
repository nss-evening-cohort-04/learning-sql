/*Provide a query that shows all the Tracks, but displays no IDs. The result should include the Album name, Media type and Genre.*/
SELECT Track.Name AS "Track Name", Album.Title AS "Album Name", MediaType.Name AS "Media Type", Genre.Name AS "Genre"
FROM Track
JOIN Album ON Track.AlbumId == Album.AlbumId
JOIN MediaType ON Track.MediaTypeId == MediaType.MediaTypeId
JOIN Genre ON Track.GenreId == Genre.GenreId
ORDER BY Album.Title