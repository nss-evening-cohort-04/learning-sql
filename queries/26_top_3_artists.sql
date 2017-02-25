/*26_top_3_artists.sql: Provide a query that shows the top 3 best selling artists.*/
SELECT "Artist Name", "Songs Sold"
FROM
(SELECT Artist.Name AS "Artist Name", Count(Track.TrackId) AS "Songs Sold"
FROM InvoiceLine
JOIN Track ON InvoiceLine.TrackId == Track.TrackId
JOIN Album ON Track.AlbumId == Album.AlbumId
JOIN Artist ON Album.ArtistId == Artist.ArtistId
GROUP BY "Artist Name"
ORDER BY "Songs Sold" DESC
LIMIT 3)