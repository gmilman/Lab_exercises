use employees_mod;

# 2. procedure for avg salary

# use in and out for input and output variables
drop procedure get_avg_salary;
DELIMITER $$
CREATE PROCEDURE get_avg_salary()
BEGIN
  DECLARE avg INT;
  SELECT avg(salary) INTO avg FROM t_salaries;
  SELECT avg;
END $$
DELIMITER ;

call get_avg_salary();

# 3. Create a procedure called ‘emp_info’ that uses as parameters the first and the last name of an individual, and returns their employee number.
Drop procedure emp_info;
Delimiter $$
CREATE PROCEDURE emp_info(in f_name varchar(50), in l_name varchar(50), out  employee_no int)
Begin
	
    select emp_no into employee_no from t_employees e
    where e.first_name= f_name and e.last_name=l_name;
   


end $$ 
Delimiter ;

call emp_info('Mary', 'Sluis',@employee_no);
select @employee_no;

drop procedure emp_info;

#Create a function called ‘emp_info’ that takes for parameters the first and last name of an employee, and returns the salary from the newest contract of that employee.
# Hint: In the BEGIN-END block of this program, you need to declare and use two variables – v_max_from_date that will be of the DATE type, and v_salary, that will be of the DECIMAL (10,2) type.

Delimiter $$
create procedure emp_info(in f_name varchar(50), in l_name varchar(50))
begin
Declare v_max_from_date date;
Declare v_salary decimal(10,2);

select max(to_date) into v_max_from_date from t_salaries s
join t_employees e
on s.emp_no = e.emp_no
where  e.first_name=f_name and e.last_name=l_name ;


select salary into v_salary from t_salaries s
join t_employees e
on s.emp_no = e.emp_no
where e.first_name=f_name and e.last_name=l_name and s.to_date=v_max_from_date;
select v_salary;
end $$
Delimiter ;

call emp_info('Mary', 'Sluis');

# should probably put from date to be sure

# 6. Create a trigger that checks if the hire date of an employee is higher than the current date. 
#If true, set this date to be the current date. Format the output appropriately (YY-MM-DD)

delimiter $$
create trigger update_hire_date
BEFORE INSERT ON t_employees 
for each row
begin
	if new.hire_date > current_date then
    set new.hire_date = current_date;
    end if;
end $$
delimiter ;

insert into t_employees values (20059, '1987-10-11', 'Etienne', 'Giacch','m', '2024-03-22');
# works
SELECT * FROM employees_mod.t_employees
where first_name='Etienne';

# 7. Create ‘i_hire_date’ and Drop the ‘i_hire_date’ index.

alter table t_employees add column i_hire_date date after hire_date;
alter table t_employees drop column i_hire_date;

# 8. Select all records from the ‘salaries’ table of people whose salary is higher than $89,000 per annum.
# Then, create an index on the ‘salary’ column of that table, and check if it has sped up the search of the same SELECT statement.

SET profiling = 1;
select * from t_employees e
join t_salaries s
on e.emp_no= s.emp_no
where salary > 89000;

SELECT SUM(duration) as total_duration
FROM information_schema.profiling;
 # total duration = 0.029060 seconds
 
 CREATE INDEX idx_salary ON t_salaries (salary);

# reset profiling
SET profiling_history_size = 0;
set profiling=0;
set profiling=1;
SET profiling_history_size = 0;
select * from t_employees e
join t_salaries s
on e.emp_no= s.emp_no
where salary > 89000;

# too quick to measure

SELECT SUM(duration) as total_duration
FROM information_schema.profiling;

SHOW VARIABLES LIKE 'profiling';
SHOW VARIABLES LIKE 'performance_schema';


 
#9. Use Case statement and obtain a result set containing the employee number, first name, and last name of all employees 
# with a number higher than 109990. 
#Create a fourth column in the query, indicating whether this employee is also a manager, 
# according to the data provided in the dept_manager table, or a regular employee. 

# 10. Extract a dataset containing the following information about the managers: employee number, first name, and last name. Add two columns at the end – one showing the difference between the maximum and minimum salary of that employee, and another one saying whether this salary raise was higher than $30,000 or NOT.
# 11. Extract the employee number, first name, and last name of the first 100 employees, and add a fourth column, called “current_employee” saying “Is still employed” if the employee is still working in the company, or “Not an employee anymore” if they aren’t. Hint: You’ll need to use data from both the ‘employees’ and the ‘dept_emp’ table to solve this exercise. 