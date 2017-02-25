SELECT Employee.FirstName || " " || Employee.LastName AS FullName, Invoice.Total, Customer.FirstName || " " || Customer.LastName AS CustomerName, Customer.Country FROM Employee

JOIN Customer ON Employee.EmployeeId == Customer.SupportRepId

JOIN Invoice ON Customer.CustomerId == Invoice.CustomerId

ORDER BY FullName;