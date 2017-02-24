#9. total_sales_{year}.sql: What are the respective total sales for each of those years?

SELECT COUNT(*) 
FROM Invoice 
WHERE InvoiceDate 
LIKE "2009%" 

SELECT COUNT(*) 
FROM Invoice 
WHERE InvoiceDate 
LIKE "2011%" 

#Can answer separately but don't know how to do on same table?