--21. Which are the 3 most popular and 3 least popular painting styles?
( 
	select style, count(*) as total_styles
	from work 
	WHERE style is not null
	group by style
	order by total_styles desc
	limit 3
)
union
( 
	select style, count(*) as total_styles
	from work 
	WHERE style is not null
	group by style
	order by total_styles asc
	limit 3
);
