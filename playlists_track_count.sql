SELECT COUNT(PlaylistTrack.PlaylistId), Playlist.Name FROM PlaylistTrack
JOIN Playlist ON PlaylistTrack.PlaylistId == Playlist.PlaylistId
GROUP BY Playlist.PlaylistId

 