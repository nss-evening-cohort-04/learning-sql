SELECT BillingCountry
FROM
	(SELECT SUM(Total) AS TotalSale, BillingCountry
	FROM Invoice
	GROUP By BillingCountry
	ORDER BY TotalSale DESC
	LIMIT 1)