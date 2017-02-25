SELECT COUNT(CustomerId), Agent.FirstName||" "||Agent.LastName As Name
FROM Customer
JOIN
	(SELECT * FROM Employee WHERE Title == 'Sales Support Agent') AS Agent
ON Customer.SupportRepId == Agent.EmployeeId
GROUP BY Name