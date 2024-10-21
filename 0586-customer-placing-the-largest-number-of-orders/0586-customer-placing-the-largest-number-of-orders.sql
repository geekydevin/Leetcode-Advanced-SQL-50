/* Write your T-SQL query statement below */

select customer_number
from (
        select customer_number, rank() over(order by cnt_order desc) as rn
        from (
                select customer_number, count(order_number) as cnt_order
                from Orders
                group by customer_number) s) d
where rn = 1                
