--7. Identify the museums with invalid city information in the given dataset

select museum_id, name, city
from museum
where city in(
	select distinct city from museum
	where city is null or city  = '' or city !~ '^[A-Za-z\s]+$'
	) ;

