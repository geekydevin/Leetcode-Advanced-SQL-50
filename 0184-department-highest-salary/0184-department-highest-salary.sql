/* Write your T-SQL query statement below */

with firstt as (select e.id, e.name as Employee, e.salary as Salary, d.name as Department
                from Employee e
                left join Department d
                on e.departmentId = d.id),

secondd as (select Department, Employee, Salary, 
            rank() over(partition by Department order by Salary desc) as rn
            from firstt) 

select Department, Employee, Salary
from secondd
where rn = 1            
               