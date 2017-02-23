SELECT I.InvoiceId, Count(I.InvoiceID) from Invoice I 
JOIN InvoiceLine IL on IL.InvoiceId = I.InvoiceId
Group By I.InvoiceID