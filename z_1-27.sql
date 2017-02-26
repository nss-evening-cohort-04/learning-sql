#1. non_usa_customers.sql: Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.

SELECT CustomerId, FirstName || " " || LastName, Country 
FROM Customer 
WHERE Country != "USA"

#2. brazil_customers.sql: Provide a query only showing the Customers from Brazil.

SELECT 
	CustomerId, 
	FirstName || " " || LastName, 
	Country 
FROM Customer 
WHERE Country = "Brazil"

#3. brazil_customers_invoices.sql: Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.

SELECT 
	CUSTID.FirstName||" "||CUSTID.LastName, 
	CUSTID.InvoiceId,
	CUSTID.InvoiceDate, 
	CUSTID.BillingCountry 
FROM(
	SELECT * 
	FROM Customer 
	JOIN Invoice 
	ON Customer.CustomerId == Invoice.CustomerId) 
AS CUSTID 
WHERE Country == "Brazil"

#4. sales_agents.sql: Provide a query showing only the Employees who are Sales Agents.

SELECT * 
FROM Employee 
WHERE Title == "Sales Support Agent"

#5. unique_invoice_countries.sql: Provide a query showing a unique/distinct list of billing countries from the Invoice table.

SELECT DISTINCT BillingCountry 
FROM Invoice

#6. sales_agent_invoices.sql: Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.

SELECT 
	y.InvoiceId AS "Invoice Id", 
	y."FirstName:1"||" "|| y."LastName:1" AS "Employee Full Name" 
FROM(
	SELECT * 
	FROM(
		SELECT * 
		FROM Customer 
			JOIN Invoice 
			ON Customer.CustomerId == Invoice.CustomerId 
			Order By SupportRepId) 
		As x 
		JOIN Employee 
		Where x.SupportRepId == Employee.EmployeeId) 
	As Y

#7. invoice_totals.sql: Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.

SELECT 
	Total AS InvoiceTotal, 
	CustomerName, 
	BillingCountry AS Country, 
	EmployeeName AS SaleAgent  
FROM(
	SELECT 
		FirstName ||" "|| LastName AS CustomerName, 
		x.EmployeeName, 
		CustomerId 
	FROM(
		SELECT 
			EmployeeId AS "SupportRepId", 
			FirstName ||" "|| LastName AS "EmployeeName" 
		FROM Employee) 
		AS x 
	JOIN Customer 
	ON x.SupportRepId == Customer.SupportRepId) 
	AS y 
JOIN Invoice 
ON y.CustomerId == Invoice.CustomerId

#8. total_invoices_{year}.sql: How many Invoices were there in 2009 and 2011?

SELECT COUNT(*) 
FROM Invoice 
WHERE InvoiceDate 
LIKE "2009%" 
OR InvoiceDate 
LIKE "2011%"

#9. total_sales_{year}.sql: What are the respective total sales for each of those years?
# ***QUESTION*** - Can do them separately, but can you do that in one table?

SELECT COUNT(*) 
FROM Invoice 
WHERE InvoiceDate 
LIKE "2009%" 

SELECT COUNT(*) 
FROM Invoice 
WHERE InvoiceDate 
LIKE "2011%" 

#10. invoice_37_line_item_count.sql: Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.

SELECT COUNT(InvoiceLineId) 
FROM InvoiceLine 
LIKE "37"

#11. line_items_per_invoice.sql: Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice. HINT: GROUP BY

SELECT COUNT(InvoiceLineId) 
FROM InvoiceLine 
GROUP BY InvoiceId

#12. line_item_track.sql: Provide a query that includes the purchased track name with each invoice line item.

SELECT TrackId, InvoiceLineId 
FROM InvoiceLine 13

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

SELECT MAX(SumOfTotal), BillingCountry 
FROM(
	SELECT SUM(Total) As SumOfTotal, BillingCountry 
	FROM Invoice 
	GROUP BY BillingCountry) 
AS X

#24. top_2013_track.sql: Provide a query that shows the most purchased track of 2013.

SELECT MAX(y.TrackCount), y.TrackId 
FROM(
	SELECT COUNT(TrackId) AS TrackCount, TrackId 
	FROM(
		SELECT * 
		FROM Invoice 
		JOIN InvoiceLine 
		ON Invoice.InvoiceId == InvoiceLine.InvoiceId 
		WHERE InvoiceDate 
		LIKE "2013%") 
	AS X GROUP BY TrackId) 
AS Y

#25. top_5_tracks.sql: Provide a query that shows the top 5 most purchased tracks over all.

SELECT * 
FROM(
	SELECT COUNT(TrackId) AS TrackCount, TrackId 
	FROM(
		SELECT * 
		FROM Invoice 
		JOIN InvoiceLine 
		ON Invoice.InvoiceId == InvoiceLine.InvoiceId) 
	AS X 
	GROUP BY TrackId) 
ORDER BY TrackCount DESC LIMIT 5

#26. top_3_artists.sql: Provide a query that shows the top 3 best selling artists.

SELECT * 
FROM(
	SELECT COUNT(TrackId) AS TrackCount, ArtistId, Name 
	FROM(
		SELECT * 
		FROM(
			SELECT * 
			FROM(
				SELECT * 
				FROM(
					SELECT * 
					FROM Album 
					JOIN Artist 
					ON Album.ArtistId == Artist.ArtistId) 
				AS X 
				JOIN Track 
				ON x.AlbumId == Track.AlbumId) 
			AS Y 
			JOIN InvoiceLine 
			ON y.TrackId == InvoiceLine.TrackId) 
		AS Z) 
	GROUP BY ArtistID) 
ORDER BY TrackCount 
DESC LIMIT 3

#Iron Maiden, U2, Metallica

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

#1976 MPEG (the largest one), 146 protected AAC, 111 MPEG-4, 4 purchased AAC, 3 AAC
