 select EMPLOYEE_ID,FIRST_NAME,LAST_NAME,MANAGER_ID from EMPLOYEES;

-- who is Neena's manager
select workers.EMPLOYEE_ID,workers.FIRST_NAME,workers.LAST_NAME,workers.MANAGER_ID,managers.EMPLOYEE_ID,managers.FIRST_NAME, managers.LAST_NAME
    from EMPLOYEES workers join EMPLOYEES managers
on workers.MANAGER_ID=managers.MANAGER_ID;

--how can i see all employees even if they dont have manager?
 select w.EMPLOYEE_ID,w.FIRST_NAME,w.LAST_NAME,w.MANAGER_ID,m.EMPLOYEE_ID,m.FIRST_NAME, m.LAST_NAME
 from EMPLOYEES w  left join EMPLOYEES m
                             on w.MANAGER_ID=m.EMPLOYEE_ID
order by 1 asc;

