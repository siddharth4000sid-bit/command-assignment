CREATE DATABASE company_training;
USE company_training;
CREATE TABLE departments (
department_id int primary key auto_increment,
department_id INT NOT NULL,
dept_name VARCHAR(80),
city VARCHAR(60),
location_of_type varchar(100) not null
);


CREATE TABLE employees(
employees_id int primary key auto_increment,
employee_id INT NOT NULL,
employee_name VARCHAR(100) NOT NULL,
email VARCHAR(120) unique,
department_id INT NOT NULL,
salary DECIMAL(10,2) not null,
status VARCHAR(20) default 'active'
);

alter table departments
add constraint pk_departments primary key (department_id);

    ALTER TABLE employees
add constraint pk_employees primary key (employee_id);



-- change a column name and type
alter table departments change column dept_name department_name varchar(100) not null; 


-- add a new column
alter table departments add column location_of_type varchar(50);


alter table employees
modify salary decimal (12,2) not null;

ALTER TABLE employees
alter column status set default 'Active';



-- rename table 
rename table employees to staff;



alter table staff
add constraint fk_staff_department foreign key (department_id) references departments(department_id);

alter table staff drop index email;

alter table staff
drop foreign key fk_staff_department;

alter table staff
drop primary key;

alter table staff add constraint pk_staff
primary key (employee_id);

alter table departments
drop column location;

-- Step 1: Create the new database
create database company_management;

-- Step 2: Move both tables
rename table
company_training.staff
to company_management.staff;

rename table
company_training.departments
to company_management.departments;

-- Step 3: Drop the old empty database
drop database company_training;






