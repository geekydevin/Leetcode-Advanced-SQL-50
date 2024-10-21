/* Write your T-SQL query statement below */

select round((sum(status) * 100.0) /count(status), 2) as immediate_percentage
from (
        select *, 
                case
                    when order_date = customer_pref_delivery_date then 1 else 0
                end as status
        from Delivery) s