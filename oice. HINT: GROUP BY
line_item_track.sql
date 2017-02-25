SELECT Track.Name, InvoiceLine.* 
FROM InvoiceLine 
JOIN Track ON  InvoiceLine.TrackId == Track.TrackId