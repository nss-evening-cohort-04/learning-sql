select C.FirstName, C.LastName, I.InvoiceId, I.InvoiceDate, I.BillingCountry from invoice I 
Join Customer C on C.CustomerId = I.CustomerID
