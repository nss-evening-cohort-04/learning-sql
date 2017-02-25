SELECT Sum(Total)
FROM Invoice
WHERE strftime('%Y',InvoiceDate) in ('2009', '2011')