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

create table salaries (
	emp_no int primary key, 
	foreign key (emp_no) references employees(emp_no),
	salary int
);

--checking whether the columns were added to the salaries table properly
select * from salaries;

create table departments (
 	dept_no varchar primary key,
 	dept_name varchar
);

--checking whether the columns were added to the departments table properly
select * from departments;

create table dept_manager (
	dept_no varchar,
	emp_no int primary key,
	foreign key (emp_no) references employees (emp_no),
 foreign key (dept_no) references departments (dept_no)
);

--checking whether the columns were added to the dept_manager table properly
select * from dept_manager;

create table dept_emp (
	emp_no serial,
	dept_no varchar,
	primary key (emp_no, dept_no),
	foreign key (emp_no) references employees (emp_no),
	foreign key (dept_no) references departments (dept_no)
);

--checking whether the columns were added to the dept_emp table properly
select * from dept_emp;