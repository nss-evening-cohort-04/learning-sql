SELECT Track.Name, Album.Title, MediaType.Name, Genre.Name  FROM Track
JOIN MediaType ON Track.MediaTypeId == MediaType.MediaTypeId
JOIN Album ON Track.AlbumId == Album.AlbumId
JOIN Genre ON Track.GenreId == Genre.GenreId

 