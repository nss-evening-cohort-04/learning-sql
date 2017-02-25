/*Provide a query that shows the most purchased Media Type.*/
SELECT "Media Type", Max("Count") AS "Most Purchased Count"
FROM
(SELECT MediaType.Name AS "Media Type", Count(Invoice.InvoiceId) AS "Count", strftime('%Y',Invoice.InvoiceDate) AS "Year"
FROM InvoiceLine
JOIN Track ON InvoiceLine.TrackId == Track.TrackId
JOIN Invoice ON InvoiceLine.InvoiceId == Invoice.InvoiceId
JOIN MediaType ON Track.MediaTypeId == MediaType.MediaTypeId
GROUP BY MediaType.Name)