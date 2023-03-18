select * from EMPLOYEES;


/*
 - Percent % --> for matching any sequence of character
 -underscore _ --> for matching any single character.
 */

 --display all employees where first_name statswith B
select * from EMPLOYEES
where FIRST_NAME like 'B%';

-- display all employees where first name start with B anf length of it is 5

select * from EMPLOYEES
where FIRST_NAME like'B____';

--display 5 letter firstname from employees where middle char is z
select * from EMPLOYEES
where FIRST_NAME like '__z__';

--display first name endwith 'e';
select *
from EMPLOYEES
where FIRST_NAME like '%e';

--display all where job id contains IT
select * from EMPLOYEES
where JOB_ID like '%IT%';

--display all information where firstname start with H and ending with L
select * from EMPLOYEES
where FIRST_NAME like 'H%l' ;
