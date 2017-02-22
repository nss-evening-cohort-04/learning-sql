#Skipped 6, 7, 9

#13. line_item_track_artist.sql: Provide a query that includes the purchased track name AND artist name with each invoice line item.



#14. country_invoices.sql: Provide a query that shows the # of invoices per country. HINT: GROUP BY

SELECT COUNT(InvoiceId), BillingCountry 
FROM Invoice 
GROUP BY BillingCountry

#15. playlists_track_count.sql: Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resulant table.



#16. tracks_no_id.sql: Provide a query that shows all the Tracks, but displays no IDs. The result should include the Album name, Media type and Genre.



#17. invoices_line_item_count.sql: Provide a query that shows all Invoices but includes the # of invoice line items.



#18. sales_agent_total_sales.sql: Provide a query that shows total sales made by each sales agent.



#19. top_2009_agent.sql: Which sales agent made the most in sales in 2009?
#Hint: Use the MAX function on a subquery.



#20. top_agent.sql: Which sales agent made the most in sales over all?



#21. sales_agent_customer_count.sql: Provide a query that shows the count of customers assigned to each sales agent.



#22. sales_per_country.sql: Provide a query that shows the total sales per country.



#23. top_country.sql: Which country's customers spent the most?



#24. top_2013_track.sql: Provide a query that shows the most purchased track of 2013.



#25. top_5_tracks.sql: Provide a query that shows the top 5 most purchased tracks over all.



#26. top_3_artists.sql: Provide a query that shows the top 3 best selling artists.



#27. top_media_type.sql: Provide a query that shows the most purchased Media Type.