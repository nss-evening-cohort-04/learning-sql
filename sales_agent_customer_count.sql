select Employee.EmployeeId , Count(*) as "Assigned Customer Count" from Employee join Customer on Employee.EmployeeId == Customer.SupportRepId Group By Customer.SupportRepId
B1wiiZujYrEl