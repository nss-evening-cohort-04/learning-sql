SELECT Employee.FirstName ||" "|| Employee.LastName AS "Employee Name" , Customer.FirstName ||" "|| Customer.LastName AS "Customer Name", Invoice.Total, Invoice.BillingCountry
FROM Employee 
JOIN Customer ON Customer.SupportRepId == Employee.EmployeeId 
JOIN Invoice ON Invoice.CustomerId == Customer.CustomerId