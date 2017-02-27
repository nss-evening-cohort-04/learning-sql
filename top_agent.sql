#20. top_agent.sql: Which sales agent made the most in sales over all?

SELECT MAX("SUM(Total)"), FullName 
FROM(
	SELECT 
		SUM(Total),
		FirstName||" "||LastName AS FullName 
	FROM(
		SELECT * 
		FROM(
			SELECT 
				CustomerID, 
				SupportRepId AS EmployeeId 
			FROM Customer) 
		AS x 
		JOIN Employee 
		ON x.EmployeeId == Employee.EmployeeId) 
	AS Y 
	JOIN Invoice 
	ON Invoice.CustomerId == y.CustomerId 
	GROUP BY EmployeeId)