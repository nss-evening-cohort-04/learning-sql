SELECT SUM(Invoice.Total), Employee.FirstName || " " || Employee.LastName AS FullName,  Customer.FirstName || " " || Customer.LastName AS CustomerName, Employee.EmployeeId FROM Employee

JOIN Customer ON Employee.EmployeeId == Customer.SupportRepId

JOIN Invoice ON Customer.CustomerId == Invoice.CustomerId


Group BY Employee.EmployeeId;