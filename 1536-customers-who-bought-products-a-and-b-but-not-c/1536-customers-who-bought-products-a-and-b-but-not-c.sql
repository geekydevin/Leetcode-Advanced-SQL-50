/* Write your T-SQL query statement below */

select customer_id, customer_name
from (
    select customer_id, customer_name, string_agg(product_name, ', ') within group(order by customer_id, customer_name) as listt
    from (
        select c.customer_id, c.customer_name, o.product_name
        from Customers c
        left join Orders o
        on c.customer_id = o.customer_id) s
    group by customer_id, customer_name) d
where listt like '%A%' and listt like '%B%' and listt not like '%C%'
order by customer_id