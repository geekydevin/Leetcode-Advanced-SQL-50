/* Write your T-SQL query statement below */

with firstt as (select p.project_id, p.employee_id, e.name, e.experience_years, 
        rank() over(partition by p.project_id order by e.experience_years desc) as rn
                from Project p
                left join Employee e
                on p.employee_id = e.employee_id)

select project_id, employee_id
from firstt
where rn = 1