use sakila;

use world;
-- city (id pk), countrycode is the foreign key
select * from city;
describe city;

select * from country;
-- code (pk)
select count(code), count(distinct code) from country;





-- cy --> city name, cnt --> country name
select cy.id, cy.name, cy.countrycode,cnt.code,cnt.name,cnt.continent
	from city as cy
	join
	country as cnt
	where cy.countrycode=cnt.code;

select cnt.code, cnt.name, cnt.continent from country as cnt;



-- find the city name ,the population  the country name along with the govt. form for each city
select ct.name,ct.population,ctry.name, ctry.governmentform from city as ct
join
country as ctry
where ct.countrycode=ctry.code;

select * from countrylanguage;
select ctry.name, ctry.governmentform from country as ctry;

-- get the country name its population and the language spoken with the percnteage each language

select ctry.name, ctry.population from country as ctry
join
countrylanguage as ctrynm
where ctryn.code = ctrynm.code; 

select ctrynm.language, ctrynm.percentage from countrylanguage as ctrynm;

select cnt.name, cnt.population, cl.language, cl.percentage from countrylanguage as cl
join country as cnt
where cnt.code = cl.countrycode;










