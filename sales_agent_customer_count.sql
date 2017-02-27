SELECT distinct
  e.FirstName || " " || e.LastName as EmployeeName,
  COUNT(distinct CustomerId) as AssignedCustomers
FROM Customer as c
JOIN Employee as e
  ON c.SupportRepId = e.EmployeeId
WHERE e.Title = 'Sales Support Agent'
GROUP BY
  e.FirstName || " " || e.LastName;