use world;

select sum(population) from country;

-- jis ka name select  denge uska hi group by kr skte h 
select continent from country group by continent;
-- ham isko kisi function k sath de skte h direct nhi 
select continent, count(name) from country group by continent;

select count(name) from country where continent='Asia' and indepyear>1950 ;
select continent, count(name) from country where indepyear>1950 group by continent;

-- where m sirf wahi data filter hoga jo physically table m present hoga

-- having data wo data filter krega jo aggregate function k upr lgega or ye group by k baad lgega 
select continent, count(name) from country group by continent having count(name)>30;


select continent, sum(population) from country group by continent having sum(population)>30401150;

select * from country;

select indepyear,count(name) from country where indepyear>1930 group by indepyear having count(name)>2;

-- you need to get govtForm and the total no of country each govt form where the total country should be greter then 20
-- you need to get govtForm and the total no of country where the country should have the capital is 30
-- get the no of country and region and the total population where the life expectency greter then 38 and the populaton in each continent should be greter then 300000

select governmentform,count(name) from country group by governmentform having count(name)>20;

select governmentform,count(name) from country where capital > 30 group by governmentform;

select continent,count(name),count(region),sum(population) from country where lifeexpectancy > 38 group by continent having sum(population)>30;




























 






