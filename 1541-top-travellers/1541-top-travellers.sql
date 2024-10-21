/* Write your T-SQL query statement below */

select name, travelled_distance
from (
        select u.id, u.name, coalesce(sum(distance), 0) as travelled_distance 
        from Users u
        left join Rides r
        on u.id = r.user_id
        group by u.id, u.name) s
order by travelled_distance desc, name asc