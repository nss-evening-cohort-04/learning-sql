SELECT Track.Name AS TrackName, MediaType.Name AS MediaName, Genre.Name AS GenreName
FROM Track
JOIN PlaylistTrack ON PlaylistTrack.TrackId = Track.TrackId
JOIN Playlist ON Playlist.PlaylistId = PlaylistTrack.PlaylistId
JOIN MediaType ON Track.MediaTypeId = MediaType.MediaTypeId
JOIN Genre ON Genre.GenreId = Track.GenreId