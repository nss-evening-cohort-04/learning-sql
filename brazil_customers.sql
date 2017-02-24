#2. brazil_customers.sql: Provide a query only showing the Customers from Brazil.

SELECT CustomerId, FirstName || " " || LastName, Country FROM Customer WHERE Country = "Brazil"