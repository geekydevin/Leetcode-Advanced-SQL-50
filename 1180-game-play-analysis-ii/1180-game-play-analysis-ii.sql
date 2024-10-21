/* Write your T-SQL query statement below */

with firstt as (select *, row_number() over(partition by player_id order by event_date) as rn
from Activity)

select player_id, device_id
from firstt
where rn = 1