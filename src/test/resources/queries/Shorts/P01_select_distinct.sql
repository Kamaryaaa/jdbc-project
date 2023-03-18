select * from employees;

/*
 new console shortcut:
 MAC: CMD +ENTER
 WIN: CTRL + ENTER
 */

 /*
  SELECT STATEMENT:

  1. selecting a ENTIRE column from a table
  select columnName from TableName;

  2. selecting SINGLE column from a Table;
  select columnName from TableName;

  3.selecting MULTIPLE column from a table
  select ColumnName1,ColumnName1.... from TableName;

  4. selecting columns from a MULTIPLE tables
  select TableName1.ColumnName1, TableName2.ColumName2 from TableName1, TableName2;
  */

select * from departments;
-- Each SQL statement needs to end with semi-colon

select * from employees;

select department_name from DEPARTMENTS;

select  DEPARTMENT_ID,DEPARTMENT_NAME from DEPARTMENTS;

select * from DEPARTMENTS,EMPLOYEES;

select  EMPLOYEES.FIRST_NAME,DEPARTMENT_NAME FROM DEPARTMENTS,EMPLOYEES


select FIRST_NAME from EMPLOYEES;
select distinct (FIRST_NAME) from EMPLOYEES;

select SALARY from EMPLOYEES;
select distinct (SALARY) from EMPLOYEES;