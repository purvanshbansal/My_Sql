-- union show only unique values
select actor_id, first_name from sakila.actor where actor_id between 1 and 4
union
select actor_id, first_name from sakila.actor where actor_id between 3 and 5;

-- union all show all values
select actor_id, first_name from sakila.actor where actor_id between 1 and 4
union all
select actor_id, first_name from sakila.actor where actor_id between 3 and 5;

-- efect no of column not efect on data types
select actor_id, first_name from sakila.actor where actor_id between 1 and 4
union all
select first_name from sakila.actor where actor_id between 3 and 5; -- give error because no of column not be same

select actor_id, first_name from sakila.actor where actor_id between 1 and 4
union all
select  first_name,actor_id from sakila.actor where actor_id between 3 and 5;  -- not give error because data types not effect

-- recursive cte

with recursive cte as (
select 10 as num  -- assinging values to this num column (starting point)
union all         
select num+1 from cte  -- cte call krna
where num < 15   -- terminating condition (stop point)
)
select * from cte;

use regex1;
CREATE TABLE employees (
    employeeid INT PRIMARY KEY,
    name VARCHAR(50),
    managerid INT
);


INSERT INTO employees (employeeid, name, managerid) VALUES
(1, 'Alice', NULL),      -- CEO
(2, 'Bob', 1),           -- Reports to Alice
(3, 'Charlie', 2),       -- Reports to Bob
(4, 'Diana', 2),         -- Reports to Bob
(5, 'Eve', 3);           -- Reports to Charlie

select * from employees;


with xyz as (
select *,name as hierachy_path from employees where managerid is null)
select * from xyz;

with recursive cte as (
select employeeid,name,name as hierachy_path from employees where managerid is null
union all
select e.employeeid,e.name,concat(e.name,'->', cte.hierachy_path) from employees as e
join cte where e.managerid  = cte.employeeid and e.employeeid < 5 )
select * from cte;

with recursive cte as (
select employeeid,name,1 as level from employees where managerid is null
union all
select e.employeeid,e.name,level+1 from employees as e
join cte where e.managerid  = cte.employeeid)
select * from cte;










