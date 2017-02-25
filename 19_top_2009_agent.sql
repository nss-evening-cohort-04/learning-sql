/*Which sales agent made the most in sales in 2009?  Use the MAX function on a subquery.*/
SELECT "Employee Name", "Year", Max("Total") AS "Winning Sales Total"
FROM
(SELECT Employee.FirstName || " " || Employee.LastName AS "Employee Name", strftime('%Y',Invoice.InvoiceDate) AS "Year", Sum(Invoice.Total) AS "Total"
FROM Customer
JOIN Employee ON Customer.SupportRepId == Employee.EmployeeId
JOIN Invoice ON Customer.CustomerId == Invoice.CustomerId
WHERE "Year" == "2009"
GROUP BY "Employee Name")