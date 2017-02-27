SELECT distinct
  e.FirstName || " " || e.LastName as EmployeeName,
  SUM(i.Total) as InvoiceTotal
FROM Invoice as i
JOIN Customer as c
  ON i.CustomerId = c.CustomerId
JOIN Employee as e
  ON c.SupportRepId = e.EmployeeId
WHERE e.Title = 'Sales Support Agent'
GROUP BY
  e.FirstName || " " || e.LastName
ORDER BY
  SUM(i.Total) desc
LIMIT 1;