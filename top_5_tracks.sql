SELECT TrackName, TotalSales
FROM (SELECT COUNT(Invoice.InvoiceId) AS TotalSales, Track.Name AS TrackName
		FROM Invoice
		JOIN InvoiceLine ON InvoiceLine.InvoiceId = Invoice.InvoiceId
		JOIN Track ON InvoiceLine.TrackId = Track.TrackId
		GROUP BY TrackName)
		ORDER BY TotalSales 
		DESC LIMIT 5