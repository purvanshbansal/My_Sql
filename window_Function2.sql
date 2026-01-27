CREATE DATABASE IF NOT EXISTS window_fn_practice;
USE window_fn_practice;

CREATE TABLE employees (
  emp_id      INT PRIMARY KEY,
  full_name   VARCHAR(100) NOT NULL,
  department  VARCHAR(50) NOT NULL,
  city        VARCHAR(50) NOT NULL,
  salary      INT NOT NULL,
  hire_date   DATE NOT NULL
);

CREATE TABLE sales (
  sale_id     INT PRIMARY KEY,
  emp_id      INT NOT NULL,
  sale_date   DATE NOT NULL,
  amount      DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);


INSERT INTO employees (emp_id, full_name, department, city, salary, hire_date) VALUES
(101, 'Asha Nair',   'Sales',      'Mumbai',    65000, '2022-04-10'),
(102, 'Rohan Mehta', 'Sales',      'Pune',      72000, '2021-07-05'),
(103, 'Neha Singh',  'Sales',      'Delhi',     68000, '2023-01-15'),
(104, 'Kabir Rao',   'Engineering','Bengaluru', 120000,'2020-09-20'),
(105, 'Isha Verma',  'Engineering','Hyderabad', 110000,'2021-11-12'),
(106, 'Vikram Das',  'Engineering','Bengaluru', 125000,'2019-03-08'),
(107, 'Pooja Shah',  'HR',         'Mumbai',    60000, '2020-02-01'),
(108, 'Arjun Iyer',  'HR',         'Chennai',   58000, '2022-06-18');

INSERT INTO sales (sale_id, emp_id, sale_date, amount) VALUES
(1, 101, '2026-01-02', 12000.00),
(2, 101, '2026-01-05',  8000.00),
(3, 102, '2026-01-03', 15000.00),
(4, 102, '2026-01-09',  5000.00),
(5, 103, '2026-01-04',  7000.00),
(6, 103, '2026-01-10', 11000.00),
(7, 101, '2026-02-02', 14000.00),
(8, 102, '2026-02-03',  9000.00),
(9, 103, '2026-02-05', 13000.00),
(10,101, '2026-02-08',  6000.00),
(11,102, '2026-02-10', 16000.00),
(12,103, '2026-02-12',  4000.00);






select * from employees;

select *, sum(salary) over(),
sum(salary) over(partition by department),
sum(salary) over(partition by department, city) from employees;

-- over() => ascending order mai arrange krke laana
-- running sum / cummalative sum of salary
select *,
sum(salary) over(order by salary) from employees;

select *,
sum(salary) over(order by emp_id) from employees;

select *,
sum(salary) over(order by city) from employees;

select *,
sum(salary) over(order by department) from employees;

select *,
sum(salary) over(order by month(hire_date)) from employees;

select *,
sum(salary) over(partition by department order by salary) from employees;


-- windows own function
-- row_number() => to define a unique values
select *,
row_number() over() from employees;

select *,
row_number() over(partition by department) from employees;

select *,
row_number() over(partition by department order by hire_date) from employees;


-- rank() => give ranking
select *,
rank() over() from employees;

select *,
rank() over(order by salary) from employees;

select *,
rank() over(order by hire_date) from employees;

-- agr values same h to wo uss rank ko skip kr dega jaise ki 2 ko 1 rank milegi or 2 skip hokr sidhe 3 pr chali jyegi
select *,
rank() over(order by city) from employees;

-- dence_rank => not skip same values ranking
select *,
dense_rank() over(order by city) from employees;

select *,
dense_rank() over(partition by department order by salary ) from employees;





-- Add a row number for employees sorted by salary (highest first)
select *, row_number() over(order by salary desc) from employees;

-- Rank employees by salary (ties share rank)
select *, rank () over(order by salary) from employees;

-- Dense rank employees by salary (no gaps in rank numbers)
select *, dense_rank () over(order by salary) from employees;

-- Row number within each department by salary desc
select *, row_number() over(partition by department order by salary desc) from employees;

-- Rank within each department by salary desc
select *, rank() over(partition by department order by salary desc) from employees;

-- Show previous and next salary in overall salary order(LAG/LEAD)
-- haar row k samne uske next ki salary aayegi
select *, lead(salary) over() from employees;
select *, lead(salary,2) over() from employees; -- next 2 salary

--  haar row k samne uske previous ki salary aayegi
select *, lag(salary) over() from employees;
select *, lag(salary,2) over() from employees; -- previous 2 salary
select *, lag(salary) over(order by department) from employees;
select *, lag(salary) over(partition by department) from employees;

select *, lag(salary,1) over(partition by department order by hire_date),
salary -  lag(salary,1) over(partition by department order by hire_date) from employees;

select *, lag(salary) over(order by salary desc),lead(salary) over(order by salary desc) from employees;

-- Running total of sales amounts by date (overall)
select *, sum(amount) over(order by sale_date) from sales;

-- Running total of sales per employee by date
select *, sum(amount) over(partition by emp_id order by sale_date) from sales;

-- Total sales per row (same total repeated using window SUM)
select *, sum(amount) over() from sales;

-- Average salary per department shown on every employee row
select *, avg(salary) over(partition by department) from employees;

-- Top 2 salaries in each department (use ROW_NUMBER)
select * from (
select *, row_number() over(partition by department order by salary) as row_value
from employees) tempdata where row_value <= 2;

-- Salary difference vs department average
select *,avg(salary) over(partition by department),
salary - avg(salary) over(partition by department) from employees;

-- Percent rank of employees by salary (overall)
select *,sum(salary) over(), 
rank() over(order by salary),
percent_rank() over(order by salary) from employees;

-- Salary distribution into 4 buckets (NTILE)











