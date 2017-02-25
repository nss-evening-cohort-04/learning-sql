SELECT COUNT(*) AS 'Total Invoices'
FROM Invoice 
WHERE strftime('%Y',InvoiceDate) in ('2009', '2011')