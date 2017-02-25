/*Looking at the InvoiceLine table, 
provide a query that COUNTs the number of line items 
for Invoice ID 37.*/
SELECT Count(InvoiceLine.InvoiceId) AS "Lines on Invoice #37"
FROM InvoiceLine
WHERE InvoiceLine.InvoiceId == 37
GROUP BY InvoiceLine.InvoiceId