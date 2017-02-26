#Skipped 9

#13. line_item_track_artist.sql: Provide a query that includes the purchased track name AND artist name with each invoice line item.

SELECT z.InvoiceLineId AS InvoiceLineId, z.TrackName AS TrackName, Artist.Name AS ArtistName 
FROM
	(SELECT y.InvoiceLineId AS InvoiceLineId, y.TrackName AS TrackName, Album.ArtistId AS ArtistId, Album.AlbumId 
	FROM
		(SELECT InvoiceLineId, Track.Name AS TrackName, Track.AlbumId 
		FROM
			(SELECT InvoiceLineId, TrackId FROM InvoiceLine) 
			AS X JOIN Track ON x.TrackId == Track.TrackId) 
		AS Y JOIN Album ON y.AlbumId == Album.AlbumId) 
	AS Z JOIN Artist ON z.ArtistId== Artist.ArtistId

#14. country_invoices.sql: Provide a query that shows the # of invoices per country. HINT: GROUP BY

SELECT COUNT(InvoiceId), BillingCountry 
FROM Invoice 
GROUP BY BillingCountry

#15. playlists_track_count.sql: Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resulant table.

SELECT COUNT(TrackId) AS TotalNumberOfTracks, x.PlaylistId AS PlaylistId, Name AS PlaylistName 
FROM(
	SELECT PlaylistId, Name FROM Playlist
	) AS X 
JOIN PlaylistTrack 
ON x.PlaylistId == PlaylistTrack.PlaylistId 
GROUP BY x.PlaylistId

#16. tracks_no_id.sql: Provide a query that shows all the Tracks, but displays no IDs. The result should include the Album name, Media type and Genre.

SELECT y.Title AS "Album Name",Genre.Name AS "Genre Name", y."Name:1" AS "Media Type"
FROM
	(SELECT * 
	FROM
		(SELECT * 
		FROM Track 
		JOIN Album 
		ON Track.AlbumId == Album.AlbumId 
		GROUP BY TrackId)
	AS x 
	JOIN MediaType 
	ON MediaType.MediaTypeId == x.MediaTypeId) 
AS Y 
JOIN Genre 
SON y.GenreId == Genre.GenreId


#17. invoices_line_item_count.sql: Provide a query that shows all Invoices but includes the # of invoice line items.

SELECT COUNT(InvoiceLineId) AS NumberOfInvoiceLineItems, Invoice.InvoiceId AS Invoice 
FROM InvoiceLine 
JOIN Invoice ON Invoice.InvoiceId ==  InvoiceLine.InvoiceId 
GROUP BY Invoice.InvoiceId

#18. sales_agent_total_sales.sql: Provide a query that shows total sales made by each sales agent.

SELECT FirstName ||"  "|| LastName AS SalesAgentName, SUM(Total) AS TotalSales 
FROM(
	SELECT * FROM(
		SELECT CustomerID, SupportRepId AS EmployeeId FROM Customer) 
	AS x 
	JOIN Employee ON x.EmployeeId == Employee.EmployeeId) 
AS Y 
JOIN Invoice ON Invoice.CustomerId == y.CustomerId 
GROUP BY EmployeeId

#19. top_2009_agent.sql: Which sales agent made the most in sales in 2009?
#Hint: Use the MAX function on a subquery.

SELECT MAX("SUM(Total)"), FullName 
FROM(
	SELECT SUM(Total),FirstName||" "||LastName AS FullName 
	FROM(
		SELECT * 
		FROM(
			SELECT CustomerID, SupportRepId AS EmployeeId 
			FROM Customer) 
		AS x JOIN Employee ON x.EmployeeId == Employee.EmployeeId) 
	AS Y JOIN Invoice ON Invoice.CustomerId == y.CustomerId 
	WHERE Invoice.InvoiceDate 
	LIKE "2009%" 
	GROUP BY EmployeeId)

#20. top_agent.sql: Which sales agent made the most in sales over all?

SELECT MAX("SUM(Total)"), FullName 
FROM(
	SELECT SUM(Total),FirstName||" "||LastName AS FullName 
	FROM(
		SELECT * 
		FROM(
			SELECT CustomerID, SupportRepId AS EmployeeId FROM Customer) 
		AS x JOIN Employee ON x.EmployeeId == Employee.EmployeeId) 
	AS Y JOIN Invoice ON Invoice.CustomerId == y.CustomerId 
	GROUP BY EmployeeId)

#21. sales_agent_customer_count.sql: Provide a query that shows the count of customers assigned to each sales agent.

SELECT  FirstName||" "||LastName AS FullName, COUNT(CustomerId) 
FROM(
	SELECT * 
	FROM(
		SELECT CustomerID, SupportRepId AS EmployeeId 
		FROM Customer) 
	AS x JOIN Employee ON x.EmployeeId == Employee.EmployeeId) 
AS Y GROUP BY EmployeeId

#22. sales_per_country.sql: Provide a query that shows the total sales per country.

SELECT SUM(Total) As SumOfTotal, BillingCountry 
FROM Invoice 
GROUP BY BillingCountry

#23. top_country.sql: Which country's customers spent the most?



#24. top_2013_track.sql: Provide a query that shows the most purchased track of 2013.



#25. top_5_tracks.sql: Provide a query that shows the top 5 most purchased tracks over all.



#26. top_3_artists.sql: Provide a query that shows the top 3 best selling artists.



#27. top_media_type.sql: Provide a query that shows the most purchased Media Type.