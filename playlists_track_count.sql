SELECT distinct
  p.PlaylistId,
  COUNT(distinct plt.TrackId) as Tracks
FROM Playlist as p
JOIN PlaylistTrack as plt
  ON p.PlaylistId = plt.PlayListId
GROUP BY
  p.PlaylistId;