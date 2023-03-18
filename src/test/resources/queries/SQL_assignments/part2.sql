--1. Display full addresses from locations table in a single column
select STREET_ADDRESS||', '||CITY||' '||STATE_PROVINCE||', '||COUNTRY_ID||' '||POSTAL_CODE as Address from LOCATIONS ;

--2.  Display all informations of the employee who has the minimum salary in employees table
select *
from EMPLOYEES
where SALARY=(select min(SALARY) from EMPLOYEES);

select SALARY from
                  EMPLOYEES
order by SALARY;

--3. Display the second minimum salary from the employees
select distinct SALARY from EMPLOYEES where SALARY=(select  max(salary) from (select SALARY from EMPLOYEES order by SALARY)
                                      where ROWNUM<3);

--4.Display all informations of the employee who has the second minimum salary

select * from EMPLOYEES where SALARY=(select max(SALARY) from( select SALARY from EMPLOYEES order by SALARY)
                                                         where ROWNUM<3);

--5. List all the employees who are making above the average salary;
select * from EMPLOYEES
where SALARY>(select avg(SALARY) from EMPLOYEES);

--6. List all the employees who are making less than the average salary
select *
from EMPLOYEES where SALARY<(select avg(SALARY) from EMPLOYEES);

--7.Display manager name of 'Neena'
select m.FIRST_NAME,m.LAST_NAME
    from EMPLOYEES e join EMPLOYEES m
on e.MANAGER_ID=m.EMPLOYEE_ID
where e.FIRST_NAME like 'Neena';

--8. Find the 3rd maximum salary from the employees table (do not include duplicates)
select distinct SALARY from EMPLOYEES where SALARY=(select min(SALARY) from(select distinct SALARY from EMPLOYEES order by salary desc )
                                                                       where rownum<4);

select distinct salary
from EMPLOYEES
order by salary  ;

--9. Find the 5th maximum salary from the employees table (do not include duplicates)
select distinct SALARY
from EMPLOYEES where SALARY=(select min(SALARY) from (select distinct salary from EMPLOYEES order by SALARY desc )
                                                where rownum<6);

--10. Find the 7th maximum salary from the employees table (do not include duplicates)
select distinct SALARY from EMPLOYEES where SALARY=(select min(SALARY) from (select distinct SALARY from EMPLOYEES order by SALARY desc )
                                                              where ROWNUM<8);
--11. Find the 10th maximum salary from the employees table (do not include duplicates)
select distinct SALARY from EMPLOYEES where SALARY=(select min(SALARY) from (select  distinct SALARY from EMPLOYEES order by SALARY desc )
                                                              where rownum<11);

--12.Find the 3rd minimum salary from the employees table (do not include duplicates)
select distinct SALARY
from EMPLOYEES where SALARY=(select distinct max(SALARY) from (select distinct SALARY from EMPLOYEES order by SALARY asc  )
    where ROWNUM<4);

--13.Find the 5th minimum salary from the employees table (do not include duplicates)
select distinct  SALARY from EMPLOYEES where SALARY = (select max(salary) from (select distinct SALARY from EMPLOYEES order by SALARY)
                                                                          where rownum<6);
