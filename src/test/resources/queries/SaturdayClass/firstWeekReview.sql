select * from employees;
--------------- SELECT ,WHERE, LIKE -------------------

--TASK 1 - display department names  from departments table
select DEPARTMENT_NAME from DEPARTMENTS;

--TASK 2 - display first_name, last_name, department_id, salary from employees
select FIRST_NAME,LAST_NAME,DEPARTMENT_ID,SALARY
from EMPLOYEES;

--TASK 3 - display first_name, last_name, department_id, salary from employees whose salary is higher than 9000
select FIRST_NAME,LAST_NAME,DEPARTMENT_ID,SALARY
from
    EMPLOYEES
where salary >9000;

--TASK 4 - display first_name, last_name, department_id, salary from employees
--         whose salary equals or more than 9000 and salary equals or less than 15000
--         sort result based on salary asc
SELECT FIRST_NAME,LAST_NAME, DEPARTMENT_ID, SALARY FROM EMPLOYEES
WHERE SALARY BETWEEN 9000 AND 15000
ORDER BY SALARY;  --can use between


--TASK 5 -  display first_name, last_name, department_id, salary from employees
--          whose firstname is Peter and salary is bigger than 5000
--          sort result based on salary desc
select FIRST_NAME,LAST_NAME,DEPARTMENT_ID,SALARY from EMPLOYEES
where FIRST_NAME like 'Peter' and SALARY>5000
order by SALARY desc;


--TASK 6 - display country_id, country_name from countries table for region id 2 or 4
--         sort result based on region_id desc and country_name asc
select COUNTRY_ID,COUNTRY_NAME,REGION_ID
from COUNTRIES
where REGION_ID=2 or REGION_ID=4  --region_id in '2,4'
order by REGION_ID ,COUNTRY_NAME asc;




--TASK 7 -  display employee firstname and lastname as fullname , salary as annual salary  , job_id
--          whose job title starts with S
select FIRST_NAME||' '||LAST_NAME as full_name, SALARY*12 as anual_salary, JOB_ID
from EMPLOYEES
where JOB_ID like 'S%';



-- TASK 8 - display country id and country name where country name ends with a
select country_id , COUNTRY_NAME from COUNTRIES
where COUNTRY_NAME like '%a';



-- TASK 9 -  display country id and country name where country name ends with a and third letter is i
select COUNTRY_ID,COUNTRY_NAME
from COUNTRIES
where COUNTRY_NAME like '%a' and COUNTRY_NAME like '__i%'; --'__i%a'



------ INTERVIEW QUESTION  -->
/*
    Write a query to print first_name and salary for all employees in the Employee table
    who earn a salary larger than 3000
    Sort your results in ascending order of the last 3 characters in the employees first_name
    if two or more employees have first_names ending with same 3 characters, then sort them by highest salary
*/
-- TASK 10- 1 -  how many city we have in each country from locations table
SELECT COUNTRY_ID,COUNT(*) FROM LOCATIONS
GROUP BY COUNTRY_ID;

-- BEST PRACTICE IN THIS EXAMPLE SINCE WE NEED TO COUNT CITIES
SELECT COUNTRY_ID,COUNT(CITY) FROM LOCATIONS
GROUP BY COUNTRY_ID;

SELECT COUNTRY_ID,CITY FROM LOCATIONS;


-- COUNT(*) VS COUNT(CNAME)
-- COUNT(*) --> WILL COUNT ROWS
-- COUNT(CNAME) --> WILL COUNT COLUMNS AND IGNORES NULL VALUES
SELECT FIRST_NAME,DEPARTMENT_ID FROM EMPLOYEES;
SELECT COUNT(DEPARTMENT_ID) FROM EMPLOYEES; --> 106
SELECT COUNT(*) FROM EMPLOYEES; --> 107


-- TASK 10- 2  - order them based on city count in desc
SELECT COUNTRY_ID,COUNT(CITY) AS CITY_COUNT FROM LOCATIONS
GROUP BY COUNTRY_ID
ORDER BY CITY_COUNT DESC;


