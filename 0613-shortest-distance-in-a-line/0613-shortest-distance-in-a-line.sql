/* Write your T-SQL query statement below */

with firstt as (
                select p1.x as p1x, p2.x as p2x,
                        abs(p1.x-p2.x) as shortest
                from Point p1
                cross join Point p2)

select distinct min(shortest) as shortest
from firstt
where shortest >0