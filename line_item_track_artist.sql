#13. line_item_track_artist.sql: Provide a query that includes the purchased track name AND artist name with each invoice line item.

SELECT 
	z.InvoiceLineId AS InvoiceLineId, 
	z.TrackName AS TrackName, 
	Artist.Name AS ArtistName 
FROM(
	SELECT 
		y.InvoiceLineId AS InvoiceLineId, 
		y.TrackName AS TrackName, 
		Album.ArtistId AS ArtistId, 
		Album.AlbumId 
	FROM(
		SELECT 
			InvoiceLineId, 
			Track.Name AS TrackName, 
			Track.AlbumId 
		FROM(
			SELECT 
				InvoiceLineId, 
				TrackId 
				FROM InvoiceLine) 
			AS X 
			JOIN Track 
			ON x.TrackId == Track.TrackId) 
		AS Y 
		JOIN Album 
		ON y.AlbumId == Album.AlbumId) 
	AS Z 
	JOIN Artist 
	ON z.ArtistId== Artist.ArtistId