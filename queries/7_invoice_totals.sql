/*Provide a query that shows the 
Invoice Total, Customer name, Country and Sale Agent name 
for all invoices and customers.*/
SELECT Customer.FirstName || " " || Customer.LastName AS "Customer Name", Customer.Country, Employee.FirstName || " " || Employee.LastName AS "Sales Agent Name", Invoice.Total
FROM Customer
JOIN Employee
ON Customer.SupportRepId == Employee.EmployeeId
JOIN Invoice
ON Customer.CustomerId == Invoice.CustomerId