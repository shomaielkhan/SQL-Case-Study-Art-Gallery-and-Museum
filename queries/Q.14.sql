
--14. Which museum is open for the longest during a day. Dispay museum name, state
--and hours open and which day?

SELECT m.state as state, mh.day,  
       (CAST(TRIM(REPLACE(mh.close, ' ', '')) AS TIME) -  
        CAST(TRIM(REPLACE(mh.open, ' ', '')) AS TIME)) AS hours_open  
FROM museum_hours mh  
JOIN museum m ON mh.museum_id = m.museum_id  
order by hours_open desc limit 5;

select * from artist;
select * from canvas_size;
select * from image_link;
select * from museum;
select * from museum_hours;
select * from product_size;
select * from subject;
select * from work;
