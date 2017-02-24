select Name, max("Total Count") as "Total Count"
from(
select MediaType.Name as Name, count(*) as "Total Count"
from InvoiceLine
	join Track
		on Track.TrackId == InvoiceLine.TrackId
	join MediaType 
		on MediaType.MediaTypeId == Track.MediaTypeId
group by MediaType.MediaTypeId)