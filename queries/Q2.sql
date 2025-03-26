--2. Are there museums without any paintings?

select m.museum_id, m.name, m.city
from museum m
left join work  on m.museum_id= work.museum_id
where work.museum_id is not null;
