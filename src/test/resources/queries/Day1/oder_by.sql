select *
from EMPLOYEES;

/*
  ORDERBY
        - It allows us to sort data based on provided column
        -AS a Default it will order the result ASCENDING ORDER(A-Z,0-9)
        -IF you want to sort it DESCENDING order we need to specify right after column name
 */

 --display all the employees based on salary in asc order

select * from EMPLOYEES
order by SALARY;

--same--
select * from EMPLOYEES
order by SALARY asc;

select * from EMPLOYEES
order by SALARY desc ;

select * from EMPLOYEES
order by FIRST_NAME desc ;

-- display all info where emp id is less than 120 and order by salary desc
select *
from EMPLOYEES
where EMPLOYEE_ID<120
order by SALARY desc ;

--display all information from employees and oder them based on first name asc and lastname desc
select * from EMPLOYEES
order by FIRST_NAME,LAST_NAME desc ;



