SELECT InvoiceId, Count(InvoiceId) from InvoiceLine
Group By InvoiceId