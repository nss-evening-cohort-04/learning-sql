SELECT COUNT(BillingCountry), BillingCountry
FROM Invoice
GROUP BY BillingCountry