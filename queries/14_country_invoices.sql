/*Provide a query that shows the # of invoices per country. HINT: GROUP BY*/
SELECT Customer.Country, Count(Invoice.InvoiceId) AS "Invoice Count"
FROM Customer
JOIN Invoice ON Customer.CustomerId	== Invoice.CustomerId
GROUP BY Customer.Country