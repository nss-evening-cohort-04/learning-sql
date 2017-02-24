select *, count(InvoiceLine.TrackId) as TotalCount
    from Invoice
    join InvoiceLine
        on InvoiceLine.InvoiceId == Invoice.InvoiceId
    join Track
        on Track.TrackId == InvoiceLine.TrackId
        where strftime('%Y', InvoiceDate) == "2013"
        group by InvoiceLine.TrackId
order by TotalCount desc
limit 1