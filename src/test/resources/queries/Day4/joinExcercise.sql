--1.Display all first_name and  related department_name
select FIRST_NAME,e.DEPARTMENT_ID, DEPARTMENT_NAME
from EMPLOYEES E join DEPARTMENTS D
on E.DEPARTMENT_ID = D.DEPARTMENT_ID;

--2.Display all first_name and department_name including the  employee without department
select FIRST_NAME,e.DEPARTMENT_ID, DEPARTMENT_NAME
from EMPLOYEES E left join DEPARTMENTS D
                      on E.DEPARTMENT_ID = D.DEPARTMENT_ID;


--3.Display all first_name and department_name including the department without employee
select FIRST_NAME,e.DEPARTMENT_ID, DEPARTMENT_NAME
from EMPLOYEES E right join DEPARTMENTS D
                           on E.DEPARTMENT_ID = D.DEPARTMENT_ID;


-- how many employee working in each department name
select DEPARTMENT_NAME, count(*)
from EMPLOYEES E  join DEPARTMENTS D
                            on E.DEPARTMENT_ID = D.DEPARTMENT_ID
group by DEPARTMENT_NAME;

--5. display all firstname and department name including the department without employees and also employees without department
select FIRST_NAME,DEPARTMENT_NAME
from EMPLOYEES E full join DEPARTMENTS D
on e.DEPARTMENT_ID=d.DEPARTMENT_ID ;

--display all cities and related country names
select CITY,COUNTRY_NAME
from LOCATIONS join COUNTRIES
on LOCATIONS.COUNTRY_ID = COUNTRIES.COUNTRY_ID;

--7. display all cities and related country names including with countries without city
select city,COUNTRY_NAME
from LOCATIONS right join COUNTRIES
on LOCATIONS.COUNTRY_ID = COUNTRIES.COUNTRY_ID;

--8. display all department name and related street address
select STREET_ADDRESS,DEPARTMENT_NAME
from LOCATIONS join DEPARTMENTS  -- left join, right join, full join for different results
on locations.location_id = DEPARTMENTS.LOCATION_ID;

--9. display first_name, last_name and department_name , city for all employees
select FIRST_NAME,LAST_NAME,DEPARTMENT_NAME,CITY
from EMPLOYEES join DEPARTMENTS
on employees.DEPARTMENT_ID=DEPARTMENTS.DEPARTMENT_ID
join LOCATIONS on DEPARTMENTS.LOCATION_ID=LOCATIONS.LOCATION_ID ;

--10. display first_name, last_name and department_name , city,country for all employees
select FIRST_NAME,LAST_NAME,DEPARTMENT_NAME,city,COUNTRY_NAME,region_name
from EMPLOYEES join DEPARTMENTS on EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
join LOCATIONS on DEPARTMENTS.LOCATION_ID = LOCATIONS.LOCATION_ID
join COUNTRIES on LOCATIONS.COUNTRY_ID = COUNTRIES.COUNTRY_ID
join REGIONS on COUNTRIES.REGION_ID = REGIONS.REGION_ID; -- can continue join with other table which has primary key and foreign key relations

-- how many employees working for each country_name?
select COUNTRY_NAME,count(*)
from EMPLOYEES join DEPARTMENTS on EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
               join LOCATIONS on DEPARTMENTS.LOCATION_ID = LOCATIONS.LOCATION_ID
               join COUNTRIES on LOCATIONS.COUNTRY_ID = COUNTRIES.COUNTRY_ID
group by COUNTRY_NAME
having count(*)>10;
--left join with where
select * from CUSTOMER c left join ADDRESS a
on a.ADDRESS_ID = c.ADDRESS_ID
where c.ADDRESS_ID is null;
