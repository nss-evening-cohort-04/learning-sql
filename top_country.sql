#23. top_country.sql: Which country's customers spent the most?

SELECT MAX(SumOfTotal), BillingCountry 
FROM(
	SELECT SUM(Total) As SumOfTotal, BillingCountry 
	FROM Invoice 
	GROUP BY BillingCountry) 
AS X