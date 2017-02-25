SELECT MAX(Invoice_2009), Agent
FROM
	(SELECT COUNT(InvoiceId) AS Invoice_2009, Agent 
	FROM Invoice 
	JOIN 
		(SELECT CustomerId, Agent 
		FROM Customer 
		JOIN 
			(SELECT EmployeeId, FirstName || ' '  || LastName AS Agent 
			FROM Employee WHERE Title == 'Sales Support Agent') AS AgentList 
			WHERE Customer.SupportRepId == AgentList.EmployeeId ) AS  AssociatedAgentList 
	ON Invoice.CustomerId == AssociatedAgentList.CustomerId
	WHERE strftime('%Y',InvoiceDate) in ('2009')
	GROUP BY Agent)
