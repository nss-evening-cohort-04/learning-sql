#27. top_media_type.sql: Provide a query that shows the most purchased Media Type.

SELECT * 
FROM(
	SELECT COUNT(MediaTypeId) AS TopMedia, Name 
	FROM(
		SELECT * 
		FROM(
			SELECT * 
			FROM MediaType 
			JOIN Track 
			ON MediaType. MediaTypeId == Track.MediaTypeId) 
		AS X 
		JOIN InvoiceLine 
		ON x.TrackId == InvoiceLine.TrackId) 
	AS Y 
	GROUP BY MediaTypeId) 
ORDER BY TopMedia 
DESC LIMIT 1 

#1976 MPEG (the largest one), 146 protected AAC, 
#111 MPEG-4, 4 purchased AAC, 3 AAC