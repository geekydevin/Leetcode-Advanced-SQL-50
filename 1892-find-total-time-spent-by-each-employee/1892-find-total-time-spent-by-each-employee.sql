/* Write your T-SQL query statement below */

select event_day as day, emp_id, sum(out_time-in_time) as total_time
from Employees
group by event_day, emp_id