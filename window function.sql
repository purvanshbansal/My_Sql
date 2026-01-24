-- window function


use world;
select code,name,population,continent, (select sum(population) from country) from country;

-- over()
select code,name,avg(population) over() ,continent,sum(population) over() from country;

-- partition by means grouping
select code,name,continent,population,sum(population) over(partition by continent) from country;

-- *what is running sum/cummulative sum
select code,name,continent,population,sum(population) over(order by population) from country;


-- partition by
select code,name,continent,population,
sum(population) over(),
sum(population) over(partition by continent) from country;

select code,name,continent,population,
sum(population) over(),
sum(population) over(partition by code) from country;

select code,name,continent,region,population,
sum(population) over(partition by continent),
sum(population) over(partition by continent,region) from country;






