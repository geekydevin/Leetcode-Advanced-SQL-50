/* Write your T-SQL query statement below */

with firstt as (
            select product_id,
                    case
                        when store1 is not null then 'store1'
                    end as store,
                    case
                        when store1 is not null then store1 
                    end as price
            from Products
            union all
            select product_id,
                    case
                        when store2 is not null then 'store2'
                    end as store,
                    case
                        when store2 is not null then store2
                    end as price
            from Products
            union all
            select product_id,
                    case
                        when store3 is not null then 'store3' 
                    end as store,
                    case
                        when store3 is not null then store3 
                    end as price
            from Products)

select *
from firstt
where store is not null and price is not null            