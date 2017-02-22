/*non_usa_customers.sql: Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.*/
SELECT
  FirstName || " " || LastName as FullName,
  CustomerId,
  Country
FROM Customer
WHERE Country <> 'USA';

/*brazil_customers.sql: Provide a query only showing the Customers from Brazil.*/
SELECT *
FROM Customer
WHERE Country = 'Brazil';

/*brazil_customers_invoices.sql: Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.*/
SELECT distinct
  FirstName || " " || LastName as CustomerFullName,
  InvoiceId,
  InvoiceDate,
  BillingCountry
FROM Customer as c
JOIN Invoice as i
  ON c.CustomerId = i.InvoiceId
WHERE Country = 'Brazil';

/*sales_agents.sql: Provide a query showing only the Employees who are Sales Agents.*/
SELECT *
FROM Employee
WHERE Title = 'Sales Support Agent';

/*unique_invoice_countries.sql: Provide a query showing a unique/distinct list of billing countries from the Invoice table.*/
SELECT distinct
  BillingCountry
FROM Invoice
ORDER BY
  BillingCountry asc;

/*sales_agent_invoices.sql: Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.*/
SELECT distinct
  e.FirstName || " " || e.LastName as EmployeeName,
  i.*
FROM Invoice as i
JOIN Customer as c
  ON i.CustomerId = c.CustomerId
JOIN Employee as e
  ON c.SupportRepId = e.EmployeeId;


/*invoice_totals.sql: Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.*/
SELECT distinct
  c.FIrstName || " " || c.LastName as CustomerFullName,
  BillingCountry,
  e.FirstName || " " || e.LastName as SalesAgentName,
  SUM(i.Total)  as InvoiceTotal
FROM Employee as e
JOIN Customer as c
  ON e.EmployeeId = c.SupportRepId
JOIN Invoice as i
  ON c.CustomerId = i.CustomerId
GROUP BY
  c.FIrstName || " " || c.LastName,
  BillingCountry,
  e.FirstName || " " || e.LastName;

/*total_invoices_{year}.sql: How many Invoices were there in 2009 and 2011?*/
SELECT distinct
  strftime('%Y',InvoiceDate) as InvoiceYear,
  COUNT(distinct InvoiceId) as InvoicesCount
FROM Invoice
WHERE strftime('%Y',InvoiceDate) IN ('2009','2011')
GROUP BY
  strftime('%Y',InvoiceDate);

/*total_sales_{year}.sql: What are the respective total sales for each of those years?*/
SELECT distinct
  strftime('%Y',InvoiceDate) as InvoiceYear,
  SUM(Total) as TotalSales
FROM Invoice
WHERE strftime('%Y',InvoiceDate) IN ('2009','2011')
GROUP BY
  strftime('%Y',InvoiceDate);

/*invoice_37_line_item_count.sql: Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.*/
SELECT
  COUNT(distinct InvoiceLineId) as InvoiceLines
FROM InvoiceLine
WHERE InvoiceId = '37';

/*line_items_per_invoice.sql: Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice. HINT: GROUP BY*/
SELECT distinct
  InvoiceId,
  COUNT(distinct InvoiceLineId) as InvoiceLines
FROM InvoiceLine
GROUP BY
  InvoiceId;

/*line_item_track.sql: Provide a query that includes the purchased track name with each invoice line item.*/
SELECT distinct
  t.Name,
  i.*
FROM InvoiceLine as i
JOIN Track as t
  ON i.TrackId = t.TrackId;

/*line_item_track_artist.sql: Provide a query that includes the purchased track name AND artist name with each invoice line item.*/
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

/*country_invoices.sql: Provide a query that shows the # of invoices per country. HINT: GROUP BY*/
SELECT distinct
  BillingCountry,
  COUNT(distinct InvoiceId) as TotalInvoices
FROM Invoice
GROUP BY
  BillingCountry;

/*playlists_track_count.sql: Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resulant table.*/
SELECT distinct
  p.PlaylistId,
  COUNT(distinct plt.TrackId) as Tracks
FROM Playlist as p
JOIN PlaylistTrack as plt
  ON p.PlaylistId = plt.PlayListId
GROUP BY
  p.PlaylistId;

/*tracks_no_id.sql: Provide a query that shows all the Tracks, but displays no IDs. The result should include the Album name, Media type and Genre.*/
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

/*invoices_line_item_count.sql: Provide a query that shows all Invoices but includes the # of invoice line items.*/
SELECT distinct
  i.InvoiceId,
  i.CustomerId,
  i.InvoiceDate,
  i.BillingAddress,
  i.BillingCity,
  i.BillingState,
  i.BillingCountry,
  i.BillingPostalCode,
  i.Total,
  COUNT(distinct il.InvoiceLineId) as InvoiceLineCount
FROM Invoice as i
JOIN InvoiceLine as il
  ON i.InvoiceId = il.InvoiceId
GROUP BY
  i.InvoiceId,
  i.CustomerId,
  i.InvoiceDate,
  i.BillingAddress,
  i.BillingCity,
  i.BillingState,
  i.BillingCountry,
  i.BillingPostalCode,
  i.Total;

