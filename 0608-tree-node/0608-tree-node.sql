/* Write your T-SQL query statement below */

with firstt as (select p_id, count(p_id) as cnt_id
from Tree
group by p_id),

secondd as (select t.id, t.p_id,
                    f.p_id as f_p_id,
                    cnt_id
            from Tree t
            left join firstt f
            on t.id = f.p_id),

-- select *
-- from secondd

thirdd as (select *, 
    case
        when p_id is null then 'Root'
        when p_id is not null and cnt_id is not null then 'Inner'
        else 'Leaf'
    end as type
from secondd)

select id, type
from thirdd



-- select distinct t1.id, case when t1.p_id is null then 'Root'
-- when t2.p_id is null then 'Leaf'
-- else 'Inner' end as Type
-- from tree t1
-- left join tree t2 
-- on t1.id = t2.p_id

-- -----or------

-- select id,
-- case when p_id is null then 'Root'
--      when id in (select distinct p_id from tree) then 'Inner'
--      else 'Leaf' end as Type
-- from tree


