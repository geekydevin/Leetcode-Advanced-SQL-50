/* Write your T-SQL query statement below */

with firstt as (
                select o.customer_id, c.name, 
                        format(o.order_date, 'yyyy-MM') as monthh,
                        sum((o.quantity * p.price)) as total_buy
                from Orders o
                left join Customers c
                on o.customer_id = c.customer_id
                left join Product p
                on o.product_id = p.product_id
                group by o.customer_id, c.name, format(o.order_date, 'yyyy-MM'), o.quantity, p.price),

elig_june as (select *
                from firstt
                where monthh = '2020-06'
                group by customer_id, name, monthh, total_buy
                having sum(total_buy) >= 100)            

select customer_id, name --, sum(total_buy) as total_buy
from firstt
where monthh = '2020-07' and customer_id in (select customer_id from elig_june)
group by customer_id, name
having sum(total_buy) >= 100