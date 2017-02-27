SELECT distinct
  FirstName || " " || LastName as CustomerFullName,
  InvoiceId,
  InvoiceDate,
  BillingCountry
FROM Customer as c
JOIN Invoice as i
  ON c.CustomerId = i.InvoiceId
WHERE Country = 'Brazil';