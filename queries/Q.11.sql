--11. How many museums are open every single day?

select open, close, count(distinct mh.day ) as open_days
from museum_hours mh
group by mh.open, mh.close 
having count(Distinct mh.day)=6;
