-- ddl(data defination lenguage)
-- create (table)
-- drop, truncate, alter

create table raj123(col int);

-- create a table using select (CTAS) -> create table as select
create table actor_cp as
select first_name, last_name from sakila.actor;

select * from actor_cp;

-- drop => table sturcture and data both are deleted 
drop table actor_cp;
select * from actor_cp;

create table actor_cp as
select first_name as fname, last_name as lname from sakila.actor
where actor_id between 10 and 14;

select * from actor_cp;

-- alter
alter table actor_cp add column(salary int);

alter table actor_cp add constraint new_key primary key(fname); -- primary key added
alter table actor_cp drop column lname; -- column drop

alter table actor_cp rename column salary to newsalary; -- change column name

desc actor_cp;

select * from actor_cp;

use regex1;
-- DML (data manipulation language)
-- insert
-- update set col = value
update actor_cp set newsalary = 900;

update actor_cp set newsalary = 888 where fname='UMA';
select * from actor_cp;
drop table actor_cp;

create table actor_cp as select first_name as fname, last_name as lname from sakila.actor
where actor_id between 10 and 24;

select * from actor_cp;
update actor_cp set lname="goyal" where fname = "ZERO";


-- delete is a dml operetion

delete from actor_cp; -- delete only delete data but not change stucture

truncate actor_cp;

-- truncate is a ddl statement delete is a dml statement,
-- truncate which not provide any condition but delete provide condition
-- in truncate we can not data is revert(roll back) but delete can we rollback
-- note -: agr apne kabhi bhi ddl statement chala diya to ap kabhi bhi rollback nhi kr skte
-- object means the structure which can be use manage and store the data
-- drop vs delete vs truncate imp que for interviwe





