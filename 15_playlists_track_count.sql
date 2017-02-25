/*Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resulant table.*/
SELECT Playlist.Name AS "Playlist Name", Count(PlaylistTrack.TrackId) AS "Number of Songs"
FROM Playlist
JOIN PlaylistTrack ON Playlist.PlaylistId == PlaylistTrack.PlaylistId
GROUP BY Playlist.Name