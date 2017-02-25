/*Provide a query that shows the total sales per country.*/
SELECT Invoice.BillingCountry AS "Country", Sum(Invoice.Total) AS "Total Sales (currency)"
FROM Invoice
GROUP BY Invoice.BillingCountry