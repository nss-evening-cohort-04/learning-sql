SELECT InvoiceLine.InvoiceId, Track.TrackId, Track.Name
FROM InvoiceLine
JOIN Track ON InvoiceLine.TrackId = Track.TrackId