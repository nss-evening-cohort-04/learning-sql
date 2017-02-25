/*What are the respective total sales for each of those years?*/
SELECT strftime('%Y',Invoice.InvoiceDate) as Year, SUM(Invoice.Total) AS "Invoice Total"
FROM Invoice
WHERE Year == "2009"
OR Year == "2011"
GROUP BY Year