-- TASK 10- 3 -  filter result where country id starts with C
SELECT COUNTRY_ID,COUNT(CITY) AS CITY_COUNT FROM LOCATIONS
WHERE COUNTRY_ID LIKE 'C%'
GROUP BY COUNTRY_ID
ORDER BY CITY_COUNT DESC;


-- TASK 10- 3 -  display country id if city count is bigger than 1
SELECT COUNTRY_ID,COUNT(CITY) AS CITY_COUNT FROM LOCATIONS
GROUP BY COUNTRY_ID
HAVING COUNT(CITY)>1
ORDER BY CITY_COUNT DESC;


-- TASK 11 -1  How many employees is working for each department
SELECT DEPARTMENT_ID,COUNT(*) AS EMPLOYEE_COUNT FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- TASK 11 -2  ignore null departments
SELECT DEPARTMENT_ID,COUNT(*) AS EMPLOYEE_COUNT FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID;

-- TASK 11 -3  display department id where employees count is less than 5
SELECT DEPARTMENT_ID,COUNT(*) AS EMPLOYEE_COUNT FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID
HAVING COUNT(*)<5;


------- SUBQUERY -------

-- TASK 12 - Display those employees firstname,lastname and salary
--           who get higher salary than the employee whose employee_id is 132

--STEP 1 --> FIND ME SALARY OF EMPLOYEE_ID 132
SELECT FIRST_NAME,SALARY FROM EMPLOYEES
WHERE EMPLOYEE_ID=132;

--STEP 2 --> FIND ME WHO IS GETTING MORE THAN 2100
SELECT FIRST_NAME,LAST_NAME,SALARY FROM EMPLOYEES
WHERE SALARY>2100;

-- SOLUTION --> MAKE IT DYNAMIC
SELECT FIRST_NAME,LAST_NAME,SALARY FROM EMPLOYEES
WHERE SALARY>(SELECT SALARY FROM EMPLOYEES
              WHERE EMPLOYEE_ID=132);

-- TASK 13 -  Display Manager firstname,lastname of Peter,Vargas from employees table

SELECT * FROM EMPLOYEES;
--STEP 1 --> FIND ME MANAGER ID FOR  Peter,Vargas
SELECT MANAGER_ID FROM EMPLOYEES
WHERE FIRST_NAME='Peter' AND LAST_NAME='Vargas'; --124

--STEP 2 --> FIND ME INFORMATION ABOUT EMPLOYEE_ID 124
SELECT FIRST_NAME,LAST_NAME FROM EMPLOYEES
WHERE EMPLOYEE_ID=124;


-- SOLUTION --> MAKE IT DYNAMIC
SELECT FIRST_NAME,LAST_NAME FROM EMPLOYEES
WHERE EMPLOYEE_ID=(SELECT MANAGER_ID FROM EMPLOYEES
                   WHERE FIRST_NAME='Peter' AND LAST_NAME='Vargas');



-- TASK 12 - Display those employees firstname,lastname and salary
--           who get higher salary than the employee whose employee_id is 132
select FIRST_NAME,LAST_NAME, SALARY
from EMPLOYEES
where SALARY>(select SALARY from EMPLOYEES where EMPLOYEE_ID=132);


-- TASK 13 -  Display Manager firstname,lastname of Peter,Vargas from employees table
select m.FIRST_NAME,m.LAST_NAME from
EMPLOYEES w join EMPLOYEES m
on w.MANAGER_ID=m.EMPLOYEE_ID
where w.FIRST_NAME='Peter' and w.LAST_NAME='Vargas';


-- TASK 14 - Display Employees first_name,last_name who reports to 'Steven King'
select w.FIRST_NAME,w.LAST_NAME
from EMPLOYEES w join EMPLOYEES m
on w.MANAGER_ID=m.EMPLOYEE_ID
where m.FIRST_NAME='Steven' and m.LAST_NAME='King';

