SELECT FirstName || ' '  || LastName AS 'Customer Name', customerId,  Country 
FROM Customer 
WHERE Country != 'USA'