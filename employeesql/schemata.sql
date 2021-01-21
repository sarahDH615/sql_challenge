--create titles table
--both columns take strings
--the title id column holds unique identifiers, so it will be the primary key
create table titles (
	title_id varchar primary key,
	title varchar
);

--checking whether the columns were added to the titles table properly
select * from titles;

--create employees table
--cols are either strings or dates
--emp_title_id col matches the title_id col in titles table (foreign key)
--emp_no col holds unique values (primary key)
create table employees (
	emp_no int primary key,
	emp_title_id varchar,
	birth_date date,
	first_name varchar,
	last_name varchar,
	sex varchar(1),
	hire_date date,
	foreign key (emp_title_id) references titles(title_id)
);

--checking whether the columns were added to the employees table properly
select * from employees;

--create salaries table
--both cols take integers
--emp_no col matches emp_no col in employees table (foreign key)
--but emp_no col also has unique values for this table, so it is also the primary key
create table salaries (
	emp_no int primary key, 
	foreign key (emp_no) references employees(emp_no),
	salary int
);

--checking whether the columns were added to the salaries table properly
select * from salaries;

--create departments table
--dept_no has unique ids (primary key)
create table departments (
 	dept_no varchar primary key,
 	dept_name varchar
);

--checking whether the columns were added to the departments table properly
select * from departments;

--create dept_manager table
--both cols in this table reference other tables' primary keys (junction table)
    --emp_no references emp_no in employees table (foreign key)
    --dept_no references dept_no in department table (foreign key)
--emp_no has unique values for this table (primary key)
create table dept_manager (
	dept_no varchar,
	emp_no int primary key,
	foreign key (emp_no) references employees (emp_no),
    foreign key (dept_no) references departments (dept_no)
);

--checking whether the columns were added to the dept_manager table properly
select * from dept_manager;

--create dept_emp table
--neither col is unique on its own, so a composite key must be made
--both cols are primary keys in other tables (both are foreign keys)(junction table)
    -- emp_no references emp_no in employees table
    -- dept_no references dept_no in departments
create table dept_emp (
	emp_no serial,
	dept_no varchar,
	primary key (emp_no, dept_no),
	foreign key (emp_no) references employees (emp_no),
	foreign key (dept_no) references departments (dept_no)
);

--checking whether the columns were added to the dept_emp table properly
select * from dept_emp;