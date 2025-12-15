use world;

-- first indexing to last indexing, indexing start with 1 not 0
select name, substr(name,2),substr(name, 2,4) from country;

-- negative indexing
select name, substr(name,2),substr(name, -2) from country;
select name, substr(name,2),substr(name, -4,2) from country;

-- country name where country first charecter as same as continent first character
select name,continent, substr(name,1,1),substr(continent,1,1) from country where substr(name,1,1)=substr(continent,1,1);

-- get the country name and population where sratring 3 charecter of country is ALG
select name,population from country where substr(name,1,3) = 'alg';


-- to check the position of character in a row
select name, instr(name,'e') from country;

-- how check to many(length) character in a row
select name, char_length(name) from country;

-- find white speces and check length
select char_length('   purv    ');

-- remove white speces and check length
select char_length(trim('   purv   '));

-- remove right side white speces and check length
select char_length(rtrim('   purv   '));

-- remove left side white speces and check length
select char_length(ltrim('   purv   '));

-- remove last charecter only not mid
select trim( both 'z'from '   purzzvzzzzzzz');

-- remove capital A from name not small a beacause it is case sensetive
select name, trim( both 'A' from name) from country;

select name, trim(both 'a' from trim( both 'A' from name)) from country;

-- lpad and rpad
-- when we want to define a column with fixed size
-- rpad -> right side value add krna
select name, population,rpad(population,9,"#") from country;


-- left side value add krna
select name, population,lpad(population,9,"#") from country;










