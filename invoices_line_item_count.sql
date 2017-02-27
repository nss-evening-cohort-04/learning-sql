#17. invoices_line_item_count.sql: Provide a query that shows all Invoices but includes the # of invoice line items.

SELECT 
	COUNT(InvoiceLineId) AS NumberOfInvoiceLineItems, 
	Invoice.InvoiceId AS Invoice 
FROM InvoiceLine 
JOIN Invoice 
ON Invoice.InvoiceId ==  InvoiceLine.InvoiceId 
GROUP BY Invoice.InvoiceId