SELECT T.Name as TrackName, A.Title as AlbumTitle, MT.Name as MediaType, G.Name as GenreName from Track T
JOIN Album A on A.AlbumID = T.AlbumID
JOIN MediaType MT on MT.MediaTypeId = T.MediaTypeId
JOIN Genre G on G.GenreID = T.GenreId
