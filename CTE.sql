-- CTE

use sakila;

with purv_cte as 
(select * from sakila.actor where actor_id between 5 and 100)
select count(*) from purv_cte;

select * from purv_cte; -- give error beacouse table is not in database its temp

with cte as 
(select *, month(payment_date) from sakila.payment)
select month(payment_date), count(*) from cte group by month(payment_date);

with cte as 
(select *, dense_rank() over(order by amount desc) as rankings from sakila.payment)
select * from cte where rankings = 2;

with cte as 
(select *, dense_rank() over(partition by customer_id order by amount desc) as rankings from sakila.payment)
select * from cte where rankings = 2;

use regexcorr;
select * from employee;










