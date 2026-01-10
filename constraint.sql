-- table
-- DDl statement (data defination language)
-- create, drop, alter, truncate

create database regex1;
use regex1;
create table test1(sno int); -- tables create (sno column name)

describe test1;
-- dml (insert statement)

-- dml (insert, update, delete, merge)
insert into test1 values(10);
select * from test1;
insert into test1(sno) values(11);
insert into test1(sno) values(20),(null),(30); -- 3 rows insert (multiple values)

select count(sno), count(*) from test1;
-- count(coulumn name) => not count null values
-- count(*) => count null values

create table test2(sno int not null, salary int);
insert into test2(sno,salary) values(20,100);
insert into test2(sno,salary) values(20,null);
insert into test2(sno,salary) values(null,1000); -- we have set constraint (error)
insert into test2(sno) values(1000);
insert into test2(salary) values(5000000); -- error (because no null and no default set)

select * from test2;


create table test3(sno int not null default 80, salary int);
insert into test3(salary) values(1000);
insert into test3(sno) values(5000);

select * from test3;

create table test4(sno int not null, salary int unique default 100);
insert into test4(sno,salary) values(1000,20000);
insert into test4(sno,salary) values(1001,20000); -- error duplicate values

insert into test4(sno) values(600);
select * from test4;
insert into test4(sno) values(700); -- error 100 is already in table

insert into test4(sno,salary) values(1001,null); -- multiple null values can be inserted
insert into test4(sno,salary) values(1001224,null); -- multiple null value insert allow because null is no data


-- check constraint
-- conditions
-- check conditions

drop table test7;
create table test7(sno int, salary int,
constraint regex_test7_sno_chk check (sno between 1 and 100),
constraint regex_test7_salary_chk check (salary in (1000,2000)));

insert into test7(sno,salary) values(4,1000);
insert into test7(sno,salary) values(150,1000); -- error
insert into test7(sno,salary) values(90,1500); -- error
select * from test7;

-- Q you have a table name as employee emid primary key, ename varchar(20),email column with unique constraint, collage with the default value, 
-- age with the condition greter then 80 and the gardion should be palindrom

create table employee(
empid int primary key,
empname varchar(20),
email varchar(50) unique,
collage varchar(100) default 'Regex',
age int,
gardign varchar(50),
constraint regex_employee_age_chk check(age > 18),
constraint regex_employee_gardign_chk check(gardign = reverse(gardign)));

describe employee;
insert into employee(empid,empname,email,age,gardign) values(1,'purv','purv@gmail.com',19,'naman');

select * from employee;

drop table customer9;
drop table orders9;
create table customer9(cid int primary key, cname varchar(20));
insert into customer9 value(10,'aman'),(11,'shubham');

create table orders9(oid int primary key, city varchar(20),cid int, foreign key (cid) references customer9(cid));
insert into orders9 values(1009,'jaipur',10),(10010,'goa',11),(10011,'J K',10);
-- insert into orders9 values(1009,'jaipur',10); show error because not found customer id
select * from customer9;
select * from orders9;


-- normalization




























