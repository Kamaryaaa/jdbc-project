select * from employees;

/*
 1. column aliases -->it is temporary name to show in display
 2.Table aliases which we will learn later
 Employees --> E
 */


--the query below second column name is "round(avg(salary)) which is not nice
select  DEPARTMENT_ID, round(avg(SALARY)) as "Average salary" from EMPLOYEES -- alows space
where DEPARTMENT_ID is not null
group by DEPARTMENT_ID
having avg(SALARY)>6000
order by 2 ASC;

select  DEPARTMENT_ID, round(avg(SALARY)) as Average_salary from EMPLOYEES --dose'nt allow space
where DEPARTMENT_ID is not null
group by DEPARTMENT_ID
having avg(SALARY)>6000
order by 2 ASC;

--manager is asking display annual salary for all employees as annual_salary
select FIRST_NAME,SALARY*12 as "Annual_salary"
from EMPLOYEES;

-- note --> we are just displaying and nothing will change it in DB

--------------------STRING MANIPULATION------------------------
/*
 concat for java +
        for SQL || FIRST_NAME ||' ' ||LAST_NAME
 */
--i want to get full name column where we have first name + last name
select FIRST_NAME||' ' ||LAST_NAME as full_name
from EMPLOYEES;

--add @cydeo.com to all the emails in the employee table
select EMAIL||'@cydeo.com ' from EMPLOYEES;

select concat(EMAIL,'@cydeo.com') from EMPLOYEES;

--lowecase
select lower(EMAIL||'@cydeo.com ') from EMPLOYEES;

--upper

select upper(EMAIL||'@cydeo.com ') from EMPLOYEES;

--initcap
--make first letter upper case
select initcap(EMAIL||'@cydeo.com ') from EMPLOYEES;

--length
select email, length(email) as email_length from EMPLOYEES;

--display all employees where first name length equals 6
select FIRST_NAME from EMPLOYEES
where length (FIRST_NAME)=6;

select FIRST_NAME from EMPLOYEES
where FIRST_NAME like '______';


--how many??
select count(*)
from EMPLOYEES
where length(FIRST_NAME)=6;

--display initial from first and last name
-- substr(columnNamw, begining index, numberOfChar)
select * from EMPLOYEES;
select substr(FIRST_NAME,0,1)||'.'||substr(LAST_NAME,0,1)||'.' as initials from EMPLOYEES;

select substr(FIRST_NAME,1,1)||'.'||substr(LAST_NAME,1,1)||'.' as initials from EMPLOYEES;

select FIRST_NAME, substr(FIRST_NAME,-3,2) from EMPLOYEES; --can change the number

/*
 if the beginning index is 0, it is treated as1
 -if the beginning index negative, it will start from backwards
 -if we don't specify number of char, it will work till the end

 */




