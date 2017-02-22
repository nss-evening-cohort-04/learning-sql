# Learning SQL Through Doing

## Installation of SQLite (if needed)

To get started, type the following command to check if you already have SQLite installed.

```bash
$sqlite3
```

And you should see:

```
SQLite version 3.7.15.2 2014-08-15 11:53:05
Enter ".help" for instructions
Enter SQL statements terminated with a ";"
sqlite>
```

If you do not see above result, then it means you do not have SQLite installed on your machine. Go to [SQLite Download page](http://www.sqlite.org/download.html) and download the precompiled binaries for your machine.

### For Windows

You will need to download `sqlite-shell-win32-*.zip` and `sqlite-dll-win32-*.zip` zipped files.

Create a folder `C:\>sqlite` and unzip the files in this folder which will give you `sqlite3.def`, `sqlite3.dll` and `sqlite3.exe` files.

Add `C:\>sqlite` to your [PATH environment variable](http://dustindavis.me/update-windows-path-without-rebooting/) and finally go to the command prompt and issue `sqlite3` command.

### For Mac

First, try to install via Homebrew:

```
brew install sqlite3
```

If not, download the package from above. After downloading the files, follow these steps:

```
$tar -xvzf sqlite-autoconf-3071502.tar.gz
$cd sqlite-autoconf-3071502
$./configure --prefix=/usr/local
$make
$make install
```

## Downloading the Database Files

Click the big download button from the [Chinook Database](http://chinookdatabase.codeplex.com/) site. Know which directory that it's being downloaded to.

Once the download is complete, you can open Window Explorer or Mac Finder and just double click on the archive to extract it. Once extracted, open a terminal window and go to the directory where the files exist.

## Install SQLite Management Tool

You have a couple options.

### Firefox Add On

This will work on any system, and you need to have the Firefox browser installed.

[SQLite Manager Firefox add-on](https://addons.mozilla.org/en-US/firefox/addon/sqlite-manager/)

### OSX or Windows: SQLite DB Browser

Install [DB Browser for SQLite](http://sqlitebrowser.org/), which is a free tool to explore a SQLite database and execute queries on the data.

## Getting the Database

1. Create a directory for your work.

    ```
    mkdir ~/workspace/chinook
    ```
1. Move the SQLite database file from the archive to that directory.

    ```
    cp Chinook_Sqlite.sqlite ~/workspace/chinook
    ```

## Instructions

1. Fork this repo.
1. If you are using the Firefox Add On, and you have trouble opening it once it has been installed, try opening Firefox, selecting "customize" at the bottom of the hamberger menu at the top right of the page. You can then drag SQLite Manager onto the toolbar where it will be easily accessible.
1. Go ahead and click around a little bit to familarize yourself with the database
1. When you're ready to start the exercise, click the tab labeled "Execute SQL", type in your query and run it.
1. If your query is correct - meaning it returns the data requested - copy and the SQL statement and paste it into the corresponding file for the exercise (_see below_). If your query doesn't return the expected results, try try again.

For each of the following exercises, provide the appropriate query. Yes, even the ones that are expressed in the form of questions. Everything from class and the [Sqlite Documentation](http://www.sqlite.org/) is fair game.

1. `non_usa_customers.sql`: Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
answer: SELECT CustomerId as "ID",Country,FirstName ||' '|| LastName AS "FullName" From Customer WHERE Country !="USA"
1. `brazil_customers.sql`: Provide a query only showing the Customers from Brazil.
answer: SELECT * FROM Customer WHERE Country == "Brazil"
1. `brazil_customers_invoices.sql`: Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
answer: SELECT FirstName ||' '|| LastName as FullName, InvoiceId, InvoiceDate, BillingCountry   FROM Invoice JOIN Customer ON Invoice.CustomerId =Customer.CustomerId WHERE BillingCountry == "Brazil"
1. `sales_agents.sql`: Provide a query showing only the Employees who are Sales Agents.
answer:  SELECT * FROM Employee Where Title == "Sales Support Agent"
1. `unique_invoice_countries.sql`: Provide a query showing a unique/distinct list of billing countries from the Invoice table.
answer:  SELECT DISTINCT BillingCountry FROM Invoice
1. `sales_agent_invoices.sql`: Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.
answer:  SELECT Employee.FirstName||' '||Employee.LastName as FullName, Invoice.InvoiceId FROM Invoice JOIN Customer ON  Invoice.CustomerId = Customer.CustomerId JOIN Employee ON  Customer.SupportRepId = Employee.EmployeeId
1. `invoice_totals.sql`: Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.
answer:  SELECT Invoice.Total, Customer.FirstName||' '||Customer.LastName as CustomerName, Invoice.BillingCountry, Employee.FirstName||' '||Employee.LastName as AgentName FROM Invoice JOIN Customer ON  Invoice.CustomerId = Customer.CustomerId JOIN Employee ON  Customer.SupportRepId = Employee.EmployeeId
1. `total_invoices_{year}.sql`: How many Invoices were there in 2009 and 2011? 
answer: SELECT count(InvoiceId) FROM (SELECT  * FROM Invoice WHERE InvoiceDate LIKE "2009%" 
UNION SELECT * FROM Invoice WHERE InvoiceDate LIKE "2010%"
UNION SELECT * FROM Invoice WHERE InvoiceDate LIKE "2011%")
1. `total_sales_{year}.sql`: What are the respective total sales for each of those years?
SELECT * FROM (SELECT  sum(Invoice.Total), strftime('%Y', 
Invoice.InvoiceDate) as Year  FROM Invoice WHERE InvoiceDate LIKE "2009%" 
UNION SELECT  sum(Invoice.Total), strftime('%Y', 
Invoice.InvoiceDate) as Year FROM Invoice WHERE InvoiceDate LIKE "2010%"
UNION SELECT  sum(Invoice.Total), strftime('%Y', 
Invoice.InvoiceDate) as Year FROM Invoice WHERE InvoiceDate LIKE "2011%") 
1. `invoice_37_line_item_count.sql`: Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.
answer:  SELECT count(*) FROM InvoiceLine WHERE InvoiceId == "37"
1. `line_items_per_invoice.sql`: Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice. HINT: [GROUP BY](http://www.sqlite.org/lang_select.html#resultset)
answer:  SELECT InvoiceId, count(*) as NumberLines FROM InvoiceLine GROUP BY InvoiceId
1. `line_item_track.sql`: Provide a query that includes the purchased track name with each invoice line item.
answer: SELECT Track.Name, InvoiceLine.InvoiceId FROM InvoiceLine JOIN Track ON InvoiceLine.TrackId = Track.TrackId
1. `line_item_track_artist.sql`: Provide a query that includes the purchased track name AND artist name with each invoice line item.
answer: SELECT Track.Name AS "Track Name",Artist.Name AS "Band Name", InvoiceLine.* FROM (InvoiceLine JOIN Track ON InvoiceLine.TrackId = Track.TrackId JOIN Album ON Track.AlbumId = Album.AlbumId JOIN Artist ON Album.ArtistId = Artist.ArtistId)
1. `country_invoices.sql`: Provide a query that shows the # of invoices per country. HINT: [GROUP BY](http://www.sqlite.org/lang_select.html#resultset)
answer: SELECT DISTINCT count(*) as InvoiceCount, BillingCountry  FROM Invoice GROUP BY BillingCountry
1. `playlists_track_count.sql`: Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resulant table.
SELECT p.Name, count(Distinct pt.TrackId) as TrackCount FROM Playlist as p JOIN PlaylistTrack as pt ON p.PlaylistId = pt.PlaylistId GROUP BY pt.PlaylistId
1. `tracks_no_id.sql`: Provide a query that shows all the Tracks, but displays no IDs. The result should include the Album name, Media type and Genre.
answer:  SELECT t.Name as TrackName,a.Title as AlbumTitle, mt.Name as MediaType, g.Name as Genre FROM (Track as t JOIN Album as a ON t.AlbumId = a.AlbumId JOIN MediaType as mt ON t.MediaTypeId = mt.MediaTypeId JOIN Genre as g ON t.GenreId = g.GenreId )
1. `invoices_line_item_count.sql`: Provide a query that shows all Invoices but includes the # of invoice line items.
answer:  SELECT i.*, count(il.InvoiceLineId) as LineCount FROM (Invoice as i JOIN InvoiceLine as il ON i.InvoiceId = il.InvoiceId) GROUP BY i.InvoiceId
1. `sales_agent_total_sales.sql`: Provide a query that shows total sales made by each sales agent.
answer: SELECT e.FirstName||' '||e.LastName as AgentFullName, sum(i.Total) as TotalSales FROM (Invoice as i JOIN Customer as c ON i.CustomerId=c.CustomerId JOIN Employee as e ON c.SupportRepId=e.employeeId) GROUP BY e.employeeId
1. `top_2009_agent.sql`: Which sales agent made the most in sales in 2009?
    > **Hint:** Use the [MAX](https://www.sqlite.org/lang_aggfunc.html#maxggunc) function on a [subquery](http://beginner-sql-tutorial.com/sql-subquery.htm).
SELECT e.FirstName||' '||e.LastName as AgentFullName, sum(i.Total) as TotalSales FROM (Invoice as i JOIN Customer as c ON i.CustomerId=c.CustomerId JOIN Employee as e ON c.SupportRepId=e.employeeId) WHERE InvoiceDate LIKE "2009%" GROUP BY e.employeeId ORDER BY TotalSales DESC LIMIT 1
1. `top_agent.sql`: Which sales agent made the most in sales over all
answer: SELECT e.FirstName||' '||e.LastName as AgentFullName, sum(i.Total) as TotalSales FROM (Invoice as i JOIN Customer as c ON i.CustomerId=c.CustomerId JOIN Employee as e ON c.SupportRepId=e.employeeId) GROUP BY e.employeeId Limit 1
1. `sales_agent_customer_count.sql`: Provide a query that shows the count of customers assigned to each sales agent.
answer:  SELECT SupportRepId,count(DISTINCT CustomerId) as CustomerCount FROM Customer GROUP BY SupportRepId
1. `sales_per_country.sql`: Provide a query that shows the total sales per country.
answer:  SELECT BillingCountry,sum(Total) as TotalSales FROM Invoice GROUP BY BillingCountry
1. `top_country.sql`: Which country's customers spent the most?
answer: SELECT BillingCountry,sum(Total) as TotalSales FROM Invoice GROUP BY BillingCountry ORDER BY TotalSales DESC LIMIT 1
1. `top_2013_track.sql`: Provide a query that shows the most purchased track of 2013.
answer:  SELECT t.Name as TrackName,count(i.InvoiceId) as PurchaseCount,strftime('%Y', 
i.InvoiceDate) as PurchaseYear  FROM (Invoice as i JOIN InvoiceLine as il ON i.InvoiceId=il.InvoiceId JOIN Track as t ON il.TrackId = t.TrackId ) WHERE i.InvoiceDate Like "2013%" GROUP BY t.Name ORDER BY PurchaseCount DESC LIMIT 5
1. `top_5_tracks.sql`: Provide a query that shows the top 5 most purchased tracks over all.
answer:  SELECT t.Name as TrackName,count(i.InvoiceId) as PurchaseCount,strftime('%Y', 
i.InvoiceDate) as PurchaseYear  FROM (Invoice as i JOIN InvoiceLine as il ON i.InvoiceId=il.InvoiceId JOIN Track as t ON il.TrackId = t.TrackId ) GROUP BY t.Name ORDER BY PurchaseCount DESC LIMIT 5
1. `top_3_artists.sql`: Provide a query that shows the top 3 best selling artists.
answer:  SELECT art.Name as ArtistName,count(i.InvoiceId) as PurchaseCount,strftime('%Y', 
i.InvoiceDate) as PurchaseYear  FROM (Invoice as i JOIN InvoiceLine as il ON i.InvoiceId=il.InvoiceId JOIN Track as t ON il.TrackId = t.TrackId JOIN Album as alb ON t.AlbumId = alb.AlbumId JOIN Artist as art ON alb.ArtistID=art.ArtistId) GROUP BY art.Name ORDER BY PurchaseCount DESC LIMIT 3
1. `top_media_type.sql`: Provide a query that shows the most purchased Media Type.
answer: SELECT mt.Name,count(i.InvoiceId) as PurchaseCount  FROM (Invoice as i JOIN InvoiceLine as il ON i.InvoiceId=il.InvoiceId JOIN Track as t ON il.TrackId = t.TrackId JOIN MediaType as mt ON t.MediaTypeId=mt.MediaTypeId) GROUP BY mt.Name ORDER BY PurchaseCount DESC LIMIT 1
