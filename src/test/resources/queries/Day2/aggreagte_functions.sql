select * from employees;

/*
 AGGREGATE FUNCTIONS - multi rows - group functions
 -count --> it will count rows
 max = return max value
 min --> returns min value
 sum--> return total value
 avg --< returns average value

 Aggregate functions takes multi row and return one result
 all of them ignore null values.
 */

select *
from DEPARTMENTS;

select count(*) from DEPARTMENTS;

select count(*) from LOCATIONS;

select count(DEPARTMENT_ID) from EMPLOYEES;

-- task: how many diffrent first name we have??
select count (distinct FIRST_NAME) from EMPLOYEES;


--task: how many employees working as IT_PROG or SA_REP

select count(*) from EMPLOYEES
where job_ID in ('IT_PROG','SA_REP');

SELECT max(SALARY) from EMPLOYEES;
select min(SALARY) from EMPLOYEES;
select avg(SALARY) from EMPLOYEES;

select round(avg(salary)) from EMPLOYEES;
select round(avg(salary),1) from EMPLOYEES;
select round(avg(salary),2) from EMPLOYEES;








