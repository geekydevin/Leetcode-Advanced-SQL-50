/* Write your T-SQL query statement below */

select player_id, event_date as first_login
from (
        select *, 
                rank() over(partition by player_id order by event_date) as rn
        from Activity) s
 where rn = 1