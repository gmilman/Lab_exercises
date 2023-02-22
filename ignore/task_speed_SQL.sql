create schema	task_speed;
use task_speed;
create table Employees 
(Empl_ID int, Name varchar(255), surname varchar (255), Department varchar(255), Salary float);

-- 1. unique dept.
select distinct Department from Employees;

-- 2. full name and taxes
select concat( name, ' ' ,surname) as employeed_name, salary *0.2
from employees;

 -- get the maximum and minimum salary from employees table
select max(salary), min(salary);
Select * from employees;

SELECT surname, salary
from employees
where salary = max(salary)
union all
select surname, salary
from employees
where salary = min(salary);

SELECT surname, salary FROM employees
WHERE salary IN ((SELECT MAX(salary) FROM employees), (SELECT MIN(salary) FROM employees));

 -- get the average salary per department
select avg(salary), department 
from employees
group by department;

