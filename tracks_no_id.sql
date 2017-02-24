select  Album.Title, MediaType.Name, Genre.Name
from Track
	join Album
		on Album.AlbumId == Track.AlbumId
	join MediaType
		on MediaType.MediaTypeId == Track.MediaTypeId
	join Genre
		on Genre.GenreId == Track.GenreId