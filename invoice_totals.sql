SELECT distinct
  c.FIrstName || " " || c.LastName as CustomerFullName,
  BillingCountry,
  e.FirstName || " " || e.LastName as SalesAgentName,
  SUM(i.Total)  as InvoiceTotal
FROM Employee as e
JOIN Customer as c
  ON e.EmployeeId = c.SupportRepId
JOIN Invoice as i
  ON c.CustomerId = i.CustomerId
GROUP BY
  c.FIrstName || " " || c.LastName,
  BillingCountry,
  e.FirstName || " " || e.LastName;