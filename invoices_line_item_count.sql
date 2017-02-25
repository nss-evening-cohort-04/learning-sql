SELECT COUNT(InvoiceLineId), Invoice.*
FROM InvoiceLine
JOIN Invoice
ON InvoiceLine.InvoiceId== Invoice.InvoiceId
GROUP BY Invoice.InvoiceId