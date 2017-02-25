SELECT FirstName || ' '  || LastName, InvoiceId,  invoiceDate, billingCountry 
FROM Customer, Invoice 
WHERE Customer.CustomerId == Invoice.CustomerId AND Country == 'Brazil'