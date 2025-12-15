-- aggegate function ( multi line function ) => will give you some result 

-- distinct
use world;
select distinct continent from country;

select distinct continent, region from country;

-- aggregate => to apply some calculation over set of rows
-- count(col) => only data present will be counted
select count(indepyear) from country;
-- count(*) => count all row its missing or not
select count(*) from country;

select count(population),sum(population),avg(population),max(population),min(population) from country;

select count(continent), count(distinct continent) from country;

select count(indepyear), count(*) from country where continent='Asia';
select * from country;

-- get the count5ry name the total country and region along with the ave lifeecpectncy and the total population for the countrys who has for the independece after 
-- 1947 and before 1998
select count(name),count(region), avg(LifeExpectancy),sum(population) from country where indepyear > 1947 and indepyear < 1998 ;

-- get the total no of country the unique region along with the total population and the highest lifeecpectncy with the total capitals for 
-- the country starting with letter 'A' and 'D'

select count(distinct region) , count(name), sum(population),max(LifeExpectancy),sum(capital) from country where name like 'A%' or name like 'D%' ;

-- group by statement (similar values ko collect krna in a group by)
-- jis bhi column pr hm group by krte h whi column pr group by kr skte h kisi or pr nhi
select continent from country group by continent;
select continent,count(name) from country group by continent;

-- you need to find out the total countrys and the population for each independent year
select count(name),sum(population),indepyear from country group by indepyear; 





