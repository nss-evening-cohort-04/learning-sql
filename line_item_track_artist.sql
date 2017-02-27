SELECT distinct
  at.Name,
  t.Name,
  i.*
FROM InvoiceLine as i
JOIN Track as t
  ON i.TrackId = t.TrackId
JOIN Album as a
  ON t.AlbumId = a.AlbumId
JOIN Artist at
  ON a.ArtistId = at.ArtistId;