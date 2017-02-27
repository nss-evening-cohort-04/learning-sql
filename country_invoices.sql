#14. country_invoices.sql: Provide a query that shows the # of invoices per country. HINT: GROUP BY

SELECT COUNT(InvoiceId), BillingCountry 
FROM Invoice 
GROUP BY BillingCountry