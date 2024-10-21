/* Write your T-SQL query statement below */

select actor_id, director_id --, count(timestamp) as cnt_work
from ActorDirector 
group by actor_id, director_id
having count(timestamp) >= 3