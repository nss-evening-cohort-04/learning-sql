SELECT T.Name, AR.Name, IL.InvoiceLineId from InvoiceLine IL
JOIN Track T on T.TrackId = IL.TrackId 
JOIN Album AL on AL.AlbumId = T.AlbumId 
JOIN Artist AR on AR.ArtistId = AL.ArtistId
Order By invoiceLineId asc