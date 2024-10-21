/* Write your T-SQL query statement below */

with firstt as (select *, lag(visit_date) over(partition by user_id ORDER by visit_date) as ss, 
datediff(day, lag(visit_date) over(partition by user_id ORDER by visit_date), visit_date) as dayy
from UserVisits),

secondd as (SELECT user_id, dayy
from firstt
WHERE dayy is not null),

thirdd as (select user_id, 
        visit_date,
        count(user_id) over(partition by user_id) as cnt, 
        rank() over(partition by user_id order by visit_date) as rn
from UserVisits),

fourth as (select user_id, datediff(day, visit_date, '2021-01-01') as dayy
from thirdd
where cnt = rn),

fifthh as (select user_id, dayy
from secondd
union all
select user_id, dayy
from fourth),

sixthh as (select *, max(dayy) over(partition by user_id) as max_day
from fifthh)

select distinct user_id, dayy as biggest_window
from sixthh
where dayy = max_day




