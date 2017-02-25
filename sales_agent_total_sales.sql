SELECT Employee.FirstName || " "|| Employee.Lastname AS "Sales Agent", SUM(Invoice.Total) AS "Total Sales" FROM Employee
JOIN Customer ON Employee.EmployeeId == Customer.SupportRepId
JOIN Invoice ON Customer.CustomerId == Invoice.CustomerId
GROUP BY Employee.EmployeeId