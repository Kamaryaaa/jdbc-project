select * from EMPLOYEES;


-- display all information where first name is david
select * from EMPLOYEES
where FIRST_NAME='David';



-- '' --> whatever inside this is case sensitive
select * from EMPLOYEES
where FIRST_NAME='David' and LAST_NAME='Lee';



-- display first name, lastname,salary where firstname is Peter
select FIRST_NAME,LAST_NAME,SALARY
from EMPLOYEES
where FIRST_NAME='Peter';

--display all information from employees where salary is bigger than 6000;
select *
from EMPLOYEES
where SALARY > 6000;

--display email of who is making less than 5000;
select EMAIL from EMPLOYEES
where SALARY < 5000;


--display all info from employees who is making more than 7000 and department id is 60
select * from EMPLOYEES
where SALARY > 7000 and DEPARTMENT_ID=60;


--display all info from employees who is making equals  more than 3000 and less than 7000;
select * from EMPLOYEES
where SALARY >=3000 and SALARY<= 7000;

select * from EMPLOYEES
where SALARY between 3000 and 7000;

--display all the information from employees who is working as IT_PROG or MK_MAN
select * from EMPLOYEES
where JOB_ID='IT_PROG' or JOB_ID='MK_MAN'

--display all info where employee id is 121,142,154,165,187
select * from EMPLOYEES
where EMPLOYEE_ID=121 or EMPLOYEE_ID=142 or EMPLOYEE_ID=154;

select * from EMPLOYEES
where EMPLOYEE_ID in(121,142,154,165,187);

--display all the information where country id is US and IT
 select * from COUNTRIES
where COUNTRY_ID in ('US','IT');

--display all the information where country id is  not US and IT
select * from COUNTRIES
where COUNTRY_ID not in ('US','IT');

--is null
select * from EMPLOYEES
where DEPARTMENT_ID is null ;

select * from EMPLOYEES
where MANAGER_ID is null ;