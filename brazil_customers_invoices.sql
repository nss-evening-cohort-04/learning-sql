SELECT Customer.FirstName || " " || Customer.LastName AS FullName, Customer.CustomerId, Invoice.BillingCountry, Invoice.InvoiceDate, Invoice.InvoiceId FROM Customer

JOIN Invoice ON Customer.CustomerId == Invoice.CustomerId

WHERE BillingCountry == "Brazil";