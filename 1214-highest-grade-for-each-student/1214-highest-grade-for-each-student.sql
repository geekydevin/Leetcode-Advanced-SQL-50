/* Write your T-SQL query statement below */

select student_id, course_id, grade
from(
    select *, rank() over(partition by student_id order by grade desc, course_id asc) as rnk
    from Enrollments) s
where rnk = 1    