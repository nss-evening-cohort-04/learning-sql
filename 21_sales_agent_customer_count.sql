/*Provide a query that shows the count of customers assigned to each sales agent.*/
SELECT Employee.FirstName || " " || Employee.LastName AS "Employee Name", Count(Customer.CustomerId)
FROM Customer
JOIN Employee ON Customer.SupportRepId == Employee.EmployeeId
GROUP BY "Employee Name"