SELECT distinct(T.Name) as TrackName, Count(IL.InvoiceID) as Quantity from Track T
JOIN InvoiceLine IL on IL.TrackId = T.TrackId
Group By IL.InvoiceID
Order By Quantity desc
LIMIT 5;