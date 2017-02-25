/*Looking at the InvoiceLine table, 
provide a query that COUNTs the number of line items 
for each Invoice. HINT: GROUP BY*/
SELECT InvoiceLine.InvoiceId, Count(InvoiceLine.Quantity) AS "Num of Lines"
FROM InvoiceLine
GROUP BY InvoiceLine.InvoiceId