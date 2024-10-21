/* Write your T-SQL query statement below */

select distinct c.title as Title --, c.Kids_content, c.content_type, format(t.program_date, 'yyyy-MM') as monthh
from Content c
left join TVProgram t
on c.content_id = t.content_id
where c.Kids_content = 'Y' and format(t.program_date, 'yyyy-MM') = '2020-06' and c.content_type = 'Movies'