/* Write your T-SQL query statement below */

with firstt as (select employee_id
                from Employees
                union
                select employee_id
                from Salaries),

secondd as (
            select f.employee_id, e.name, s.salary
            from firstt f
            left join Employees e
            on f.employee_id = e.employee_id
            left join Salaries s
            on f.employee_id = s.employee_id)      

select employee_id
from secondd      
where name is null or salary is null           
order by employee_id