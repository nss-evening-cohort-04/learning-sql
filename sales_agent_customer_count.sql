SELECT Employee.FirstName ||" "|| Employee.LastName AS "Sales Agent", Count(CustomerId) AS "# of Customers" FROM Employee
JOIN Customer ON Employee.EmployeeId == Customer.SupportRepId
GROUP BY Employee.EmployeeId