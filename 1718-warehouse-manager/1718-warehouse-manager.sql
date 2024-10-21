/* Write your T-SQL query statement below */

with firstt as (select product_id, (Width*Length*Height) as volume
from Products)

select w.name as warehouse_name , sum((w.units*f.volume)) as volume
from Warehouse w
left join firstt f
on w.product_id = f.product_id
group by w.name
