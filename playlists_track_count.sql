select P.Name, count(TrackID) from PlaylistTrack PT
JOIN Playlist P on P.PlaylistId = PT.PlaylistId
GROUP BY P.Name