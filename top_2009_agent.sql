SELECT Employee.FirstName||" "||Employee.LastName AS "Sales Agent", SUM(Invoice.Total) AS "Sales" FROM Employee
JOIN Customer ON Customer.SupportRepId == Employee.EmployeeId
JOIN Invoice ON Invoice.CustomerId == Customer.CustomerId
JOIN InvoiceLine ON InvoiceLine.InvoiceId == Invoice.InvoiceId
WHERE strftime ('%Y', InvoiceDate) IN ("2009")
GROUP BY Employee.EmployeeId
ORDER BY Sales DESC
LIMIT 1