/* Write your T-SQL query statement below */

with leadss as (select date_id, make_name, count(distinct lead_id) as unique_leads
from DailySales
group by date_id, make_name),

partners as (select date_id, make_name, count(distinct partner_id) as unique_partners
from DailySales
group by date_id, make_name)

select l.date_id, l.make_name, l.unique_leads, p.unique_partners
from leadss l
left join partners p
on l.date_id = p.date_id and l.make_name = p.make_name