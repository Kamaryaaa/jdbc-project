select *
from EMPLOYEES;
create table Developers(
                           Id_Number Integer primary key,
                           Names varchar(30),
                           Salary Integer
);

select * from DEVELOPERS;

create table Testers(
                        Id_Number Integer primary key,
                        Names varchar(30),
                        Salary Integer
);
select * from Testers;

insert into developers values (1, 'Mike', 155000);
insert into developers values (2, 'John', 142000);
insert into developers values (3, 'Steven', 850000);
insert into developers values (4, 'Maria', 120000);
insert into testers values (1, 'Steven', 110000);
insert into testers values(2, 'Adam', 105000);
insert into testers values (3, 'Lex', 100000);



commit work;

select * from DEVELOPERS
union
select *
from Testers;

/*
 The UNION operator removes all duplicate rows unless the UNION
ALL is used.
 */
select NAMES from Developers
union
select Names from testers;

/*
 union all

 -dont remove dups
 -dont sort the results
 */
 select * from Developers
union all
select * from Testers;

--wrong data type dont work
select NAMES,Salary from Developers
union
select Id_Number,Names from testers;

/*
 MINUS
 --set operator returns records from first query that is
not present in second query.

--It will only return values (from 1st query) that are not
common in 2 queries
 */
select names from Developers
minus
select names from Testers;

/*
 intersect --> return the common
 */
select names from Developers
intersect
select names from Testers;

