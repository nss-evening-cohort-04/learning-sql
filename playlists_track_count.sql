SELECT Playlist.PlaylistId, Playlist.Name, COUNT(PlaylistTrack.PlaylistId) AS "Number of Tracks" FROM Playlist
JOIN PlaylistTrack ON PlaylistTrack.PlaylistId == Playlist.PlaylistId
GROUP BY Playlist.PlaylistId
