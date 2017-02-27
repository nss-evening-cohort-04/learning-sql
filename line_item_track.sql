SELECT distinct
  t.Name,
  i.*
FROM InvoiceLine as i
JOIN Track as t
  ON i.TrackId = t.TrackId;