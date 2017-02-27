SELECT distinct
  c.Country,
  SUM(i.Total) as TotalSales
FROM Invoice as i
JOIN Customer as c
  ON i.CustomerId = c.CustomerId
GROUP BY
  c.Country
ORDER BY
  SUM(i.Total) desc
LIMIT 1;