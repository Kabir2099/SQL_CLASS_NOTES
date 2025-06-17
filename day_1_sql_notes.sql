
show databases;

-- Data base create
create database if not exists org; 

-- Database Select
use org;

-- current database
select database();

-- Create Table

create table student(
   id int ,
   name varchar(50),
   roll int,
   marks double
);

-- check table
show tables;

-- insert command to add 
insert into student (id, name, roll, marks) values(1,'Kabir Sk', 12, 99.99);


-- Read from table
select * from student;

insert into student (id, name, roll, marks) values(1,'Kabir Sk', 12, 99.99);

insert into student (id, name, roll, marks) values(3,'Karan Sk', 13, 99.99);

select * from student;

-- specific column
select name, roll from student;

insert into student (id, name, roll, marks) values(4,'Ajnaj Sk', 13, 99.99), (5,'abc', 15, 99);


insert ignore into  student (id, name, roll, marks) values('x','Ajnaj Sk', 13, 99.99);




-- Employee Table
create table Employee(
 WORKER_ID INT NOT NULL primary KEY auto_increment,
 FIRST_NAME CHAR(25),
 LAST_NAME CHAR(25),
 SALARY INT(15),
 JOINING_DATE datetime,
 DEPARTMENT CHAR(25)
);

show tables;

INSERT INTO Employee (WORKER_ID,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT) values
(001,'Monika','Arora',100000,'14-02-20 09:00:00','HR' ),
(002,'Niharika','Verma',80000,'14-06-11 09:00:00','ADMIN'),
(003,'Vishal','Singhal',300000,'14-02-20 09:00:00','HR'),
(004,'Amitabh','Singh',500000,'14-02-20 09:00:00','ADMIN'),
(005,'Vivek','Bhati',500000,'14-06-11 09:00:00','ADMIN'),
(006,'Vipul','Diwan',200000,'14-06-11 09:00:00','Account'),
(007,'Satish','Kumar',75000,'14-01-20 09:00:00','Account'),
(008,'Geetika','Chauhan',90000,'14-04-11 09:00:00','ADMIN');

select * from employee;

INSERT ignore INTO Employee (WORKER_ID,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT) values
(001,'Monika','Arora',100000,'14-02-20 09:00:00','HR' );

-- Bonus Table Create
create TABLE Bonus_Table(
   WORKER_REF_ID INT,
   BONUS_AMOUNT INT(10),
   BONUS_DATE datetime,
   foreign key (WORKER_REF_ID) references Employee (WORKER_ID) on delete cascade
);

insert into Bonus_Table (WORKER_REF_ID,BONUS_AMOUNT,BONUS_DATE) values
(001,5000,'16-02-20'),
(02,3000,'16-06-11'),
(003,4000,'16-02-20'),
(001,4500,'16-02-20'),
(002,3500,'16-06-11');

select * from bonus_table;


create table Title_Table(
   WORKER_REF_ID INT,
   WORKER_TITLE CHAR(25),
   AFFECTED_FROM datetime,
   foreign key (WORKER_REF_ID) references Employee(WORKER_ID) on delete cascade
);

insert into Title_Table (WORKER_REF_ID,WORKER_TITLE,AFFECTED_FROM) values
(001,'Manager','2016-02-20 00:00:00'),
(002,'Executive','2016-06-11 00:00:00'),
(008,'Executive','2016-06-11 00:00:00'),
(005,'Manager','2016-06-11 00:00:00'),
(004,'Asst. Manager','2016-06-11 00:00:00'),
(007,'Executive','2016-06-11 00:00:00'),
(006,'Lead','2016-06-11 00:00:00'),
(003,'Lead','2016-06-11 00:00:00');

select * from title_table;

-- Q1 : Take first_name as Worker_name
select concat(first_name, " ", last_name) as Employee_Name from Employee;

-- Q-2 Fetch details of all the admin
select * from employee where department ='admin';

--  search name by in
select * from employee where first_name in ('monika','vishal');

select * from employee where first_name = 'monika' or first_name = 'vishal';

-- Upper , Lower, Substr, Replace, Reverse,left, right, repeat, length, Instr, Trim
select upper('hi');

select upper(first_name) from employee;

select lower(first_name) from employee;

select substr('hello',2,3); -- substr(string, start_index, number of character) -- index start from 1 not n

select substring('hello',1,4);
select substring('asgefdewbdflbkevkjg', -4); -- last 4 character

-- calculate lenght
select char_length('hsgds');

--
select char_length(first_name) from employee;

select reverse('hiwegre');

select repeat('hi',5);

-- replace(stting, old string, new string)
select replace('hello world','l','k');

-- insert Hhiello Hhillo 
select insert('Hello',2,2, 'hi');

-- trim

-- "    kabir" , "kabir    " , "  kabir   ""
select ltrim("  kabir");
select rtrim("kabir     ");
select trim("  kabir    ");


select left("hello", 2);

select right("hello",3);






