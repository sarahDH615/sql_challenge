--List the following details of each employee: employee number, last name, first name, sex, and salary
--everything save salary is in the employees table
--use a subquery to get salary in the select statement
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, (
 	select salary from salaries where employees.emp_no = salaries.emp_no
)
from employees;

--List first name, last name, and hire date for employees who were hired in 1986
--everything needed is in employees table
--using a where statement to limit results to year 1986
select first_name, last_name, hire_date
from employees
where extract (year from hire_date) = 1986;

--List manager of each department with: department number, department name, the manager's employee number, last name, first name
--need values from different tables - first name and last name from employees, department name from departments, department # from department/department_manager
--using subqueries to get different values in the select statement
select dept_manager.dept_no, (
    select departments.dept_name from departments where departments.dept_no = dept_manager.dept_no
), (
    select employees.last_name from employees where employees.emp_no = dept_manager.emp_no
), (
    select employees.first_name from employees where employees.emp_no = dept_manager.emp_no
),
dept_manager.emp_no
from dept_manager;

--List the department of each employee with: employee number, last name, first name, department name
--need values: empt_no from dept_emp/employees,  first and last name from employees, dept_name from departments
--using join to join on emp_no btwn employees and dept_emp, and join on dept_no btwn dept_emp and departments
select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
join dept_emp on dept_emp.emp_no = employees.emp_no
join departments on dept_emp.dept_no = departments.dept_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
--everything needed is in employees table
--using a where statement to limit employees to Hercules Bs
select first_name, last_name, sex 
from employees 
where first_name = 'Hercules' and last_name like 'B%';

--List all employees in Sales department, including employee number, last name, first name, department name
--need values emp_no from dept_emp/employees, first and last name from employees, dept_name from departments
--using join to join on emp_no btwn employees and dept_emp and join on dept_no btwn dept_emp and departments
--using where statement to limit department to Sales
select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
join dept_emp on dept_emp.emp_no = employees.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales';

--List all employees in Sales, Development departments, including employee number, last name, first name, department name
--same as above query, save where statement has an or within it for the two departments
select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
join dept_emp on dept_emp.emp_no = employees.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales' or dept_name = 'Development';

--In descending order, list the frequency count of employee last names
--need values only from employees table
--using emp_no as unique vals to count
--use a group by to collect emp_nos by last name col
--use an order by to rank by num of employees in desc order
select last_name, count(emp_no) as "num_of_employees"
from employees
group by last_name
order by "num_of_employees" desc;