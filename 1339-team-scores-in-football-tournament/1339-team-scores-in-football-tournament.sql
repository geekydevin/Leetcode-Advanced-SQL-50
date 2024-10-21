/* Write your T-SQL query statement below */

with firstt as (
                select *, 
                        case
                            when host_goals > guest_goals then 3 
                            when host_goals = guest_goals then 1 
                            else 0
                        end as host_score,
                        case
                            when host_goals < guest_goals then 3 
                            when host_goals = guest_goals then 1 
                            else 0
                        end as guest_score
                from Matches),

secondd as (select host_team, host_score
            from firstt
            union all
            select guest_team, guest_score
            from firstt),

thirdd as (select host_team, sum(host_score) as num_points
            from secondd
            group by host_team)

select t.team_id, t.team_name, coalesce(d.num_points, 0) as num_points
from Teams t
left join thirdd d
on t.team_id = d.host_team
order by coalesce(d.num_points, 0) desc, t.team_id asc
