select FirstName || " " || LastName as "Sales Agent Name", max(InvoiceTotal) as "Invoice Total" from (
select *, sum(Invoice.Total) as InvoiceTotal
	from Invoice
	join Customer
		on Customer.CustomerId == Invoice.CustomerId
	join Employee
		on Employee.EmployeeId == Customer.SupportRepId
		group by Employee.EmployeeId)