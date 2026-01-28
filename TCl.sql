use regex1;
create table actor_cp2 as select actor_id, first_name from sakila.actor where actor_id between 1 and 5;

select * from actor_cp2;
insert into actor_cp2 values(6,'tushar');

-- automatic => enable
set @@autocommit = 0;
select @@autocommit;
insert into actor_cp2 values(8,'testoo');

update actor_cp2 set actor_id = 10000;

rollback;
select * from actor_cp2;

commit;







start transaction;
insert into actor_cp2 values(11,'amazon');
commit;
select * from actor_cp2;


start transaction;
insert into actor_cp2 values(13,'flipkart');
commit;
select * from actor_cp2;
create table xyz(id int);

start transaction;
insert into actor_cp2 values(16,'asdfgh');
insert into actor_cp2 values(17,'asdfghasdf');
delete from actor_cp2 where actor_id in (7,9);
rollback;
select * from actor_cp2;










