use sakila;

-- multirow subquery
-- comparision operator is not use

-- in, not in
select * from payment where amount in (select amount from payment where payment_id = 3 or payment_id = 2);
select * from payment where amount not in (select amount from payment where payment_id = 3 or payment_id = 2);

select * from payment where amount = any (select amount from payment where payment_id = 3 or payment_id = 2);

select * from payment where amount >any (select amount from payment where payment_id = 3 or payment_id = 2);
select * from payment where amount >=any (select amount from payment where payment_id = 3 or payment_id = 2);

select * from payment where amount <any (select amount from payment where payment_id = 3 or payment_id = 2);
-- 0.99 or 5.99 se bada
select * from payment where amount >all (select amount from payment where payment_id = 3 or payment_id = 2);
-- 0.99 se chota
select * from payment where amount <all (select amount from payment where payment_id = 3 or payment_id = 2);
-- 0.99 and usse chota
select * from payment where amount <=all (select amount from payment where payment_id = 3 or payment_id = 2);




-- Q. get all the payment information where the month of payment should be same as of payment id 2 or 3
select * from payment where month(payment_date) in 
(select month(payment_date)from payment where payment_id=2 or payment_id=3);

-- Q. get all the payment information whose amount is larger then among all the amount of payment_id 2 to 8
select * from payment where amount > all (select amount from payment where payment_id=2 or payment_id=8);



