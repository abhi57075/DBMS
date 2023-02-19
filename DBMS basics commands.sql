create database temp;

use temp;

create table student 
(id int primary key, 
name varchar(20));

insert into student values(
1, 'Ankit');

select * from student;

create database org;

show databases;

use org;

create table worker(
worker_id int not null primary key auto_increment,
first_name varchar(25),
last_name varchar(25),
salary int(25),
joining_date datetime,
department varchar(25));

show tables;

insert into worker(
worker_id, first_name, last_name, salary, joining_date, department) values 
(1, 'Abhishek', 'Jain', 100000, '14-07-20 09:00:00', 'HR'),
(2, 'Ajay', 'Shrivastav', 200000, '12-06-20 08:00:00', 'HR'),
(3, 'Amitabh', 'Bachan', 350000, '11-05-7 09:00:00', 'VP'),
(4, 'Atharva', 'Kapoor', 400500, '19-04-24 08:30:00', 'Sales'),
(5, 'Ajit', 'Khosla', 123000, '14-03-12 07:56:00', 'VP'),
(6, 'Abhinav', 'Khurana', 100222, '22-02-2 09:00:00', 'AVP');

select * from worker;

select 55+11;

select now();

select lcase("ABHISHEK");

select * from worker where department = 'HR' or department = 'Sales';

-- used to comment

select * from worker where department in ('HR', 'Sales', 'VP');

insert into worker(
worker_id, first_name, last_name, salary, joining_date, department) values 
(25, 'Amertya', 'Shukla', null, '14-07-20 09:00:00', 'HR');

select * from worker where salary is null;

select * from worker where first_name like 'A%a_';

select * from worker order by salary;

select * from worker order by salary desc;

select department from worker group by department;

select department, count(department) from worker group by department;

-- Use group by with aggregate functions otherwise it will act like distinct keyword

select department, avg(salary) from worker group by department;

-- The 'group by' will have same parameters as that of the select clause

select department,  min(salary) from worker group by department;

-- having works with group by only

select department, count(department) from worker group by department having count(department) > 1;

create table account (
id int primary key,
name varchar(255) unique,
balance int,
constraint acc_balance check (balance > 200000));

 insert into account (id, name, balance) values (1, 'Ashwin', 500);
 -- will give an error saying check constraint 'acc_balance' is violated
 
 drop table account;
 
create table account (
id int primary key,
name varchar(255) unique,
balance int not null default 0);

 insert into account (id, name) values (1, 'Ashwin');
 
 select * from account;
 
 drop table account;
 
 create table account (
id int primary key,
name varchar(255) unique,
balance int not null default 0);

alter table account add interest float not null default 0;
 
 insert into account (id, name) values (1, 'Ashwin');
 
 alter table account modify interest double not null default 1.5;
 
desc account;

alter table account change column interest saving_interest float not null default 0;

alter table account drop column saving_interest;

-- renaming the table
alter table account rename to account_details;

desc account_details;

use org; 

select *  from worker;

insert into worker values (26, 'Ashwin', 'Iyyer', 250000, '2022:12:31 12:00:12', 'Intern');

update worker set department = 'AVP' where worker_id = 26 ;

-- set SQL_SAFE_UPDATES = 0;
-- update worker set department = 'Intern';
-- the above query will set all tuples department to intern
-- But changing all this data at once we will have to set SQL_SAFE_UPDATES to false/0.

-- on delete cascade
-- on delete set null

replace into worker values (27, 'Aayan', 'Sheikh', 234567, '2020:10:13 10:30:45', 'AVP');

replace into worker values (27, 'Aayan', 'Sheikh', 234567, '2020:10:13 10:30:45', 'Sales');

replace into worker (worker_id, first_name, last_name, department) values (27, 'Abhijeet', 'kothari', 'VP');

replace into worker (worker_id, department) select worker_id, department from worker where worker_id = 26;

select * from worker;

select * from worker where salary in (select salary from worker where salary > 200000);

-- from clause ke andar hum jo bhi query chalate hai use hum derived table bolte hai
select max(salary) from (select * from worker where department = 'HR') as temp_table;

-- find the third highest salary
insert into worker values ('28', 'Ajay', 'Verma', '200000', '2014-07-20 09:00:00', 'HR');
select * from worker w1 where 3 = (select count(w2.salary) from worker w2 where w2.salary >= w1.salary);

-- creating a view
create view custom_view as select first_name, salary from worker;
select * from custom_view;

alter view custom_view as select first_name, last_name, salary from worker;

drop view if exists custom_view;

-- JOINS 
create table t1 (id int primary key auto_increment, t1num int, t1square int, t1power3 int);
create table t2 (id int primary key auto_increment, t2num int, t2square int, t2power3 int);

insert into t1 values (1,1,1,1),(2,2,4,8),(3,3,9,27),(4,4,16,64),(5,5,25,125);
insert into t2 values (1,1,1,1),(2,2,4,8),(3,3,9,27),(10,10,100,1000),(20,20,400,8000);

select * from t1;
select * from t2;

-- this behaves as cross join
select * from t1 inner join t2;

select t1.*, t2.* from t1 inner join t2 on t1.id = t2.id; -- on/where

select t1.*, t2.* from t1 left join t2 on t1.id = t2.id;

select t1.*, t2.* from t1 right join t2 on t1.id = t2.id;

select t1.*, t2.* from t1 cross join t2 on t1.id = t2.id;

select * from t1 a inner join t1 b on a.t1num = b.t1num; -- self join

select * from t2 union select * from t1;

-- UNION MEIN SAARE COLUMNS KE NAME SAME CHAHIYE AUR WOH REPEATED ROW STORE NAHI KARTA HAI
-- JOIN MAI EK COMMON ATTRIBUTE CHAHIYE

