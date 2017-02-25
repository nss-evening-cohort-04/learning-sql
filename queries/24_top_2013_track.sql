/*Provide a query that shows the most purchased track of 2013.*/
SELECT Track.Name AS "Track Name", strftime('%Y',Invoice.InvoiceDate) AS "Year", Count("Track Name") AS "Number Purchased"
FROM Invoice
JOIN InvoiceLine ON Invoice.InvoiceId == InvoiceLine.InvoiceId
JOIN Track ON InvoiceLine.TrackId == Track.TrackId
WHERE "Year" == "2013"
GROUP BY "Track Name"
ORDER BY "Number Purchased" DESC
LIMIT 1