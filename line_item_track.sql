SELECT IL.InvoiceLineId, T.Name from InvoiceLine IL
JOIN Track T on T.TrackId = IL.TrackId
Order By invoiceLineId asc