-- case
-- if(condition, True, False)
-- if (condition, True, if(condition, True, if))

/* case
	when condition | Expression then output
    when condition. then output
    
END
*/

use world;
select name,population,
case
	when population = 0 then 'No Population'
    when population between 8000 and 70000 then 'Med Population'
    else 'Condition is False'
end as 'status' from world.country;


select count(*),
case
	when population = 0 then 'No Population'
    when population between 8000 and 70000 then 'Med Population'
    else 'Condition is False'
end as 'status' from world.country group by status;


select continent,
sum(case 
	when population between 8000 and 70000 then 1 else 0
	end)
from world.country
group by continent;

