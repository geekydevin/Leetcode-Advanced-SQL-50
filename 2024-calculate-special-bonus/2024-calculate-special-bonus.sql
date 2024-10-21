/* Write your T-SQL query statement below */

select employee_id, bonus
from (
    select *, 
            case
                when (employee_id % 2 <> 0) and (left(name, 1) <> 'M') then salary else 0
            end as bonus
    from Employees) s    
order by employee_id    