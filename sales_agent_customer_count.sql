SELECT Employee.LastName, COUNT(Customer.SupportRepId) AS CustomerCount FROM Employee
JOIN Customer ON Employee.EmployeeId == Customer.SupportRepId
GROUP BY Employee.EmployeeId
