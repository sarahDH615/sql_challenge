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
select dept_manager.dept_no, (
select departments.dept_name from departments where departments.dept_no = dept_manager.dept_no
), (
select employees.last_name from employees where employees.emp_no = dept_manager.emp_no
), (
select employees.first_name from employees where employees.emp_no = dept_manager.emp_no
),
dept_manager.emp_no
from dept_manager;
