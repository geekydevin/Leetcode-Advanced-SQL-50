/* Write your T-SQL query statement below */

-- lesson learned:
-- we can't just come and doing comparison operator = '>' then left_operand > right_operand and so on becaue sql doesn't allow it

-- here’s why it doesn't work:

--     SQL evaluates operator = ">" as a string comparison, not an actual operation.
--     SQL does not dynamically execute conditions like left_operand > right_operand based on the value of the operator string.

-- we need to break the problem down by using individual CASE expressions for each comparison instead of trying to perform the comparison dynamically.

with firstt as (
                select e.left_operand, 
                        e.operator, 
                        e.right_operand,
                        v1.value as v1_value,
                        v2.value as v2_value,
                        case
                            when operator = '>' then case
                                when v1.value > v2.value then 1 else 0 end
                            when operator = '<' then case
                                when v1.value < v2.value then 1 else 0 end
                            when operator = '=' then case 
                                when v1.value = v2.value then 1 else 0 end
                        end as valuee
                from Expressions e
                left join Variables v1
                on e.left_operand = v1.name
                left join Variables v2
                on e.right_operand = v2.name)
select left_operand, operator, right_operand,
        case
            when valuee = 1 then 'true' else 'false'
        end as value  
from firstt                      