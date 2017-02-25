SELECT SUM(Total), Agent 
FROM Invoice 
JOIN 
	(SELECT CustomerId, Agent 
	FROM Customer 
	JOIN 
		(SELECT EmployeeId, FirstName || ' '  || LastName AS Agent 
		FROM Employee WHERE Title == 'Sales Support Agent') AS AgentList 
		WHERE Customer.SupportRepId == AgentList.EmployeeId ) AS  AssociatedAgentList 
WHERE Invoice.CustomerId == AssociatedAgentList.CustomerId
GROUP By Agent