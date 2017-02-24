 SELECT MAX(Total), FullName FROM (SELECT SUM(Invoice.Total) AS Total, Employee.FirstName || " " || Employee.LastName AS FullName FROM Employee

JOIN Customer ON Employee.EmployeeId == Customer.SupportRepId

JOIN Invoice ON Customer.CustomerId == Invoice.CustomerId
WHERE InvoiceDate LIKE "%2009%"
GROUP BY FullName)
