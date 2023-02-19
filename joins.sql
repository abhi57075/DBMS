create database joins;

use joins;

create table A
(num int, square int, power3 int);

create table B
(num int, square int, power4 int);

insert into A values
(1,1,1),
(2,4,8),
(3,9,27),
(4,16,64),
(5,25,125);

insert into B values
(2,4,16),
(4,16,128),
(6,36,216*6),
(8,64,64*64),
(10,100,10000);

select * from A;
select * from B;

-- Cross joins 
select * from A, B;
select * from A cross join B;

-- Inner join / Intersection
select A.*,B.* from A inner join B on A.num = B.num;
select * from A inner join B on A.num = B.num;
select A.num,A.square,power3,power4 from A inner join B on A.num = B.num;

-- Natural join
select * from A natural join B;

-- Right Join
select A.*,B.* from A right join B on A.num = B.num;
select * from A right join B on A.num = B.num;

-- Left Join
select A.*,B.* from A left join B on A.num = B.num;
select * from A left join B on A.num = B.num;

-- A-B All elements in A which are not in B
select A.* from A left join B on A.num = B.num where B.num is null;

-- A union B but all the common elements should not be present
(select A.* from A left join B on A.num = B.num where B.num is null)
union
(select B.* from A right join B on A.num = B.num where A.num is null);

-- Full join or union
(select * from A left join B on A.num = B.num) union (select * from A right join B on A.num = B.num);
select * from A union select * from B;


-- Dealing with null values;

create table xyz (num int default null, sq int);

alter table xyz add p3 int default null;
alter table xyz modify num int;
alter table xyz add p4 int;

insert into xyz values (1,1,1);
insert into xyz (num, sq) values (2,4);
insert into xyz (num,sq) values (3,9);

select * from xyz;

update xyz set p3 = p3 + 200;  -- null + 2000 = null
update xyz set p4 = p4 + 20;

select count(*) from xyz where p3 is not null;









