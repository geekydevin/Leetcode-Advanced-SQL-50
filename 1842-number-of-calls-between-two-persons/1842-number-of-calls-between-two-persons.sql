/* Write your T-SQL query statement below */


-- kinda tricky, but the clue is in this 'each pair of distinct persons (person1, person2) where person1 < person2'

-- modify all pair column based on condition person1 < person2

with firstt as (select *,
    case
        when from_id < to_id then from_id else to_id
    end as person1,
    case
        when to_id > from_id then to_id else from_id
    end as person2
from Calls),


secondd as (select person1, person2, concat(person1, person2) as joinn, duration
from firstt)

select person1, person2, count(joinn) as call_count, sum(duration) as total_duration
from secondd
group by person1, person2