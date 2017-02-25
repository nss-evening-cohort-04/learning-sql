/*23_top_country.sql: Which country's customers spent the most?*/
SELECT "Country", Max("Total Sales (currency)") AS "Largest Sales Amount"
FROM
(SELECT Invoice.BillingCountry AS "Country", Sum(Invoice.Total) AS "Total Sales (currency)"
FROM Invoice
GROUP BY Invoice.BillingCountry)