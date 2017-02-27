SELECT
  COUNT(distinct InvoiceLineId) as InvoiceLines
FROM InvoiceLine
WHERE InvoiceId = '37';