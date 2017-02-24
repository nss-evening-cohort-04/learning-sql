SELECT BillingCountry, MAX(TotalSalesByCountry) FROM (SELECT *, SUM(Total) AS TotalSalesByCountry FROM Invoice
GROUP BY BillingCountry)

