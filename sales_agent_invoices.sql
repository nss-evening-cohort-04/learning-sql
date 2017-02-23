SELECT E.FirstName, E.LastName, I.InvoiceId from Employee E
JOIN Customer C on C.SupportRepId = E.EmployeeId
JOIN Invoice I on I.CustomerId = C.CustomerId