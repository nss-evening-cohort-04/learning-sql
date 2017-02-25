/*Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
*/
SELECT Customer.FirstName || " " || Customer.LastName AS "Customer Name",  Invoice.InvoiceId AS "Invoice ID", Invoice.InvoiceDate AS "Invoice Date", Invoice.BillingCountry AS "Billing Country"
FROM Customer JOIN Invoice ON Customer.CustomerId == Invoice.CustomerId
WHERE Customer.Country == "Brazil"