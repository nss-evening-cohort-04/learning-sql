#22. sales_per_country.sql: Provide a query that shows the total sales per country.

SELECT SUM(Total) As SumOfTotal, BillingCountry 
FROM Invoice 
GROUP BY BillingCountry