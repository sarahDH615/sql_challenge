# sql_challenge

### contains:
1. erd.png: an image of an entity relationship diagram for the tables in the sql database sql-challenge
2. schemata.sql: a file showing the schemas for the tables in the sql-challenge database
3. queries.sql: a file showing the queries to the sql-challenge database
4. salary_analysis.ipynb: a jupyter notebook showing graphs generated from queries to the sql-challenge database

### description: 
This repository is sourced in information on company employees hired in the 1980s and 1990s, found in csvs. The goal of this project was to import the csvs into a SQL database and return results of queries from tables in the database. Additionally, visualisations of the relationships between the salary and title tables were created in a jupyter notebook. 

To accomplish those goals, the following steps were taken:
* CSV Inspection and Entity Relationship Diagram creation (file 1)
    - upon visual inspection of the source csvs, the columns in the csvs were assigned data types
    - the unique columns in each csv's table were designated primary keys
    - columns in each csv's table that reference columns in other csvs were designated foreign keys 
* Creation of SQL Database and Schemata; CSV Importation (file 2) 
    - a database was created in pgAdmin, called sql-challenge
    - drawing on the ERD, schemas were written, using postgreSQL syntax, to create tables with the same relationships, foreign, and primary keys in the SQL database
    - the csvs were imported into the appropriate sql-challenge database tables
* Data Analysis: Queries to the SQL Database (file 3)
    - queries were put to the database to retrieve the following information:
    1. For each employee, list: employee number, last name, first name, sex, and salary.
    2. List first name, last name, and hire date for employees hired in 1986.
    3. For each department manager, list: department number, department name, the manager's employee number, last name, first name.
    4. List the department of each employee with: employee number, last name, first name, and department name.
    5. List first name, last name, and sex for employees with first name  'Hercules' and last name beginning with 'B'.
    6. List all employees in the Sales department, with their employee number, last name, first name, and department name.
    7. List all employees in the Sales and Development departments, with their employee number, last name, first name, and department name.
    8. In descending order, list the frequency count of employee last names.
    


### final considerations:

