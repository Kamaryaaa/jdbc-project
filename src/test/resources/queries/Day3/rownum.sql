select *
from EMPLOYEES;

/*
 it limits rows based on provided number
 */

 select * from EMPLOYEES
where rownum <11;

-- display all information from employees who is getting first 5 highest salary
select *
from EMPLOYEES
where rownum<=5
order by SALARY desc; -- didnt take highest 5


select *
from (select * from EMPLOYEES order by SALARY desc)
where rownum<6
order by SALARY desc ;

--display all info who is making 5th highest salary
select  min(SALARY)
from (select distinct SALARY from EMPLOYEES order by SALARY desc)
where rownum<6
order by SALARY desc ;

--who is making 5th highest?
select * from EMPLOYEES
where SALARY=(select  min(SALARY)
              from (select distinct SALARY from EMPLOYEES order by SALARY desc)
              where rownum<6);

--iq: how many do u find who is making 37th highest salary
select * from EMPLOYEES
where SALARY=(select  min(SALARY)
              from (select distinct SALARY from EMPLOYEES order by SALARY desc)
              where rownum<38);

-- display all information who is making 3th lowest salary

select * from EMPLOYEES
where SALARY=(select  max(SALARY)
              from (select distinct SALARY from EMPLOYEES order by SALARY asc )
              where rownum<4);

select SALARY from EMPLOYEES order by SALARY;

