SELECT COUNT(TrackId) AS 'Total Track', Name AS 'Playlist Name'
FROM Playlist
JOIN PlaylistTrack
ON Playlist.PlaylistId == PlaylistTrack.PlaylistId
GROUP BY Name