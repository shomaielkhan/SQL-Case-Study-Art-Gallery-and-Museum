--12-Which are the top 5 most popular museum? (Popularity is defined based on most no of paintings in a museum)

select museum_id, name, city, painting_count
from( 
	select m.museum_id, m.name, m.city, count(w.work_id)as Painting_count,
		rank() over (order by count(w.work_id) desc )as rnk
	from museum m
	join work w on m.museum_id = w.museum_id
	group by m.museum_id, m.name, m.city
) ranked_museums	
where rnk <=5;
