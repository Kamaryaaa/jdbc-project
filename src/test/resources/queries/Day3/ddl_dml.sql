select * from EMPLOYEES;

/*
 create table syntax:
        create tableName(
 colName DataType Constrains,
 colName2 DataType Constrainsts(optional)
 colName DataType Contraints,
 ...
 );
 */

 ----Create Table----
create table scrumteam(
    emp_id Integer primary key,
    first_name varchar(30) not null,
    last_name varchar(20) not null,
    job_title varchar(20),
    salary Integer
);

select *
from scrumteam;

/*
 INSERT INTO tableName (column1, column2,...)

VALUES (value1, value2 ... );
 */
 insert into scrumteam(emp_id, first_name, last_name, job_title, salary)
 values (1,'Saverus','snape','Tester',130000);

insert into scrumteam(emp_id, first_name, last_name, job_title, salary) values (6,'Saverus','snape','Tester',140000);
insert into scrumteam(emp_id, first_name, last_name, job_title, salary) values (7,'Saverus','snape','Tester',136000);
insert into scrumteam(emp_id, first_name, last_name, job_title, salary)
values (8,'Saverus','snape','Tester',130070);
insert into scrumteam(emp_id, first_name, last_name, job_title, salary)
values (9,'Saverus','snape','Tester',830000);

commit; -- save changes so that other people, connections can get the updates.

/*
 UPDATE table_name

SET column1 = value1,

column2 = value2 , ...

WHERE condition;
 */

update scrumteam
set salary=salary+5000;

update scrumteam
set salary=100000
where emp_id=9;

commit work ;

/*
 DELETE FROM table_name

WHERE condition;
 */

delete
from scrumteam
where emp_id=4;

commit ;

--crud
--create(insert)
--read(select)
--update(update)
--delete(delete)

--Alter

--Add new column
alter table scrumteam add gender varchar(10);
select * from scrumteam;

update scrumteam
set gender = 'Male'
where emp_id=1;

--rename the column
alter table scrumteam rename
column salary to annual_salary;

--drop colunm

alter table scrumteam drop column gender;

--rename table
alter table  scrumteam rename to agileteam;

select *
from agileteam;

--truncate
truncate table agileteam;

--drop table
drop table agileteam;
commit ;

/*
 IQ: what is the difference between truncate and drop
 truncate--> only delete the data
 drop--> deleter the data and table itself
 */








