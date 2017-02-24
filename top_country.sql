select BillingCountry, max("Sum Total") as "Sum Total" from (
select BillingCountry, sum(Total) as "Sum Total"
from Invoice
group by BillingCountry)