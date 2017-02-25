/*How many Invoices were there in 2009 and 2011?*/
SELECT strftime('%Y',Invoice.InvoiceDate) as Year, count(Invoice.InvoiceId) AS "Invoice Count"
FROM Invoice
WHERE Year == "2009"
OR Year == "2011"
GROUP BY Year