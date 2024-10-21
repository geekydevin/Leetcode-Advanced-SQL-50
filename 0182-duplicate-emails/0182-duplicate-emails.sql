/* Write your T-SQL query statement below */

select email as Email --, count(email) as cnt
from Person
group by email
having count(email) > 1