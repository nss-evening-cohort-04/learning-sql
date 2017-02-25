/*Which sales agent made the most in sales over all?*/
SELECT "Employee Name", Max("Total Sales (currency)") AS "Winning Sales Total"
FROM
(SELECT Employee.FirstName || " " || Employee.LastName AS "Employee Name", Round(Sum(Invoice.Total), 2) AS "Total Sales (currency)"
FROM Customer
JOIN Employee ON Customer.SupportRepId == Employee.EmployeeId
JOIN Invoice ON Customer.CustomerId == Invoice.CustomerId
GROUP BY "Employee Name")
