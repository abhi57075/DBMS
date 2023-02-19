show databases;

create database assignment2;

use assignment2;

alter database assignment2 modify name = asd; -- way to change database name




-- ASSIGNMENT 1 and 2 

-- Design and develop SQL DDL statements which demonstrate the use of SQL objects such as 
-- Table, View, Index, Sequence and Synonym

-- Commands of SQL are grouped into 4 languages 

-- Data definition language (DDL), Data Manipulation language (DML), Data control language (DCL), Transaction Control language (TCL)

-- 1. DDL - create, alter, drop, rename, truncate
-- 2. DML - select, update, insert and delete
-- 3. DCL - grant, revoke
-- 4. TCL - commit, rollback

-- SQL constraints
-- not null, unique, primary key, foreign key, check, default

create table student
(student_id int primary key auto_increment,
first_name varchar(25),
last_name varchar(25),
standard varchar(25) not null,
roll_no int(6) unique,
age int, 
constraint check (age>18),
school varchar(25) default 'ABC');

drop table student;

desc student;

-- creating a view
create view custom_view as select first_name, roll_no from student;
select * from custom_view;

alter view custom_view as select first_name, last_name, roll_no from student;

drop view if exists custom_view;

-- alter commands

alter table student add marks int not null default 0;
alter table student modify marks int not null default 35;
alter table student change column marks total_marks float not null default 40;
alter table student drop column total_marks;
alter table student rename to rough;
alter table rough rename column standard to class;

truncate table rough; -- deletes the data from the table and not the schema

desc rough;

select * from rough;

create table faculty 
(faculty_id int primary key, 
faculty_name varchar(25), 
department varchar(25), 
designation varchar(25), 
salary float, 
phone_no smallint);

insert into faculty values 
(1,'Abhishek', 'Computer Science', 'Professor', 4000+5000, 1234),
(2,'Raman', 'Computer Science', 'Assistant Professor', 6000-5000, 2345),
(3,'Bose', 'Maths', 'Lecturer', 400*500, 3456),
(4,'Pratik', 'Electronics', 'Professor', 5000/2, 4567),
(5,'Rushikesh', 'Electronics', 'Assistant Professor', 5000%3000, 5678);

create table teacher (teacher_id int primary key, teacher_name varchar(25), salary float);

insert into teacher values
(11,'Sandeep Dhende',45000),
(12,'Amol Ingole', 50000),
(13,'Nilesh Shirude', 45000);

select *  from teacher;

select * from faculty;

select salary + 5000 from faculty;

select salary from faculty where faculty_id = 2;

select salary, faculty_name, designation from faculty where faculty_id > 2;

select * from faculty where faculty_id != 2;
select * from faculty where faculty_id <> 2;  -- this query is same as the above one

select * from faculty where salary > 1000 and designation = 'Professor';

select * from faculty where department != 'Electronics';
select * from faculty where not department = 'Electronics';

-- Aggregate functions
select min(salary) from faculty;
select max(salary) from faculty;
select sum(salary) from faculty;
select count(salary) from faculty;
select avg(salary) from faculty;

select faculty_name from faculty where salary = (select max(salary) from faculty);

select ucase(faculty_name) from faculty;
select lcase(faculty_name), salary from faculty;

select length(faculty_name) from faculty;

select round(faculty_name) from faculty;
select round(salary) from faculty;

-- mid is used to extract a substring from the given input string
select mid(faculty_name,0) from faculty;
select mid(faculty_name,1) from faculty;
select mid(faculty_name,1,3) from faculty;
select mid(faculty_name,-3,1) from faculty; -- only third last letter
select mid(faculty_name,-3,3) from faculty; -- first last3 letters

select round(4.9); -- 5
select round(4.1); -- 4
select round(4.5); -- 5
select round(4.5) from faculty;

select round(avg(salary)) from faculty;

select * from faculty where department like 'Computer Science';

select * from faculty where department like 'e%'; -- same as writing like '%E'
select * from faculty where department like '%e';

select * from faculty where department like '%sc%'; 
select * from faculty where department like '_o%';
select * from faculty where department like '%';
select * from faculty where department like '%%';

select * from faculty order by 2; -- here 2 indicates the first column
select * from faculty order by 1 desc;

select * from faculty where salary between 2000 and 2500; -- both 2000 and 2500 are included
select * from faculty where salary >= 2000 and salary <= 2500;





-- Assignment 3

-- Logical Operators 
-- and, or, not, exists, like, all, some, any, in, between

-- Set operations in SQL
-- Union, union all, intersect, minus

-- Aggregate functions
-- avg(), count(), first(), last(), max(), min(), sum()

-- Scalar functions
-- ucase(), lcase(), mid(), round(), len()

-- Logical operators

select * from faculty where salary > 1000 && department = 'Electronics'; -- and
select * from faculty where salary > 1000 || department = 'Electronics'; -- or
select * from faculty where not salary < 2000; -- not
select * from faculty where salary between 2000 and 4000; -- between
select * from faculty where salary in (2000, 2500, 3000, 3500, 4000); -- in
select * from faculty where faculty_name like 'A%'; -- like

-- Set operations

(select * from faculty where salary > 2000) union (select * from faculty where department = 'Electronics'); -- union
(select * from faculty where salary > 2000) union all (select * from faculty where department = 'Electronics'); -- union all
select *  from faculty having salary > 4000;

select distinct(department) from faculty;

select department, count(*) from faculty group by (department);





-- Assignment 4

-- Understand DML commands

update faculty set salary = 1500 where salary = 1000;

update faculty set salary = 3500 where department = 'Electronics';

