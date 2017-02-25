SELECT Employee.FirstName, Employee.LastName, Invoice.* FROM Employee 
JOIN Customer ON Employee.EmployeeId == Customer.SupportRepId