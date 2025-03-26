-- 10. Identify the museums which are open on both Sunday and Monday. Display
-- museum name, city.
select museum.name as  museum_name, museum.city
from museum_hours mh1
join museum on museum.museum_id = mh1.museum_id
where day ='Sunday'
and exists(select 1 from museum_hours mh2
where mh2.museum_id= mh1.museum_id and mh2.day='Monday')

select m.name, m.city
from  museum_hours mh
join museum m on mh.museum_id=  m.museum_id
WHERE mh.day IN ('Sunday', 'Monday')
group by m.name, m.city
Having count(distinct mh.day) = 2;
