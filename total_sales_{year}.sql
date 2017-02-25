SELECT SUM(Total), strftime('%Y',InvoiceDate) AS Year 
FROM Invoice 
GROUP BY Year