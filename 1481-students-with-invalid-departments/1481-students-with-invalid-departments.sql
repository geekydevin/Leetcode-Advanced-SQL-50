/* Write your T-SQL query statement below */

select s.id, s.name
from Students s
left join Departments d
on s.department_id = d.id
where d.id is null