SELECT distinct
  t.Name as TrackName,
  COUNT(distinct i.InvoiceId) as NumberOfSales
FROM Invoice as i
JOIN InvoiceLine il
  ON i.InvoiceId = il.InvoiceId
JOIN Track as t
  ON il.TrackId = t.TrackId
GROUP BY
  t.Name
ORDER BY
  COUNT(distinct i.InvoiceId) desc
LIMIT 5;