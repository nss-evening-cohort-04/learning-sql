SELECT Total, Customer, Country, Agent 
FROM Invoice 
JOIN (SELECT CustomerId,  FirstName || ' '  || LastName AS Customer, Country, Agent 
			FROM Customer 
			JOIN (SELECT EmployeeId, FirstName || ' '  || LastName AS Agent 
						FROM Employee 
						WHERE Title == 'Sales Support Agent') AS AgentList 
			WHERE Customer.SupportRepId == AgentList.EmployeeId ) AS  AssociatedAgentList 
WHERE Invoice.CustomerId == AssociatedAgentList.CustomerId