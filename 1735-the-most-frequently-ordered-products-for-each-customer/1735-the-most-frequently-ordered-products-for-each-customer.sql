/* Write your T-SQL query statement below */

with firstt as (select o.customer_id, o.product_id, p.product_name, count(o.product_id) as cnt
                from Orders o
                left join Customers c
                on o.customer_id = c.customer_id
                left join Products p
                on o.product_id = p.product_id
                group by o.customer_id, o.product_id, p.product_name),


secondd as (select customer_id, max(cnt) as maxx
            from firstt
            group by customer_id)

select f.customer_id, f.product_id, f.product_name
from firstt f
left join secondd s
on f.customer_id = s.customer_id
where f.cnt = s.maxx            
