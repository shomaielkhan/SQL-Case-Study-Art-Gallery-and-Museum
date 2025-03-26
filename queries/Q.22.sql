
--22. Which artist has the most no of Portraits paintings outside USA?. Display artist
--name, no of paintings and the artist nationality

select a.full_name as artist_name,
	count(a.artist_id) as total_painting_count,
	a.nationality 
from work w
join artist a on w.artist_id=a.artist_id
join museum m on w.museum_id=m.museum_id
where a.style='Portraitist'
	and m.country <>'USA'
Group by a.full_name, a.nationality
order by total_painting_count ;
