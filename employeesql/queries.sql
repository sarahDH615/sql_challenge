--List the following details of each employee: employee number, last name, first name, sex, and salary
-- select employees.emp_no, employees.last_name, employees.first_name, employees.sex, (
-- 	select salary from salaries where employees.emp_no = salaries.emp_no
-- )
-- from employees;

--List first name, last name, and hire date for employees who were hired in 1986
-- select first_name, last_name, hire_date
-- from employees
-- where extract (year from hire_date) = 1986;

--List manager of each department with: department number, department name, the manager's employee number, last name, first name
-- select dept_manager.dept_no, (
-- select departments.dept_name from departments where departments.dept_no = dept_manager.dept_no
-- ), (
-- select employees.last_name from employees where employees.emp_no = dept_manager.emp_no
-- ), (
-- select employees.first_name from employees where employees.emp_no = dept_manager.emp_no
-- ),
-- dept_manager.emp_no
-- from dept_manager;

--List the department of each employee with: employee number, last name, first name, department name
--! Having trouble
-- select emp_no, first_name, last_name, (
-- 	dept_name from departments where departments.dept_no in (
-- 		select dept_no from dept_emp where dept_emp.emp_no = employees.emp_no
-- 	)
-- );
-- select dept_name from departments where dept_no in (
-- 	select dept_no from dept_emp where emp_no in (
-- 		select emp_no from employees
-- 	)
-- );

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
-- select first_name, last_name, sex from employees where first_name = 'Hercules' and last_name like 'B%';

-- List all employees in Sales department, including employee number, last name, first name, department name
select first_name, last_name, (select dept_name from departments where dept_name = 'Sales') 
from employees where emp_no in (
	select emp_no from dept_emp where dept_no in (
		select dept_no from departments where dept_name = 'Sales'
	)
);


	
