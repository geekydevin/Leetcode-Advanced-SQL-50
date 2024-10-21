/* Write your T-SQL query statement below */

select u.name, sum(amount) as balance
from Transactions t
left join Users u
on t.account = u.account
group by u.name
having sum(amount) > 10000
