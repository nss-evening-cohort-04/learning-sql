SELECT  
	FirstName||" "||LastName AS FullName, 
	COUNT(CustomerId) 
FROM(
	SELECT * 
	FROM(
		SELECT CustomerID, SupportRepId AS EmployeeId 
		FROM Customer) 
	AS x J
	OIN Employee 
	ON x.EmployeeId == Employee.EmployeeId) 
AS Y GROUP BY EmployeeId