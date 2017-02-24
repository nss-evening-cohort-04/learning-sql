select FirstName || " " || LastName as "Sales Agent Name", max("Sales Total" ) as "Sales Total" from
(select *, sum(Invoice.Total) as "Sales Total"
	from Invoice
	join Customer
		on Customer.CustomerId == Invoice.CustomerId
	join Employee
		on Employee.EmployeeId == Customer.SupportRepId
		where strftime('%Y', InvoiceDate) == "2009"
		group by Employee.EmployeeId)
