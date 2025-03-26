
--9. Fetch the top 10 most famous painting subject

select s.subject, count(w.work_id) as paintings
from subject s
join work w on s.work_id= w.work_id
group by s.subject
order by paintings desc
limit 10

use database Painting;

select * from artist;