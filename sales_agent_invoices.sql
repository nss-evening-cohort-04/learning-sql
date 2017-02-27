SELECT distinct
  e.FirstName || " " || e.LastName as EmployeeName,
  i.*
FROM Invoice as i
JOIN Customer as c
  ON i.CustomerId = c.CustomerId
JOIN Employee as e
  ON c.SupportRepId = e.EmployeeId;