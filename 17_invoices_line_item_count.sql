/*Provide a query that shows all Invoices but includes the # of invoice line items.*/
SELECT Invoice.InvoiceId, Count(InvoiceLine.InvoiceId) AS "Num of Invoice Line Items", Invoice.BillingAddress, Invoice.BillingCity, Invoice.BillingCountry, Invoice.BillingPostalCode, Invoice.BillingState, Invoice.CustomerId, Invoice.InvoiceDate, Invoice.Total
FROM Invoice
JOIN InvoiceLine ON InvoiceLine.InvoiceId == Invoice.InvoiceId
GROUP BY Invoice.InvoiceId