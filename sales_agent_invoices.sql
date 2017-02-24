SELECT Employee.FirstName || " " || Employee.LastName AS FullName, Employee.EmployeeId, Customer.SupportRepId, Invoice.InvoiceId FROM Employee

JOIN Customer ON Employee.EmployeeId == Customer.SupportRepId

JOIN Invoice ON Customer.CustomerId == Invoice.CustomerId

ORDER BY FullName;