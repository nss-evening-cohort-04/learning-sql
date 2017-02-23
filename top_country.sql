SELECT Country, Max(Total) from (
SELECT Distinct(BillingCountry) as Country, Sum(Total) as Total from Invoice
Group By BillingCountry
)