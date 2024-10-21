/* Write your T-SQL query statement below */

-- some test cases contain different customer_id with same customer_name, so make sure to use partition_by customer_name & customer_id
--     e.g: yaffah (86) and yaffah (99)

with firstt as (select c.name as customer_name, 
                        o.customer_id, 
                        o.order_id, 
                        o.order_date, 
                        rank() over(partition by c.name, c.customer_id order by o.order_date desc) as rn
                from Orders o
                left join Customers c
                on o.customer_id = c.customer_id)

select customer_name, customer_id, order_id, order_date
from firstt 
where rn <=3
order by customer_name, customer_id, order_date desc


