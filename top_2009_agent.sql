#19. top_2009_agent.sql: Which sales agent made the most in sales in 2009?
#Hint: Use the MAX function on a subquery.

SELECT MAX("SUM(Total)"), FullName 
FROM(
	SELECT 
		SUM(Total),
		FirstName||" "||LastName AS FullName 
	FROM(
		SELECT * 
		FROM(
			SELECT CustomerID, SupportRepId AS EmployeeId 
			FROM Customer) 
		AS x 
		JOIN Employee 
		ON x.EmployeeId == Employee.EmployeeId) 
	AS Y 
	JOIN Invoice 
	ON Invoice.CustomerId == y.CustomerId 
	WHERE Invoice.InvoiceDate 
	LIKE "2009%" 
	GROUP BY EmployeeId)