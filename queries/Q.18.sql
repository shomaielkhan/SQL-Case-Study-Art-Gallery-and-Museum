--18. Display the country and the city with most no of museums. Output 2 seperate
--columns to mention the city and country. If there are multiple value, seperate them
--with comma

with countryCount as(
	select country, count(*) as total_museums
	from museum
	where country is not null
	group by country
),

maxCountry as(
	select country from countryCount
	where total_museums= (select max(total_museums) from countryCount)
),

cityCount as(
	select city, count(*) as total_museums
	from museum
	where city is not null
	group by city
),

maxCity as(
	select city from cityCount
	where total_museums= (select max(total_museums) from cityCount)
)
select country as most_museum_locations,  'country' as type from maxCountry
union all
select city as most_museum_cities,  'city' as type from maxCity
;
