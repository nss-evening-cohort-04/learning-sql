select Employee.FirstName || " " || Employee.LastName as "Sales Agent Name", Employee.EmployeeId, sum(Invoice.Total) from Employee 
join Customer on Customer.SupportRepId = Employee.EmployeeId
join Invoice on Customer.CustomerId = Invoice. CustomerId
group by Employee.EmployeeId