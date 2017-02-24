SELECT *, COUNT(InvoiceLine.InvoiceId) AS  TotalLineItem FROM Invoice 
JOIN InvoiceLine ON InvoiceLine.InvoiceId == Invoice.InvoiceId
GROUP BY InvoiceLine.InvoiceLineId