/*sales_agent_total_sales.sql: Provide a query that shows total sales made by each sales agent.*/
SELECT distinct
  e.FirstName || " " || e.LastName as EmployeeName,
  SUM(i.Total) as InvoiceTotal
FROM Invoice as i
JOIN Customer as c
  ON i.CustomerId = c.CustomerId
JOIN Employee as e
  ON c.SupportRepId = e.EmployeeId
WHERE e.Title = 'Sales Support Agent'
GROUP BY
  e.FirstName || " " || e.LastName;

/*top_2009_agent.sql: Which sales agent made the most in sales in 2009?*/
SELECT distinct
  e.FirstName || " " || e.LastName as EmployeeName,
  SUM(i.Total) as InvoiceTotal
FROM Invoice as i
JOIN Customer as c
  ON i.CustomerId = c.CustomerId
JOIN Employee as e
  ON c.SupportRepId = e.EmployeeId
WHERE e.Title = 'Sales Support Agent'
   AND strftime('%Y',InvoiceDate) IN ('2009')
GROUP BY
  e.FirstName || " " || e.LastName
ORDER BY
  SUM(i.Total) desc
LIMIT 1;

/*top_agent.sql: Which sales agent made the most in sales over all?*/
SELECT distinct
  e.FirstName || " " || e.LastName as EmployeeName,
  SUM(i.Total) as InvoiceTotal
FROM Invoice as i
JOIN Customer as c
  ON i.CustomerId = c.CustomerId
JOIN Employee as e
  ON c.SupportRepId = e.EmployeeId
WHERE e.Title = 'Sales Support Agent'
GROUP BY
  e.FirstName || " " || e.LastName
ORDER BY
  SUM(i.Total) desc
LIMIT 1;

/*sales_agent_customer_count.sql: Provide a query that shows the count of customers assigned to each sales agent.*/
SELECT distinct
  e.FirstName || " " || e.LastName as EmployeeName,
  COUNT(distinct CustomerId) as AssignedCustomers
FROM Customer as c
JOIN Employee as e
  ON c.SupportRepId = e.EmployeeId
WHERE e.Title = 'Sales Support Agent'
GROUP BY
  e.FirstName || " " || e.LastName;


/*sales_per_country.sql: Provide a query that shows the total sales per country.*/
SELECT distinct
  c.Country,
  SUM(i.Total) as TotalSales
FROM Invoice as i
JOIN Customer as c
  ON i.CustomerId = c.CustomerId
GROUP BY
  c.Country
ORDER BY
  c.Country asc;

/*top_country.sql: Which country's customers spent the most?*/
SELECT distinct
  c.Country,
  SUM(i.Total) as TotalSales
FROM Invoice as i
JOIN Customer as c
  ON i.CustomerId = c.CustomerId
GROUP BY
  c.Country
ORDER BY
  SUM(i.Total) desc
LIMIT 1;

/*top_2013_track.sql: Provide a query that shows the most purchased track of 2013.*/
SELECT distinct
  t.Name as TrackName,
  COUNT(distinct i.InvoiceId) as NumberOfSales
FROM Invoice as i
JOIN InvoiceLine il
  ON i.InvoiceId = il.InvoiceId
JOIN Track as t
  ON il.TrackId = t.TrackId
 AND strftime('%Y',InvoiceDate) IN ('2013')
GROUP BY
  t.Name
ORDER BY
  COUNT(distinct i.InvoiceId) desc
LIMIT 1;

/*top_5_tracks.sql: Provide a query that shows the top 5 most purchased tracks over all.*/
SELECT distinct
  t.Name as TrackName,
  COUNT(distinct i.InvoiceId) as NumberOfSales
FROM Invoice as i
JOIN InvoiceLine il
  ON i.InvoiceId = il.InvoiceId
JOIN Track as t
  ON il.TrackId = t.TrackId
GROUP BY
  t.Name
ORDER BY
  COUNT(distinct i.InvoiceId) desc
LIMIT 5;

/*top_3_artists.sql: Provide a query that shows the top 3 best selling artists.*/
SELECT distinct
  art.Name as ArtistName,
  COUNT(distinct i.InvoiceId) as NumberOfSales
FROM Invoice as i
JOIN InvoiceLine il
  ON i.InvoiceId = il.InvoiceId
JOIN Track as t
  ON il.TrackId = t.TrackId
JOIN Album as a
  ON t.AlbumId = a.Albumid
JOIN Artist as art
  ON a.ArtistId = art.ArtistId
GROUP BY
  art.Name
ORDER BY
  COUNT(distinct i.InvoiceId) desc
LIMIT 3;

/*top_media_type.sql: Provide a query that shows the most purchased Media Type.*/
SELECT distinct
  mt.Name as MediaType,
  COUNT(distinct i.InvoiceId) as NumberOfSales
FROM Invoice as i
JOIN InvoiceLine il
  ON i.InvoiceId = il.InvoiceId
JOIN Track as t
  ON il.TrackId = t.TrackId
JOIN MediaType mt
  ON t.MediaTypeId = mt.MediaTypeId
GROUP BY
  mt.Name
ORDER BY
  COUNT(distinct i.InvoiceId) desc
LIMIT 1;