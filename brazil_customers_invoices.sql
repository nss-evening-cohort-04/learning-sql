#3. brazil_customers_invoices.sql: Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.

SELECT 
	CUSTID.FirstName||" "||CUSTID.LastName, 
	CUSTID.InvoiceId,
	CUSTID.InvoiceDate, 
	CUSTID.BillingCountry 
FROM(
	SELECT * 
	FROM Customer 
	JOIN Invoice 
	ON Customer.CustomerId == Invoice.CustomerId) 
AS CUSTID 
WHERE Country == "Brazil"