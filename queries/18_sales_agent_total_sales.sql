/*Provide a query that shows total sales made by each sales agent.*/
SELECT Employee.FirstName || " " || Employee.LastName AS "Employee Name", ROUND(Sum(Invoice.Total), 2) AS "Total Sales Amount (currency)"
FROM Customer
JOIN Employee ON Customer.SupportRepId == Employee.EmployeeId
JOIN Invoice ON Customer.CustomerId == Invoice.CustomerId
GROUP BY "Employee Name"