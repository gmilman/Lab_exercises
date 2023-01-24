use irondb;
select * from purchases;


Select users.name, sum(price)
From users
Left join purchases
On users.name = purchases.user
group by users.name;

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

select employee_name, training, att_date
from 
	(select att_date, employee, count(employee) as nb_training 
	from training
	group by att_date, employee
	having nb_training > 1) as min_two
join


select employee_name, training, att_date, 
from employee
left join training
on employee_id = employee
where 4 > 1
group by att_date, employee_name, training;
