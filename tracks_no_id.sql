select Track.Name AS 'Track Name', Album.Title AS 'Album Title', MediaType.Name AS 'Media Type', Genre.Name AS Genre
from Track
join Album
on Track.AlbumId == Album.AlbumId
join MediaType
on Track.MediaTypeId == MediaType.MediaTypeId
join Genre
on Track.GenreId == Genre.GenreId
