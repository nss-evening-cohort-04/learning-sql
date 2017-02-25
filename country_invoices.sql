SELECT COUNT(InvoiceId), BillingCountry FROM Invoice
GROUP BY BillingCountry;