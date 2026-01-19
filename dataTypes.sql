-- data types

-- number => int, decimal
-- tinyint, smallint,mediumint, int, bigint
-- 1byte, 2byte, 3byte, 4byte, 8byte
-- 1byte = 8bit 2**8 => 256 (-128 to 127)

use regex1;
create table yash1(salary tinyint);

insert into yash1 values(127);
insert into yash1 values(128); -- give error

create table yash2(salary float, price double);
insert into yash2 values(100.6781241, 100.6781241);
insert into yash2 values(100.6781241, '100.6781241');

select * from yash2;

-- string values char vs varchar()
-- char => fixed length/size character
-- varchar => variable length character

create table yash3( name varchar(20), gender char(10));
insert into yash3 values('tushar','male'),('aman','male'),('ot','female');
insert into yash3 values('raj        ','male        ');
select * from yash3;
select *, length(name),length(gender) from yash3;
-- varchar count the white spece till the length of column
-- char remove white space from the last












