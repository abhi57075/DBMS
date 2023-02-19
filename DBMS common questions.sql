-- DBMS COMMON QUESTIONS

-- Creating database
create database DBMS_Common_Questions;

use DBMS_Common_Questions;

-- Creating tables in the database
create table worker (
worker_id int not null primary key auto_increment,
first_name varchar(25),
last_name varchar(25),
salary int (10),
joining_date datetime,
department varchar(25));

insert into worker values
(001, 'Monika', 'Arora', 100000, '14-02-20, 09.00.00', 'HR'),
(002, 'Niharika', 'Verma', 800000, '14-06-11, 09.00.00', 'Admin'),
(003, 'vishal', 'Singhal', 300000, '14-02-20, 09.00.00', 'HR'),
(004, 'Amitabh', 'Singh', 500000, '14-02-20, 09.00.00', 'Admin'),
(005, 'Vivek', 'Bhati', 500000, '14-06-11, 09.00.00', 'Admin'),
(006, 'Vipul', 'Diwan', 200000, '14-06-11, 09.00.00', 'Account'),
(007, 'Satish', 'Kumar', 75000, '14-01-20, 09.00.00', 'Account'),
(008, 'Geetika', 'Chauhan', 900000, '14-04-11, 09.00.00', 'Admin');

create table bonus(
worker_ref_id int,
bonus_amount int(10),
bonus_date datetime,
foreign key (worker_ref_id) references worker (worker_id) on delete cascade);

insert into bonus values 
(001, 5000, '16-02-20'),
(002, 3000, '16-06-11'),
(003, 4000, '16-02-20'),
(001, 4500, '16-02-20'),
(002, 3500, '16-06-11');

create table title(
worker_ref_id int,
worker_title varchar(25),
affected_from datetime,
foreign key (worker_ref_id) references worker (worker_id) on delete cascade);

insert into title values
(001, 'Manager', '2016-02-20 00:00:00'),
(002, 'Executive', '2016-06-11 00:00:00'),
(008, 'Executive', '2016-06-11 00:00:00'),
(005, 'Manager', '2016-06-11 00:00:00'),
(004, 'Asst. Manager', '2016-06-11 00:00:00'),
(007, 'Executive', '2016-06-11 00:00:00'),
(006, 'Lead', '2016-06-11 00:00:00'),
(003, 'Lead', '2016-06-11 00:00:00');

-- Questions

-- Q1. Write an SQL query to fetch first_name from worker table using the alias name as worker_name
select first_name as worker_name from worker;

-- Q2. Write an SQL query to fetch first_name from worker table in upper case
select upper(first_name) from worker;

-- Q3. Write an SQL query to fetch unique values of department from worker table
select distinct department from worker; -- we can use group by
select department from worker group by department;

-- Q4. Write an SQL query to print the first three characters of first_name from worker table
select substring(first_name,1,3) from worker;

-- Q5. Write an SQL query to find the position of the alphabet ('b') in the first_name column Amitabh from worker table
select instr(first_name, 'B') from worker where first_name = 'Amitabh'; -- case insensitive

-- Q6. Write an SQL query to print the first name form the worker table after removing white spaces from the right side
select rtrim(first_name) from worker

-- Q7. Write an SQL query to print the first name form the worker table after removing white spaces from the left side
select ltrim(first_name) from worker;

-- Q8. Write an SQL query that fetches the unique value of department from worker table and print its length
select distinct department, length(department) from worker;

-- Q9. Write an SQL query to print the first_name from the worker table after replacing a with A
select replace(first_name, 'a', 'A') from worker;

-- Q10. Write an SQL query to print the first_name and the last_name from worker table into a single column complete_name
-- A space char should separate them
select concat(first_name, ' ', last_name) as complete_name from worker;

-- Q11. Write an SQL query to print all worker details from the worker table order by first name ascending
select * from worker order by first_name;

-- Q12. Write an SQL query to print all worker details from the worker table order by
-- first_name ascending and department descending
select * from worker order by first_name, department desc;

-- Q13. Write an SQL query to print details for workers with the first name as Vipul and Satish from worker table
select * from worker where first_name = 'Vipul' or first_name = 'Satish';
select * from worker where first_name in ('Vipul','Satish');

-- Q14. Write an SQL query to print details for workers excluding with the first name as Vipul and Satish from worker table
select * from worker where first_name != 'Vipul' or first_name != 'Satish';
select * from worker where first_name not in ('Vipul','Satish');

-- Q15. Write an SQL query to print details of worker with department name as 'Admin*'
select * from worker where department like 'Admin%';

-- Q16. Write an SQL query to print details of the workers whose first name contians 'a'
select * from worker where first_name like '%a%';

-- Q17. Write an SQL query to print details of the workers whose first name ends with 'a'
select * from worker where first_name like '%a';

-- Q18. Write an SQL query to print details of the workers whose first_name ends with h and contains 6 alphabets
select * from worker where first_name like '_____h';

-- Q19. Write an SQL query to print details of the workers whose salary lies between 100000 and 500000
select * from worker where salary between 100000 and 500000;
select * from worker where salary >= 100000 and salary <= 500000;

-- Q20. Write an SQL query to print details of the workers who have joined in feb 2014
select * from worker where year(joining_date) = 2014 and month(joining_date) = 02;

-- Q21. Write an SQL query to fetch the count of employees working in department Admin
select department, count(*) from worker where department = 'Admin';
select count(department) from worker where department = 'Admin';

