SELECT Invoice.BillingCountry,Count(*)
FROM Invoice
GROUP BY Invoice.BillingCountry