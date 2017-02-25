/*Provide a query that shows the top 5 most purchased tracks over all.*/
SELECT Track.Name AS "Track Name", strftime('%Y',Invoice.InvoiceDate) AS "Year", Count("Track Name") AS "Number Purchased"
FROM Invoice
JOIN InvoiceLine ON Invoice.InvoiceId == InvoiceLine.InvoiceId
JOIN Track ON InvoiceLine.TrackId == Track.TrackId
GROUP BY "Track Name"
ORDER BY "Number Purchased" DESC
LIMIT 5