SELECT FirstName,LastName,InvoiceId,InvoiceDate,BillingCountry FROM Invoice 
JOIN Customer ON Invoice.CustomerId == Customer.CustomerId
WHERE BillingCountry == "Brazil"