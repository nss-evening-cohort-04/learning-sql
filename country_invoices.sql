SELECT BillingCountry, COUNT(InvoiceId) from Invoice
Group By BillingCountry