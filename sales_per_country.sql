Select BillingCountry, SUM(Total) As "Total Sales"FROM Invoice
GROUP BY BillingCountry