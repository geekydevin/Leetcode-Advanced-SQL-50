/* Write your T-SQL query statement below */

with firstt as(select o.order_id, 
                    o.order_date, 
                    o.product_id, 
                    p.product_name, 
                    rank() over(partition by o.product_id, p.product_name order by order_date desc) as rn
                from Orders o
                left join Products p
                on o.product_id = p.product_id)

select product_name, product_id, order_id, order_date
from firstt
where rn = 1
order by product_name, product_id, order_id