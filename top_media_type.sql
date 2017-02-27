SELECT distinct
  mt.Name as MediaType,
  COUNT(distinct i.InvoiceId) as NumberOfSales
FROM Invoice as i
JOIN InvoiceLine il
  ON i.InvoiceId = il.InvoiceId
JOIN Track as t
  ON il.TrackId = t.TrackId
JOIN MediaType mt
  ON t.MediaTypeId = mt.MediaTypeId
GROUP BY
  mt.Name
ORDER BY
  COUNT(distinct i.InvoiceId) desc
LIMIT 1;