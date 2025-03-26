--13. Who are the top 5 most popular artist? (Popularity is defined based on most no of paintings done by an artist)

select a.artist_id, a.full_name, a.style, count(distinct w.work_id) as work_count
from artist a
join work w on a.artist_id = w.artist_id
group by a.artist_id, a.full_name, a.style
order by work_count desc 
limit 5;

select artist_id, full_name, work_count
from( 
	select a.artist_id, a.full_name, a.style, count( w.artist_id) as work_count,
		rank() over (order by count( w.artist_id) desc) as ranked_artist
	from artist a
	join work w on a.artist_id = a.artist_id
	group by a.artist_id, a.full_name, a.style) as ranked
where ranked_artist <=5;
