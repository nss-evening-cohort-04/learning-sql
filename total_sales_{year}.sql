SELECT distinct
  strftime('%Y',InvoiceDate) as InvoiceYear,
  SUM(Total) as TotalSales
FROM Invoice
WHERE strftime('%Y',InvoiceDate) IN ('2009','2011')
GROUP BY
  strftime('%Y',InvoiceDate);