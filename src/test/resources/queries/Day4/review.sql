--display all the information getting lowest salary
select distinct  SALARY
from employees
order by SALARY;

select * from EMPLOYEES where SALARY=(select max(salary) from(select distinct SALARY from EMPLOYEES order by SALARY)
                                                         where ROWNUM<4);

--find who is making 46th minnimum salary
select * from EMPLOYEES where SALARY=(select max(salary) from(select distinct SALARY from EMPLOYEES order by SALARY)
                                      where ROWNUM<47);

