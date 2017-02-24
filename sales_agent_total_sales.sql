SELECT Employee.FirstName ||" "|| Employee.LastName AS "Employee Name" ,  SUM(Total) AS TotalSales
FROM Invoice
JOIN Employee ON Employee.EmployeeId = Customer.SupportRepId
JOIN Customer ON Customer.CustomerId = Invoice.CustomerId
GROUP BY Employee.FirstName