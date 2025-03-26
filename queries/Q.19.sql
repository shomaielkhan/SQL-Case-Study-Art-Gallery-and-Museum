--19. Identify the artist and the museum where the most expensive and least expensive
--painting is placed. Display the artist name, sale_price, painting name, museum
--name, museum city and canvas labe

select * from artist;
select * from canvas_size;
select * from image_link;
select * from museum;
select * from museum_hours;
select * from product_size;
select * from subject;
select * from work;

with PaintingPrice as(
	select 
		w.work_id,
		w.museum_id,
		w.name as painting_name,
		m.name as museum_name,
		a.full_name as artist_name,
		ps.sale_price,
		m.city as museum_city,
		ROW_NUMBER() over(partition by ps.sale_price order by w.work_id)as rn
	from work w
	join artist a on w.artist_id= a.artist_id
	join museum m on w.museum_id = m.museum_id
	join product_size ps on w.work_id= ps.work_id
	where ps.sale_price = (select max(sale_price)from product_size)
		or ps.sale_price = (select min(sale_price)from product_size)
	
)

select
	artist_name,
    sale_price,
    painting_name,
    museum_name,
    museum_city
from PaintingPrice
where rn=1;
