/* Write your T-SQL query statement below */

with firstt as (select *, row_number() over(order by log_id) as rn
                from Logs),

secondd as (select *, (log_id-rn) as dd
            from firstt)

select min(log_id) as start_id, max(log_id) as end_id
from secondd            
group by dd