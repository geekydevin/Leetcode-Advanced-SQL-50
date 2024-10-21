/* Write your T-SQL query statement below */

with firstt as (select c.caller_id, left(p.phone_number, 3) as phone_number, duration
                from Calls c
                left join Person p
                on c.caller_id = p.id
                union all
                select c.callee_id, left(p.phone_number, 3), duration
                from Calls c
                left join Person p
                on c.callee_id = p.id),

country_all as (select f.caller_id, c.name, f.duration
                from firstt f
                left join Country c
                on f.phone_number = c.country_code),  

-- select (2.0 * sum(duration))/(2* count(duration)) as avg_global
-- from Calls

calc_all as (select name, avg(duration*1.0) as avg_call, 
                    (select (2.0 * sum(duration))/(2* count(duration)) as avg_global from Calls) as avg_global
            from country_all
            group by name)

select name as country
from calc_all
where avg_call > avg_global