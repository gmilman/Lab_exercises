use irondb;
select * from purchases;


Select users.name, sum(price)
From users
Left join purchases
On users.name = purchases.user
group by users.name;

select item, sum(price)
from purchases
group by item;

select (count(*) - count(user_exp.exp))/count(*)*100 as percent_no_exp
from
	(Select users.name, sum(price) as exp
	From users
	Left join purchases
	On users.name = purchases.user
	group by users.name) as user_exp;

select item, date_format(date_purchased, "%b"), sum(price)
from purchases
group by 2, item;

-- self join --

select empl.employee_name, man.employee_name as manager_name
from employees empl
left join employees man
	on empl.manager_id = man.employee_id;
 
 select * from training;

-- Write a query to get a list of:
--  employees’ names who attended more than one training session on the same day. 
-- Please include the names of the training sessions and their dates of attendance.

select employee, att_date, training
from ( select att_date, employee, count(employee) as nb_training 
		from training
		group by att_date, employee) as training_dup
where training_dup.nb_training > 1;

select employees.employee_name, training.training, training.att_date
from 
	(select employee, att_date, count(*) as nb_training 
	from training
	group by att_date, employee
	having nb_training > 1) as min_two -- table containing minimum two trainings on same day
inner join employees
	on min_two.employee = employees.employee_id
inner join training
	on training.employee = min_two.employee and training.att_date = min_two.att_date
order by employee_name;

use  irondb;

set sql_mode = 'full group by';

SELECT e.employee_name, t1.att_date, t1.training, t1.feedback, t2.training, t2.feedback
FROM employees e
JOIN training t1 ON e.employee_id=t1.employee
JOIN training t2 ON t1.att_date=t2.att_date and t1.employee=t2.employee
GROUP BY t1.att_date, e.employee_name
HAVING COUNT(DISTINCT t1.training) > 1;

-- Andy's version: with [transitory table name] as (select statement)
-- called common table expression CTE
use irondb;

with employees_on_multiple_trainings as ( 
select employee, att_date, count(*) as no_of_trainings
from training t
group by 1, 2
having count(*) > 1)

select e.employee, e.att_date, training
from employees_on_multiple_trainings e
inner join training t
	on e.employee = t.employee and e.att_date = t.att_date
;
