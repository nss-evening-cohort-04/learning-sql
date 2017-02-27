SELECT distinct
  i.InvoiceId,
  i.CustomerId,
  i.InvoiceDate,
  i.BillingAddress,
  i.BillingCity,
  i.BillingState,
  i.BillingCountry,
  i.BillingPostalCode,
  i.Total,
  COUNT(distinct il.InvoiceLineId) as InvoiceLineCount
FROM Invoice as i
JOIN InvoiceLine as il
  ON i.InvoiceId = il.InvoiceId
GROUP BY
  i.InvoiceId,
  i.CustomerId,
  i.InvoiceDate,
  i.BillingAddress,
  i.BillingCity,
  i.BillingState,
  i.BillingCountry,
  i.BillingPostalCode,
  i.Total;