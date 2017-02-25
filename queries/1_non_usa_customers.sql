--Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
SELECT Customer.FirstName || " " || Customer.LastName AS "Customer Name", Customer.CustomerId AS "Customer ID", Customer.Country
FROM Customer
WHERE Customer.Country != "USA"