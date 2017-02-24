SELECT Count(Customer.SupportRepId) AS NumberOfCustomers, Customer.SupportRepId, Employee.FirstName || " " || Employee.LastName AS FullName
FROM Employee
JOIN Customer ON Employee.EmployeeId == Customer.SupportRepId
GROUP BY Employee.FirstName 