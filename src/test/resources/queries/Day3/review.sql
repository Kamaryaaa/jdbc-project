select *
from employees;


--task: how many locations we have for each country
select COUNTRY_ID, count(*) from LOCATIONS
group by COUNTRY_ID;

--oder them baased on country id;

select COUNTRY_ID, count(*) from LOCATIONS
group by COUNTRY_ID
order by COUNTRY_ID;

--what if i only want to see US,UK, and CA

select COUNTRY_ID, count(*) from LOCATIONS
where COUNTRY_ID in ('US','UK','CA')
group by COUNTRY_ID
order by COUNTRY_ID;

--display where location count is bigger than 2
select COUNTRY_ID, count(*) from LOCATIONS
where COUNTRY_ID in ('US','UK','CA')
group by COUNTRY_ID
having count(*)>2
order by COUNTRY_ID;

--Task2: Display all employees salary in following format as column name Employee_salary
select FIRST_NAME||' makes '|| SALARY as "Employee_salary"
from EMPLOYEES;
select * from EMPLOYEES
where SALARY=(Select Max(salary) from EMPLOYEES);

select FIRST_NAME from EMPLOYEES
where length(FIRST_NAME)=6;

select FIRST_NAME from EMPLOYEES
where FIRST_NAME like '______';