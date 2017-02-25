SELECT Playlist.PlaylistId, Playlist.Name, Count(*)
FROM PlaylistTrack
JOIN Playlist ON Playlist.PlaylistId = PlaylistTrack.PlaylistId
GROUP BY Playlist.PlaylistId