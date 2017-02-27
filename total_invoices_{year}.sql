SELECT distinct
  strftime('%Y',InvoiceDate) as InvoiceYear,
  COUNT(distinct InvoiceId) as InvoicesCount
FROM Invoice
WHERE strftime('%Y',InvoiceDate) IN ('2009','2011')
GROUP BY
  strftime('%Y',InvoiceDate);