update faculty set salary = (select min(salary) from teacher ) where faculty_name = 'Bose';


start transaction;

select * from faculty;

savepoint s1;

delete from faculty where faculty_id = 1;

rollback to s1;

commit;  -- all save points will be removed





-- Assignment 5

-- Joins and Sub queries

create table branch
(branch_name varchar(20) primary key,
branch_city varchar(20),
assets int

insert into branch values
('Akurdi', 'Pune', 200000),
('Chinchwad', 'PCMC', 400000),
('Nigdi', 'Pune', 2300000),
('Wakad', 'Pune', 100000);

select * from branch;

create table customer
(customer_name varchar(20) primary key,
customer_street varchar(20),
customer_city varchar(20));

insert into customer values
('Atishay', 'Wanowarie Inox', 'PCMC'),
('Bhushan', 'Undri Police Station', 'PCMC'),
('Chandan', 'KP Road', 'Pune'),
('Dhruv', 'Ambegaon D mart', 'Pune'),
('Fawaz', 'Camp Road', 'Pune'),
('Harish', 'Bibwewadi D mart', 'PCMC'),
('Jignesh', 'Ravivar peth SB Road', 'Pune');

select * from customer;

create table loan 
(loan_no int primary key, 
branch_name varchar(20),
amount float,
constraint fk foreign key(branch_name) references branch(branch_name) on delete cascade on update cascade);

insert into loan values
(2001, 'Akurdi',2000),
(2002, 'Nigdi',1200),
(2003, 'Akurdi',1400),
(2004, 'Wakad',1350),
(2005, 'Chinchwad',1490),
(2006, 'Akurdi',12300),
(2007, 'Akurdi',14000);

replace into loan values (2007, 'Chinchwad', 14000);

-- Playing with views
create view view1 as select loan_no, branch_name from loan;
alter view view1 as select loan_no from loan;
drop view if exists view1;

select * from loan;

select * from loan,customer; -- no attribute in common (cross join)
select * from branch cross join loan;

select * from branch inner join loan; -- if not mentioning the on/where condition inner join behaves like cross join

select * from branch b inner join loan l where b.branch_name = l.branch_name;
select b.* from branch b inner join loan l where b.branch_name = l.branch_name;

select * from branch natural join loan; -- the repeated column is not shown

select * from branch b left join loan l on b.branch_name = l.branch_name;
select * from branch b right join loan l on b.branch_name = l.branch_name;





-- Assignment 6

-- writing a pl/sql block

-- accept roll no and name of book from user
-- if noofdays are between 15 to 30 then fine will be Rs 5 per day
-- if noofdays > 30 fine will be Rs 50 per day and for days less than 30 Rs 5 per day
-- if condition of fine is true then details will be stored to fine table

create table borrower
(roll_no int primary key,
stud_name varchar(25) not null,
date_of_issue date,
name_of_book varchar(25),
book_status varchar(5));

desc borrower;

create table fine
(roll_no int primary key,
todays_date date,
amount int);

insert into borrower values
(1,'Abhishek','2022-10-16','Java Basics','I');

insert into borrower values
(2,'Atishay','2022-10-16','OOPS','I'),
(3,'Aditya','2022-11-6','C++','I'),
(4,'Aagam','2022-10-26','DBMS','I'),
(5,'Atharva','2022-10-30','EFT','I'),
(6,'Aahan','2022-10-16','DC','I');

delimiter $
create procedure proc (in roll int, in book varchar(200))
begin

declare issuedate date;
declare noofdays int;
declare fine1 float;

declare exit handler for SQLException select 'error';

select date_of_issue into issuedate from Borrower where roll_no = roll and name_of_book = book;

select datediff(curdate(), issuedate) into noofdays;

if noofdays>30 then
set fine1 = (noofdays-30)*50 + (30-15)*5;

elseif noofdays>15 and noofdays<=30 then
set fine1 = (noofdays-15)*5;

else set fine1 = 0;

end if;

if fine1 > 0 then
insert into fine values(roll, curdate(), fine1);

end if;

update borrower set status = 'R' where roll_no = roll and name_of_book = book;

end;

$

call proc(1,'Java Basics');
call proc(2,'OOPS');
call proc(3,'C++');
call proc(4,'DBMS');
call proc(5,'EFT');
call proc(6,'DC');

select * from fine;




-- Assignment 7





-- Assignment 8

-- marks <= 1500 and marks >= 990  then DISTINCTION
-- marks <= 989 and marks >= 900 then FIRST CLASS
-- marks <= 899 and marks >= 825 then HIGHER SECOND CLASS else FAIL

create table student_marks
(stud_name varchar(25),
standard int,
stud_roll int,
marks int);

create table result
(roll_number int,
category varchar(25));

insert into student_marks values
('A',5,1,1600),
('B',10,2,1550),
('C',12,3,989),
('D',11,4,899),
('E',9,5,825),
('F',5,6,567);

delimiter $

create procedure proc1 (in roll int)

begin

declare category varchar(25);
declare MARKS int;
declare exit handler for SQLException select 'ERROR';

select marks into MARKS from student_marks where stud_roll = roll;

if MARKS >= 990 and MARKS <= 1500 then
set category = 'DISTINCTION';

elseif MARKS >= 900 and MARKS <= 989 then
set category = 'FIRST CLASS';

elseif MARKS >= 825 and MARKS <= 899 then
set category = 'HSC';

else set category = 'FAIL';

end if;
insert into result values(roll, category);

end;
$

drop procedure proc1;

call proc1(1);
call proc1(2);
call proc1(3);
call proc1(4);
call proc1(5);
call proc1(6);

select * from result;

truncate table result;


















