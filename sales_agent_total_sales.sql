#18. sales_agent_total_sales.sql: Provide a query that shows total sales made by each sales agent.

SELECT 
	FirstName ||"  "|| LastName AS SalesAgentName, 
	SUM(Total) AS TotalSales 
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
GROUP BY EmployeeId