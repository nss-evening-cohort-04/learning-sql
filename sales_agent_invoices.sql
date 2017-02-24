#6. Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.

SELECT y.InvoiceId AS "Invoice Id", y."FirstName:1"||" "|| y."LastName:1" AS "Employee Full Name" FROM
		(SELECT * FROM 
			(SELECT * FROM Customer 
				JOIN Invoice 
				ON Customer.CustomerId == Invoice.CustomerId 
				Order By SupportRepId) 
			As x JOIN Employee Where x.SupportRepId == Employee.EmployeeId) 
		As Y
