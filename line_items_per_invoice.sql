SELECT COUNT(InvoiceLineId) AS 'Line Item', InvoiceId 
FROM InvoiceLine 
GROUP BY InvoiceId