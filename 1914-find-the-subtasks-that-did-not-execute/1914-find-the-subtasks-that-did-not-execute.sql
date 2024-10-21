/* Write your T-SQL query statement below */


-- using recursive cte to create table one_twenty

with one_twenty (num_task) as (

    select 1

    union all

    select num_task + 1
    from one_twenty
    where num_task < 20),

-- select *
-- from one_twenty

secondd as (select *, 
    case
        when o.num_task <= t.subtasks_count then 1 else 0
    end as ff
from Tasks t
cross join one_twenty o),


fix as (select task_id, num_task
from secondd
where ff = 1)


select f.task_id, f.num_task as subtask_id
from fix f
left join Executed e
on f.task_id = e.task_id and f.num_task = e.subtask_id
where e.task_id is null
order by f.task_id, f.num_task