/* Write your T-SQL query statement below */

select user_id, time_stamp as last_stamp
from (
        select *, max(rnk) over(partition by user_id) as maxx
        from (
                select *, 
                        rank() over(partition by user_id order by time_stamp) as rnk
                from Logins
                where user_id in (
                                    select distinct user_id
                                    from Logins
                                    where year(time_stamp) = 2020)
                and year(time_stamp) = 2020) s
        group by user_id, time_stamp, rnk) d
where rnk = maxx        
        