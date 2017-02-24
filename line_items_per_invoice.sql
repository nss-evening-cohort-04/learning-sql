SELECT InvoiceId, Count(InvoiceId) FROM InvoiceLine
GROUP BY InvoiceId;