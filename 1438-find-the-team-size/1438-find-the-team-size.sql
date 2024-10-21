/* Write your T-SQL query statement below */

with firstt as (select team_id, count(team_id) as team_size
                from Employee
                group by team_id)

select employee_id, team_size
from Employee e
left join firstt f
on e.team_id = f.team_id