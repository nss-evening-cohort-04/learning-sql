select count(*) as "Invoice Count"
from Invoice
where strftime('%Y', InvoiceDate) == "2009" Or strftime('%Y', InvoiceDate) == "2011"
