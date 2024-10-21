/* Write your T-SQL query statement below */

-- join all to find which student is quiet
with firstt as (select *, 
        case
            when score <> min(score) over(partition by exam_id) then 1 else 0
        end as cek_high,
        case
            when score <> max(score) over(partition by exam_id) then 1 else 0
        end as cek_low
from Exam),

-- find all students who scored low and high
low_high as (select distinct student_id
from firstt
where (cek_high = 1 and cek_low = 0) or (cek_high = 0 and cek_low = 1)),

-- find all student who took exam
examm as (select distinct student_id
from Exam)

select student_id, student_name
from Student
where student_id not in (select * from low_high) and student_id in (select * from examm)
