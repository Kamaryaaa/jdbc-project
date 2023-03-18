select *
from employees;

--display all information who is making max salary
select max(SALARY)
from EMPLOYEES ;

--if we know max salary, can we find who is getting it
select *from EMPLOYEES where SALARY=24000;

--for dynamic result
select *from EMPLOYEES where SALARY=(select max(SALARY) from EMPLOYEES);

--Task: Give me all information who is getting min salary
--min salary?
select * from EMPLOYEES
where SALARY=(select min(salary) from EMPLOYEES);

--display all info who is making second highest salary
--first max salary
select max(SALARY) from EMPLOYEES;

--second max salary
select max(SALARY)
from EMPLOYEES
where SALARY<24000;

-- who is making the second high
select *
from EMPLOYEES
where SALARY=(select max(salary) from EMPLOYEES where SALARY< (select max(SALARY) from EMPLOYEES));

--task --display all information who is getting more than average
select * from EMPLOYEES
where SALARY > (select round(avg(SALARY),1) from EMPLOYEES);