--sales_agents.sql: Provide a query showing only the Employees who are Sales Agents.
SELECT *
FROM Employee
WHERE Employee.Title
LIKE "%Sales%Agent%"