/*2009*/
select sum(Total)
from Invoice
where strftime('%Y', InvoiceDate) == "2009"

/*2011*/
select sum(Total)
from Invoice
where strftime('%Y', InvoiceDate) == "2011"