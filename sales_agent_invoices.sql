select Employee.FirstName 
			|| " " || Employee.LastName as "Sales Agent", 
			Invoice.* 
from Employee 
join Customer 
	on Employee.EmployeeId == Customer.SupportRepId 
join Invoice 
	on Customer.CustomerId == Invoice.CustomerId