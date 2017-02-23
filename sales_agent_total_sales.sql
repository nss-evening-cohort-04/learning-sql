select E.FirstName, E.LastName, SUM(I.Total) from Employee E
JOIN Customer C on C.SupportRepId = E.EmployeeId
JOIN Invoice I on I.CustomerID = C.CustomerID
Group By E.EmployeeID

