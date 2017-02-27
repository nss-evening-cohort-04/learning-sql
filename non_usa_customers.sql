SELECT
  FirstName || " " || LastName as FullName,
  CustomerId,
  Country
FROM Customer
WHERE Country <> 'USA';