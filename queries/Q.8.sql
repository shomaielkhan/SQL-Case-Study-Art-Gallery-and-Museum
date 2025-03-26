--8. Museum_Hours table has 1 invalid entry. Identify it and remove it.

select mh.museum_id, mh.day, mh.open, mh.close
from museum_hours mh
left join museum m on mh.museum_id = m.museum_id
where m.museum_id is null
	or not exists(
	select 1 from museum m2 where m2.museum_id = mh.museum_id
	)
	or
	mh.day is null or mh.day = ''
	or mh.open is null or mh.open =''
	or mh.close 	is null or mh.close = '';
