#15. playlists_track_count.sql: Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resulant table.

SELECT 
	COUNT(TrackId) AS TotalNumberOfTracks, 
	x.PlaylistId AS PlaylistId, 
	Name AS PlaylistName 
FROM(
	SELECT PlaylistId, Name 
	FROM Playlist) 
AS X 
JOIN PlaylistTrack 
ON x.PlaylistId == PlaylistTrack.PlaylistId 
GROUP BY x.PlaylistId