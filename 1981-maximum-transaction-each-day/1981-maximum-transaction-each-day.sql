/* Write your T-SQL query statement below */

with firstt as (select *, format(day, 'yyyy-MM-dd') as day_2
                from Transactions),

secondd as (select *, rank() over(partition by day_2 order by amount desc) as rn
from firstt)                

select transaction_id
from secondd
where rn = 1
order by transaction_id