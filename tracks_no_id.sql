SELECT distinct
  t.Name as TrackName,
  t.AlbumId,
  a.Title as AlbumName,
  t.MediaTypeId,
  mt.Name as MediaType,
  t.GenreId,
  g.Name as GenreName,
  t.Composer,
  t.Milliseconds,
  t.Bytes,
  t.UnitPrice
FROM Track as t
LEFT JOIN Album as a
  ON t.AlbumId = a.AlbumId
LEFT JOIN MediaType mt
  ON t.MediaTypeId = mt.MediaTypeId
LEFT JOIN Genre g
  ON t.GenreId = g.GenreId;