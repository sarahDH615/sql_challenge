--List the following details of each employee: employee number, last name, first name, sex, and salary
-- select employees.emp_no, employees.last_name, employees.first_name, employees.sex, (
-- 	select salary from salaries where employees.emp_no = salaries.emp_no
-- )
-- from employees;

--List first name, last name, and hire date for employees who were hired in 1986
select first_name, last_name, hire_date
from employees
where extract (year from hire_date) = 1986;