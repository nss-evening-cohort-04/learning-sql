select Artist.Name, sum(Invoice.Total)
	from Invoice
	join InvoiceLine
		on Invoice.InvoiceId == InvoiceLine.InvoiceId
	join Track
		on Track.TrackId == InvoiceLine.TrackId
	join Artist
		on Artist.ArtistId == Track.TrackId
	group by Artist.ArtistId
	order by sum(Invoice.Total) desc
	limit 3