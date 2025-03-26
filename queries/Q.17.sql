--17. Identify the artists whose paintings are displayed in multiple countries

with ArtistCountries as( 
	select artist.full_name, artist.artist_id, m.country
	from work w
	join artist on w.artist_id= artist.artist_id
	join museum m on w.museum_id=m.museum_id
	where m.country is not null
	group by artist.full_name, artist.artist_id, m.country 
)

select ac.artist_id, ac.full_name, count(ac.country) as country_count,
	STRING_AGG(ac.country,', ') as countries_list
from ArtistCountries ac
group by ac.artist_id, ac.full_name
having count(distinct ac.country)>1
order by country_count desc;
