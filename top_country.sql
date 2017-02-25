Select BillingCountry, SUM(Total) As "TotalSales"FROM Invoice
GROUP BY BillingCountry
ORDER BY TotalSales DESC
LIMIT 1