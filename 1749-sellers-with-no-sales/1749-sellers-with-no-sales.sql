/* Write your T-SQL query statement below */

select seller_name
from (
        select seller_name, sum(check_year) as sum_check
        from(
                select s.seller_name, 
                        case
                            when year(o.sale_date) ='2020' then 1 else 0
                        end as check_year
                from Seller s
                left join Orders o
                on s.seller_id = o.seller_id) s
        group by seller_name) d
where sum_check = 0