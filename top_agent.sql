SELECT Employee.FirstName || " "|| Employee.Lastname AS "Sales Agent", SUM(Invoice.Total) AS "TotalSales" FROM Employee
JOIN Customer ON Employee.EmployeeId == Customer.SupportRepId
JOIN Invoice ON Customer.CustomerId == Invoice.CustomerId
GROUP BY Employee.EmployeeId
ORDER BY TotalSales DESC
LIMIT 1