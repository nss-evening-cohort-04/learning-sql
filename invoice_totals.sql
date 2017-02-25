SELECT Invoice.Total, (Customer.FirstName || " "||Customer.LastName)AS "Customer Name", (Employee.FirstName || " "|| Employee.LastName) AS "Sales Agent", Invoice.BillingCountry FROM Invoice
JOIN Customer ON Customer.CustomerId == Invoice.CustomerId
JOIN Employee ON Customer.SupportRepId == Employee.EmployeeId