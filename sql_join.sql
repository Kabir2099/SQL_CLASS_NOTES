create database if not exists ace_the_code;

use ace_the_code;

DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;

CREATE TABLE Departments (
  dep_id   INT PRIMARY KEY,
  dep_name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE Employees (
  emp_id     INT PRIMARY KEY,
  emp_name   VARCHAR(50) NOT NULL,
  dep_id     INT NULL,
  manager_id INT NULL
);




INSERT INTO Departments (dep_id, dep_name) VALUES
 (10,'Engineering'),
 (20,'HR'),
 (30,'Sales'),
 (40,'Marketing'),   
 (50,'Support');



INSERT INTO Employees (emp_id, emp_name, dep_id, manager_id) VALUES
 (101,'Aarav', 10, NULL),   -- top manager
 (102,'Bela',  10, 101),
 (103,'Charan',20, 101),
 (104,'Diya',  NULL,101),   -- no department assigned
 (105,'Eshan', 30, 103),
 (106,'Farah', 30, 103),
 (107,'Gopal', 50, 102),
 (108,'Heena', 99, 102);    -- dep_id 99 doesn't exist
 
 
 -- 
 select * from employees;
 
 
 
 
--  Q1: “List employees and their department but exclude those without a valid department.”

select e.emp_name, e.emp_id from employees as e
join departments as d on e.dep_id = d.dep_id;





-- Q-2 show every employee; if their department is missing, fill with NULL
select e.emp_id, e.emp_id, e.dep_id , d.dep_name from employees as e left join
departments as d on e.dep_id = d.dep_id;





-- Q.3 Find employees whose dep_id doesn’t exist in Departments

select e.emp_id, e.emp_name, e.dep_id , d.dep_name from employees as e left join
departments as d on e.dep_id = d.dep_id where e.dep_id is not null and d.dep_id is null;






-- Q.4 : Show every department, even if it has zero employees.
-- Keeps all Departments, matches Employees when possible

select d.dep_id, d.dep_name , e.emp_name from employees as e right outer join departments as d on
e.dep_id = d.dep_id;



-- Q.5 List departments that currently have zero employees
select d.dep_id, d.dep_name , e.emp_name from employees as e right outer join departments as d on
e.dep_id = d.dep_id where e.emp_id is null;



-- Q.6 : List everything: all employees and all departments, matched when possible.

select e.emp_id, e.emp_name, e.dep_id as emp_dep_id, d.dep_id as dept_dep_id, d.dep_name from employees as e
left join departments as d on e.dep_id = d.dep_id

union all

select e.emp_id, e.emp_name, e.dep_id as emp_dep_id, d.dep_id as dept_dep_id, d.dep_name from employees as e
right join departments as d on e.dep_id = d.dep_id;

-- Q-7 : Generate all combinations” (rare, but useful for coverage planning, seating charts, etc.)
select e.emp_name, d.dep_name
from employees as e cross join departments as d ;

-- Q.8: Create all possible Engineering/Sales mentorship pairs between selected employees.
select e.emp_name, d.dep_name
from employees as e cross join departments as d where d.dep_id in(10, 30) and e.emp_id in (101, 102, 103);



-- Find Employee manager mapping - emplyee 

select e.emp_name as employee_name, m.emp_name as Manager from employees  as e
left join employees as m on e.manager_id = m.emp_id;


-- find employee has no manager

select e.*
from employees as e left join employees as m on e.manager_id = m.emp_id where m.emp_id is null;

-- Q.9 : Who are the managers (people who have direct reports)?




-- Q.10 : Which pairs share the same manager?








