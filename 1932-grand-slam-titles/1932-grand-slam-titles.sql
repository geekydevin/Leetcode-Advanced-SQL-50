/* Write your T-SQL query statement below */

with firstt as (select Wimbledon as player_id
                from Championships
                union all 
                select Fr_open
                from Championships
                union all
                select US_open
                from Championships
                union all
                select Au_open
                from Championships)

select f.player_id, p.player_name, count(f.player_id) as grand_slams_count
from firstt f
join Players p
on f.player_id = p.player_id
group by f.player_id,  p.player_name