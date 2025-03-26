--1. Fetch all the paintings which are not displayed on any museums?
select w.name, w.artist_id
from work w
left join museum m on w.museum_id= m.museum_id
where w.museum_id is null;
