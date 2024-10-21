/* Write your T-SQL query statement below */

with firstt as (select e1.employee_id as e1_emp, 
        e1.manager_id as e1_man,
        -- e2.employee_id, 
        e2.manager_id as e2_man,
        -- e3.employee_id,
        e3.manager_id as e3_man
from Employees e1
left join Employees e2
on e1.manager_id = e2.employee_id
left join Employees e3
on e2.manager_id = e3.employee_id)

select e1_emp as employee_id
from firstt
where e1_emp <> 1 and e3_man = 1