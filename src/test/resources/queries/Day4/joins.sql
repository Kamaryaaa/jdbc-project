select * from customer;
select * from ADDRESS;

 select FIRST_NAME,LAST_NAME,ADDRESS,PHONE
from CUSTOMER join ADDRESS
on CUSTOMER.ADDRESS_ID = address.ADDRESS_ID;

--Q: what if i want to see customer table address_id info too
select FIRST_NAME,LAST_NAME,CUSTOMER.ADDRESS_ID, ADDRESS.ADDRESS_ID,ADDRESS,PHONE
from CUSTOMER join ADDRESS
on CUSTOMER.ADDRESS_ID = address.ADDRESS_ID;

--table aliases
--customer---c
--employees ---e
--Address --A

--inner join and join is same
select FIRST_NAME,LAST_NAME,C.ADDRESS_ID, A.ADDRESS_ID,ADDRESS,PHONE
from CUSTOMER C inner join ADDRESS A  --make aliases in this line
                   on C.ADDRESS_ID = A.ADDRESS_ID;

--left join or left outer join
select FIRST_NAME,LAST_NAME,C.ADDRESS_ID, A.ADDRESS_ID,ADDRESS,PHONE
from CUSTOMER C left join ADDRESS A  --make aliases in this line
                           on C.ADDRESS_ID = A.ADDRESS_ID;

--right join or right outer join
select FIRST_NAME,LAST_NAME,C.ADDRESS_ID, A.ADDRESS_ID,ADDRESS,PHONE
from CUSTOMER C right join ADDRESS A  --make aliases in this line
                           on C.ADDRESS_ID = A.ADDRESS_ID;

--full join or full outer join

select FIRST_NAME,LAST_NAME,C.ADDRESS_ID, A.ADDRESS_ID,ADDRESS,PHONE
from CUSTOMER C full join ADDRESS A  --make aliases in this line
                           on C.ADDRESS_ID = A.ADDRESS_ID;

