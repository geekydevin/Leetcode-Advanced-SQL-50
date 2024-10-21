/* Write your T-SQL query statement below */


-- simplify the code by merging Failed and Succeeded into one table and then process it

-- 1. merge Failed and Succeede into one table

with firstt as (select 'succeeded' as status, success_date as datee, day(success_date) as dayy, month(success_date) as monthh, 1 as year_2019
from succeeded
where YEAR(success_date) = 2019
union all
select 'failed' as status, fail_date as datee, day(fail_date) as dayy, month(fail_date) as monthh, 1 as year_2019
from failed
where YEAR(fail_date) = 2019),


-- 2. row_number-ing the day -> diff_day

-- for dayy2/diff_day we calculate the day from '2019-01-01' not the day as is,
--     so '2019-01-01' would be day 0, '2019-01-02' would be day 1, and so on

-- for rn_day, we don't partition by month so it would spread across months,

-- it will balance out for day (count from '2019-01-01') and rn_day (partition by status, across months) -> bigger number of dayy - bigger rn_day

secondd as (select *, 
	ROW_NUMBER() over(partition by status order by datee) as rn_day,
    datediff(day, '2019-01-01', datee) as dayy2,
	(datediff(day, '2019-01-01', datee) - ROW_NUMBER() over(partition by status order by datee)) as diff_day
from firstt),


-- 3. row_number-ing the months available 
rn_month as (select monthh, ROW_NUMBER() over(order by monthh) as rn_month
from (select distinct MONTH(datee) as monthh from firstt) s),


-- 4. make concat of diff_day, monthh, diff_month, year_2019 -> ff
thirdd as (select s.status, s.datee, s.rn_day, (s.monthh - r.rn_month) as diff_month, s.year_2019, CONCAT(s.diff_day, (s.monthh - r.rn_month), s.year_2019) as ff
from secondd s
left join rn_month r
on s.monthh = r.monthh),


-- 5. looking for consecutive days
fourthh as (select t1.status, t1.datee as t1d, t2.datee as t2d, t1.ff as t1f, t2.ff as t2f
from thirdd t1
left join thirdd t2
on t1.status = t2.status
where DATEDIFF(day, t1.datee, t2.datee)=1),


-- 6. separating dates between consecutive and non consecutive dates and grouping them together
fifthh as (select t.status, t.datee,
		case
			when t.ff = f.t1f then t.ff
			when t.ff = f.t2f then t.ff
			else CONCAT(t.ff, 'o')
		end as ff_final
from thirdd t
left join fourthh f
on (t.status = f.status and t.datee=f.t1d and t.ff = f.t1f) or (t.status = f.status and t.datee=f.t2d and t.ff = f.t2f))


-- 7. final result/final grouping
select status as period_state, MIN(datee) as start_date, MAX(datee) as end_date
from fifthh
group by status, ff_final
order by min(datee)