SELECT distinct
  BillingCountry,
  COUNT(distinct InvoiceId) as TotalInvoices
FROM Invoice
GROUP BY
  BillingCountry;