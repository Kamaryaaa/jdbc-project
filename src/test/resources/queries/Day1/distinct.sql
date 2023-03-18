--select  * from EMPLOYEES;

/*
 it shows different values from query result based provided column
 */

select FIRST_NAME from EMPLOYEES;

select distinct FIRST_NAME from EMPLOYEES;
select distinct * from EMPLOYEES;
select distinct * from EMPLOYEES;

select JOB_ID from JOBS;
--simce primary key cannot be duplicated it gives the same result
select distinct job_id from JOBS;
