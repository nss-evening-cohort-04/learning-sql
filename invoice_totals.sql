SELECT C.FirstName as CustomerFirstName, C.LastName as CustomerLastName, E.FirstName as SalesAgentFirstName, E.LastName as SalesAgentLastName,  I.InvoiceId, I.BillingCountry, I.Total from Employee E
JOIN Customer C on C.SupportRepId = E.EmployeeId
JOIN Invoice I on I.CustomerId = C.CustomerId
Order By CustomerFirstName asc