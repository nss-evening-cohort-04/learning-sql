SELECT Max(Total), EmployeeID from (
SELECT E.EmployeeID as EmployeeID, E.FirstName, E.LastName, Sum(I.Total) as Total from Invoice I 
JOIN Customer C on C.CustomerID = I.CustomerId
JOIN Employee E on E.EmployeeID = C.SupportRepId
WHERE InvoiceDate like '%2009%'
Group By E.FirstName
)