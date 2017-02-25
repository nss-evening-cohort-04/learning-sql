SELECT Track.Name AS "Track Name", Album.Title AS "Album", Genre.Name AS "Genre", MediaType.Name AS "Media Type" FROM Track
JOIN Album ON Album.AlbumId == Track.AlbumId
JOIN Genre ON Track.GenreId == Genre.GenreId
JOIN MediaType ON Track.MediaTypeId == MediaType.MediaTypeId