--opt2--
SELECT FIRST_NAME,LAST_NAME FROM EMPLOYEES
WHERE MANAGER_ID=(SELECT EMPLOYEE_ID FROM EMPLOYEES
                  WHERE FIRST_NAME='Steven' AND LAST_NAME='King');


-- TASK 15 -  display all information who is getting 11th highest salary
select * from EMPLOYEES
where  SALARY=(select distinct min(SALARY) from (select distinct salary from EMPLOYEES order by SALARY desc )
                                 where rownum<12);



-- TASK 16 - Display employees first_name,last_name who is working in Marketing department
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;

--STEP 1 --> FIND MARKETING DEPARTMENT ID
SELECT DEPARTMENT_ID FROM DEPARTMENTS
WHERE DEPARTMENT_NAME='Marketing'; --20

--STEP 2 --> FIND EMPLOYEES WHO IS WORKING IN THIS DEPARTMENT
SELECT FIRST_NAME,LAST_NAME,DEPARTMENT_ID FROM EMPLOYEES
WHERE DEPARTMENT_ID=20;

--SOLUTION -->
select FIRST_NAME,LAST_NAME from EMPLOYEES
where DEPARTMENT_ID = (select DEPARTMENT_id from DEPARTMENTS where DEPARTMENT_NAME='Marketing');


--- DDL / DML --- as a tester, this is not my responsibility
--DQL--DATA QUERY LANGUAGE -->SELECT
--DML-->DATA MANIPULATION LANGUAGE
--



----- JOINS ----

-- INNER JOIN RETURN ONLY THE DATA THAT MATCH FROM BOTH TABLE ACCORDING TO CONDITION
-- Display all first_name and  related department_name
select FIRST_NAME,DEPARTMENT_NAME from
             EMPLOYEES join DEPARTMENTS on EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;



-- LEFT OUTER JOIN RETURN EVERYTHING THAT MATCH + THOSE DID NOT MATCH FROM LEFT TABLE
-- Display all first_name and department_name including the  employee without department
select FIRST_NAME,DEPARTMENT_NAME from
    EMPLOYEES left join DEPARTMENTS on EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;


-- RIGHT OUTER JOIN
-- Display all first_name and department_name including the department without employee
select FIRST_NAME,DEPARTMENT_NAME from
    EMPLOYEES right join DEPARTMENTS on EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;



-- FULL OUTER JOIN
-- Display all firstname and department name including the department without employees
-- and also employees without the department
select FIRST_NAME,DEPARTMENT_NAME from
    EMPLOYEES full join DEPARTMENTS on EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
order by FIRST_NAME asc, DEPARTMENT_NAME desc ;

select DEPARTMENT_Name,count( FIRST_NAME) from EMPLOYEES join DEPARTMENTS on EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
                                         where DEPARTMENT_NAME like 'S%'
group by DEPARTMENT_Name;

--TASK 1-1
-- From the departments and locations tables,
-- display the department name, city, and state province for each department.


--TASK 1-2
-- display only department names ends with Sales


-- TASK 2
-- From employees, departments, and locations tables,
-- find those employees whose first name contains a letter 'z'.
-- Return first name, last name, department, city, and state province.


--TASK 3
-- From the employees and departments table,
-- compute the average salary, number of employees for each department.
-- Return department name, average salary and number of employees.


--TASK 4
-- From the employees, departments, and locations tables,
-- find full name (first and last name), and salary of those employees
-- who work in any department located in Oxford .


--TASK 5
-- From the employees, departments, and locations tables,
-- find avg salary for each city



----- SELF JOIN ---
-- Display  all employees and their  managers information
select * from
             EMPLOYEES w join EMPLOYEES m
on w.EMPLOYEE_ID=m.MANAGER_ID;


-- Given the Employee table, write a SQL query that finds out employees who earn more than their managers.
select * from EMPLOYEES worker join EMPLOYEES manag
on worker.MANAGER_ID=manag.EMPLOYEE_ID
where worker.SALARY>manag.SALARY;


-------  SET OPERATORS ---
