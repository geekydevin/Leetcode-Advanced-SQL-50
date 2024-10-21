/* Write your T-SQL query statement below */

-- check whether an account_id's login time in ip_address_2 is in between login & logout time ip_address_1 and vice versa

with firstt as (select l1.account_id as l1acc, l1.ip_address as l1ip, l1.login as l1in, l1.logout as l1out,
						l2.account_id as l2acc, l2.ip_address as l2ip, l2.login as l2in, l2.logout as l2out,
                        
						case
							when l1.logout>=l2.login and l1.logout <= l2.logout then 1 else 0
						end as stat1,
                        case
							when l2.logout>=l1.login and l2.logout <= l1.logout then 1 else 0
						end as stat2
from LogInfo l1
left join LogInfo l2
on l1.account_id = l2.account_id and l1.ip_address < l2.ip_address)


select distinct l1acc as account_id
from firstt
where stat1 = 1 or stat2 = 1