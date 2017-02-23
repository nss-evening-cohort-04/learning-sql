SELECT Distinct(BillingCountry), Sum(Total) from Invoice
Group By BillingCountry