SELECT TrackName, Max(Quantity) from (
SELECT distinct(T.Name) as TrackName, count(I.InvoiceID) as Quantity From InvoiceLine IL
JOIN Track T on T.TrackID = IL.TrackID 
JOIN Invoice I on I.InvoiceID = IL.InvoiceID
WHERE I.InvoiceDate like '%2013%' 
Group By I.InvoiceID
)