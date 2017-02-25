SELECT MAX(Total), FullName 
FROM (SELECT SUM(Invoice.Total) AS Total, Employee.FirstName || " " || Employee.LastName AS FullName,  Customer.FirstName || " " || Employee.EmployeeId 
	  FROM Employee
JOIN Customer ON Employee.EmployeeId == Customer.SupportRepId
JOIN Invoice ON Customer.CustomerId == Invoice.CustomerId
GROUP BY FullName)