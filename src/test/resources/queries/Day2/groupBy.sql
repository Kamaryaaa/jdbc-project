-- your manager is asking all jobs and their average salary.

select *
from EMPLOYEES;

select distinct JOB_ID from EMPLOYEES;

--avg salary for IT prog
select avg(SALARY)
from EMPLOYEES
where JOB_ID like 'IT_PROG';

select avg(SALARY)
from EMPLOYEES
where JOB_ID like 'AC_ASST';

select JOB_ID,avg(SALARY), count(*) , sum(SALARY), min(SALARY), max(SALARY)from EMPLOYEES
group by JOB_ID;

--display how many department we have in each location
select LOCATION_ID, count(*)
from DEPARTMENTS
group by LOCATION_ID;




--display how many countries we have in each region
select REGION_ID,count(*)
from COUNTRIES
group by REGION_ID
order by count(*);

--oder them based on num of countries
select REGION_ID,count(*)
from COUNTRIES
group by REGION_ID
order by 2 desc ;  -- order by 1 asc(will be based on region id;

-- display total salary for each department from employees table
select DEPARTMENT_ID, sum(SALARY),count(*)
from EMPLOYEES
group by DEPARTMENT_ID
order by 2 asc;

select DEPARTMENT_ID, sum(SALARY),count(*)
from EMPLOYEES
where DEPARTMENT_ID is not null   -- to remove null department id from the result
group by DEPARTMENT_ID
order by 2 asc;

--- display jobisd where their avg salary more than 5k
select JOB_ID,avg(SALARY) from EMPLOYEES
where SALARY>5000
group by JOB_ID
order by 2 desc ;

-- display departments where their avg is more than 6k
select  DEPARTMENT_ID, round(avg(SALARY)) from EMPLOYEES
where DEPARTMENT_ID is not null
group by DEPARTMENT_ID
having avg(SALARY)>6000;


-- IQ ---> display duplicates ( more than one) firstname from employees table
select FIRST_NAME,count(*) from EMPLOYEES
group by FIRST_NAME
having count(*)>1;

--display department id where employess count is bigger than 5
select DEPARTMENT_ID, count(*) from EMPLOYEES
group by DEPARTMENT_ID
having count(*)>5;


