/* Write your T-SQL query statement below */

with firstt as (select *,
                case
                    when user1_id = 1 then user2_id
                    when user2_id = 1 then user1_id
                end as friend_list
        from Friendship)
        
select distinct page_id as recommended_page 
from firstt f
join Likes l
on f.friend_list = l.user_id
where page_id not in (select page_id
                        from Likes
                        where user_id = 1)
