use sakila;

select amount from payment where payment_id = 5;
select * from payment where amount = 9.99;

-- () <= nested query
select * from payment where amount = (select amount from payment where payment_id = 5);

-- get the payment id an amount where the amount is not equal to the amount of pyment_id 23
select amount from payment where payment_id = 23;
select * from payment where amount != 23;

select payment_id,amount from payment where amount != (select amount from payment where payment_id = 23);

-- get the pyment id, cus id, amount and payment date where the month of payment should be same as of payment id 6

select month(payment_date) from payment where payment_id = 6;
select payment_id,customer_id,amount,payment_date from payment where month(payment_date) = 6;

select payment_id,customer_id,amount,payment_date from payment where month(payment_date) = (select month(payment_date) from payment where payment_id = 6);



-- get all the columns from payment table where the staff serving the customer should be same as as of payment id 7

select * from payment;
select customer_id from payment where payment_id = 7;

select * from payment where staff_id = (select staff_id from payment where payment_id = 7);


-- get all the pyment info where the amount is same as of the highest amount of payment table
select * from payment;
select max(amount) from payment;

select * from payment where amount = (select max(amount) from payment);

-- get the amount and the total no of payment done for each amount only for those payment hows amount is less then the amount of rentl id 1725
select amount from payment where rental_id = 1725;
select * from payment where amount < 4.99; 

select amount,count(amount) from payment where amount = (select amount from payment where rental_id = 1725) group by amount;

-- get the month and the total amount spend only for those customer hows month of payment is greter then customer id 1 and payment id 3
select month(payment_date) from payment where customer_id = 1 and payment_id = 3;
-- single row subquery (nested query => return 1 row only)
select month(payment_date),sum(amount) from payment where month(payment_date)>(select month(payment_date) from payment 
      where customer_id = 1 and payment_id = 3) group by month(payment_date);