-- Q22. Write an SQL query to fetch worker full names with salaries >= 50000 and <=100000
select concat(first_name, ' ', last_name) from worker where salary  between 50000 and 100000; 

-- Q23. Write an SQL query to fetch the no of workers for each department in the descending order
select department, count(worker_id) as no_of_workers from worker group by department order by no_of_workers desc;
select department, count(*) from worker group by department order by count(*) desc;

-- Q24. Write an SQL query to print details of the workers who are also managers
select w.* from worker as w inner join title as t on w.worker_id = t.worker_ref_id where t.worker_title = 'Manager'; 

-- Q25. Write an SQL query to fetch number (more than 1) of same titles in the dbms_common_questions database of different types
select worker_title, count(*) as count from title group by worker_title having count > 1;

-- Q26. Write an SQL query to show only odd rows form the table
select * from worker where mod(worker_id, 2) != 0;
select * from worker where mod(worker_id, 2) <> 0; -- this sign <> also behaves as not equals to

-- Q27. Write an SQL query to show only even rows form the table
select * from worker where mod(worker_id, 2) = 0;

-- Q28. Write an SQL query to clone a new table from another table
create table worker_clone like worker;
-- here worker_clone will have only the logical schema of worker table and not the data of the worker table
insert into worker_clone select * from worker
-- now it will contain data also from the worker table
select * from worker_clone;

-- Q29. Write an SQL query to fetch intersecting records of 2 tables
select *  from worker inner join worker_clone using (worker_id, first_name, last_name, salary, joining_date, department);
select worker.*  from worker inner join worker_clone using (worker_id);
-- When using the 'using' keyword here worker_id column will be 1 only

-- Q30. Write an SQL query to show records form one table that another table does not have
select worker.* from worker left join worker_clone using (worker_id) where worker_clone.worker_id is null; 
-- we can use inner join also instead of left join and apply the same condition.
select worker.* from worker inner join worker_clone using (worker_id) where worker_clone.worker_id is null;
-- right waale ka joining parameter ko null karna padega for left join

-- Q31. Write an SQL query to show the current date and time
select curdate();
select now();

-- Q32. Write an SQL query to show top 5 records of a table order by descending salary
select * from worker order by salary desc limit 5;

-- Q33. Write an SQL query to determine the 5th highest salary from a table
select * from worker order by salary desc limit 4,1;
-- leave the first 4 rows / start from the 4 th row and give me the first row after it
-- if we wanted nth highest salary we could write limit n-1,1

-- Q34. Write an SQL query to determine the 5th highest salary without using the limit keyword
select first_name, last_name, salary from worker w1 where 4 = (
select count(distinct(w2.salary))
from worker w2
where w2.salary >= w1.salary);
-- the above is a co related subquery

-- Q35. Write an SQL query to fetch the list of employees with the same salary
select w1.* from worker w1, worker w2 where w1.salary = w2.salary and w1.worker_id != w2.worker_id;

-- Q36. Write an SQL query to fetch the second highest salary from a table using sub query
select max(salary) from worker where salary not in (select max(salary) from worker);

-- Q37. Write an SQL query to show one row twice in results from a table
select * from worker
union all
select * from worker order by worker_id;

-- Q38. Write an SQL query to fetch the list of worker_id who does not get bonus
select worker_id from worker where worker_id not in (select worker_ref_id from bonus);

-- Q39. Write an SQL query to fetch first 50% records from a table
select * from worker where worker_id <= (select count(worker_id)/2  from worker);

-- Q40. Write an SQL query to fetch the departments that have less than 4 people in it
select department, count(department) as depCount from worker group by department having depCount < 4;

-- Q41. Write an SQL query to show all departments along with the number of people in there
select department, count(department) as depCount from worker group by department;

-- Q42. Write an SQL query to show the last record from a table
select * from worker where worker_id = (select max(worker_id) from worker);

-- Q43. Write an SQL query to show the first record from a table
select * from worker where worker_id = (select min(worker_id) from worker);

-- Q44. Write an SQL query to fetch the last 5 records from table
(select * from worker order by worker_id desc limit 5) order by worker_id;

-- Q45. Write an SQL query to print the name of the employees having the highest salary in each department
select w.department, w.first_name, w.last_name, w.salary from
(select max(salary) as maxsal, department from worker group by department) temp
inner join worker w on temp.department = w.department and temp.maxsal = w.salary;

-- Q46. Write an SQL query to fetch three max salaries from the table using co related query
select distinct salary from worker w1 
where 3 >= (select count(distinct salary) from worker w2 where w1.salary <= w2.salary) order by w1.salary desc;

select distinct salary from worker order by salary desc limit 3;

-- Q47. Write an SQL query to fetch three min salaries from the table using co related query
select distinct salary from worker w1 
where 3 >= (select count(distinct salary) from worker w2 where w1.salary >= w2.salary) order by w1.salary desc;

-- Q48. Write an SQL query to fetch nth max salaries from the table using co related query
select distinct salary from worker w1 where n >= (select count(distinct salary) from worker w2 where w1.salary <= w2.salary) order by w1.salary desc;

-- Q49. Write an SQL query to fetch departments along with the total salaries paid for each of them
select department, sum(salary) as depSal from worker group by department order by depSal desc;

-- Q50. Write an SQL query to fetch the names of workers who earn the highest salary
select first_name, salary from worker where salary = (select max(salary) from worker);






