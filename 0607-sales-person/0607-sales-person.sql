/* Write your T-SQL query statement below */

select name
from SalesPerson
where name not in (select sales_name from(
        select s.name as sales_name, c.name as name_com
        from Orders o
        left join Company c
        on o.com_id = c.com_id
        right join SalesPerson s
        on o.sales_id = s.sales_id
        where c.name like 'RED') s)