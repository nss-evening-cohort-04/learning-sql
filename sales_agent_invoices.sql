SELECT Employee.FirstName, Employee.LastName, Invoice.*
FROM Employee 
JOIN Customer ON Customer.SupportRepId == Employee.EmployeeId 
JOIN Invoice ON Invoice.CustomerId == Customer.CustomerId