select Track.Name, sum(Invoice.Total)
	from Invoice
	join InvoiceLine
		on Invoice.InvoiceId == InvoiceLine.InvoiceId
	join Track
		on Track.TrackId == InvoiceLine.TrackId
	group by Track.TrackId
	order by sum(Invoice.Total) desc
limit 5