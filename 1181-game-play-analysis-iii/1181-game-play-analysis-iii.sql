/* Write your T-SQL query statement below */

select player_id, event_date, sum(games_played) over(partition by player_id order by event_date rows between unbounded preceding and current row) as games_played_so_far
from Activity
