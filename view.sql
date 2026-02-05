use regex1;

create table newactor as
select actor_id, first_name from sakila.actor where actor_id between 1 and 3;

select * from newactor;

create view actor_v as
select *, substr(first_name,2) from newactor;

select * from actor_v;

select * from newactor; -- 3 rows 2 column
insert into newactor values(4,'riya'); -- new table
select * from newactor; -- 4th raw added
select * from actor_v; -- auto update 4th raw

-- simple view -> any dml change will be visible on original table
-- where view is created
create view actor_v2 as
select * from newactor where actor_id in (1,2);

select * from newactor;
insert into newactor values(5,'sakshi'); -- add data

select * from actor_v2; -- but show 2 raw because original table filter



-- complex view
create table newpayment as
select payment_id, amount from sakila.payment where payment_id between 1 and 7;

select * from newpayment;

create view payment_v as
select count(*) from newpayment;

select * from payment_v;

insert into payment_v values(10); -- not insert in table because it is complex view so give error











