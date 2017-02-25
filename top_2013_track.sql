SELECT *
FROM (SELECT COUNT(Track.TrackId) AS TotalSales, Track.Name AS TrackName
		FROM Invoice
		JOIN InvoiceLine ON InvoiceLine.InvoiceId = Invoice.InvoiceId
		JOIN Track ON InvoiceLine.TrackId = Track.TrackId
		WHERE  strftime('%Y',InvoiceDate) IN ('2013')
		GROUP BY TrackName
		ORDER BY TotalSales 
		LIMIT 1)
