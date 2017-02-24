SELECT MAX(TotalSales) , CountryName
FROM (SELECT MAX(Invoice.Total) AS TotalSales, Invoice.BillingCountry AS CountryName
		FROM Employee
		JOIN Customer ON Employee.EmployeeId == Customer.SupportRepId
		JOIN Invoice ON Customer.CustomerId == Invoice.CustomerId
		GROUP BY CountryName)