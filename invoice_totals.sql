#7. invoice_totals.sql: Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.

SELECT 
	Total AS InvoiceTotal, 
	CustomerName, 
	BillingCountry AS Country, 
	EmployeeName AS SaleAgent  
FROM(
	SELECT 
		FirstName ||" "|| LastName AS CustomerName, 
		x.EmployeeName, 
		CustomerId 
	FROM(
		SELECT 
			EmployeeId AS "SupportRepId", 
			FirstName ||" "|| LastName AS "EmployeeName" 
		FROM Employee) 
		AS x 
	JOIN Customer 
	ON x.SupportRepId == Customer.SupportRepId) 
	AS y 
JOIN Invoice 
ON y.CustomerId == Invoice.CustomerId