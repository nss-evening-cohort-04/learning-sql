SELECT distinct
  art.Name as ArtistName,
  COUNT(distinct i.InvoiceId) as NumberOfSales
FROM Invoice as i
JOIN InvoiceLine il
  ON i.InvoiceId = il.InvoiceId
JOIN Track as t
  ON il.TrackId = t.TrackId
JOIN Album as a
  ON t.AlbumId = a.Albumid
JOIN Artist as art
  ON a.ArtistId = art.ArtistId
GROUP BY
  art.Name
ORDER BY
  COUNT(distinct i.InvoiceId) desc
LIMIT 3;