use sakila;

show tables;

select count(*) from payment where amount=2.99;

select * from payment;
select amount, count(*) from payment group by amount;

select customer_id,sum(amount) from payment group by customer_id;

select customer_id,sum(amount) from payment where amount>3 group by customer_id;

select customer_id, count(amount) from payment where month(payment_date) = 5 group by customer_id;

-- you need to find out the maximum amount the transaction the avg transaction amount and the total transaction amount done through each staff
select * from payment;
select max(amount),staff_id, avg(amount),sum(amount) from payment group by staff_id;

select max(amount),staff_id, avg(amount),sum(amount) from payment where customer_id%2=0 group by staff_id;

-- get the amount and the total transation done for each amount only for the pyments done trough the staff id 1 and the total number of transation shoud be greter then 30
select amount,count(amount) from payment where staff_id=1 group by amount having count(amount)>30;

-- find out the number of customer serve avg amount  and the total amount spend in each month for staffId 1 or 2
select count(customer_id),month(payment_date),avg(amount),sum(amount) from payment where staff_id=1 or staff_id=2 group by month(payment_date);

-- find out the number of customer serve, avg amount  and the total amount spend in each month for each month 
select count(customer_id),month(payment_date),year(payment_date),avg(amount),sum(amount) from payment where staff_id=1 or staff_id=2 
group by month(payment_date),year(payment_date);


-- Order by -> data arenge for asending order
-- for asending order, asec is default
select * from payment order by customer_id,amount;

-- for decending order
select * from payment order by customer_id desc;
select * from payment order by customer_id, amount desc;
select * from payment order by customer_id desc, amount;
