
-- 16. Which museum has the most no of most popular painting style?
with PaintingStyle as(

	select style
	from work
	where style is not null
	group by style
	order by COUNT(*) desc
)
SELECT * FROM PaintingStyle;

select museum.name, museum.state, count(w.style)as painting_count
from work w
join museum on w.museum_id= museum.museum_id
group by museum.name, museum.state
order by painting_count desc
limit 10;
