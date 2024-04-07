
In mysql the select statement which returns multiple rows is allowed to be written inside 
the procedure, but in other databases like oracle, allows only select….into statement 
inside the procedure

hence if you need multiple rows from a table inside procedure, then we use cursor.

step by step procedure to use cursor

1. declare the cursor
2. declare continue handler to stop the loop
3. open cursor -→ the data will be populated in the cursor
4. fetch the next row in the cursor
5. check if it is last row, then stop the loop and goto step 8
6. process the row
7. repeat steps 4 to 6 till the data is available in the cursor
8. close cursor

display all employees from emp table

delimiter //
create procedure displayallemp()
begin
declare vfinished int default 0;
declare vempno,vmgr,vdeptno int;
declare vename,vjob varchar(20);
declare vsal,vcomm float(9,2);
declare vhiredate date;
declare empcur cursor for select * from emp;
declare continue handler for NOT FOUND set vfinished=1;
open empcur;
label1:loop
fetch empcur into vempno,vename,vjob,vmgr,vhiredate,
 vsal,vcomm,vdeptno;
if vfinished=1 then 
leave label1;
end if;
select vempno,vename,vjob,vmgr,vhiredate,vsal,vcomm,vdeptno; 
end loop;
close empcur;
end//
delimiter ;

2. update sal of employee using following rules also display the count for number of 
employees for each job
if job manager then increases by 10%
if job is clerk the increase it 20%
if analyst then 25%
otherwise, 8%

delimiter //
mysql> create procedure updatesalemp(out ccnt int,out mcnt int,out acnt int,out other 
int)
 -> begin
 -> declare vfinished int default 0;
 -> declare vempno int;
 -> declare vename,vjob varchar(20);
 -> declare vsal,vincsal float(9,2);
 -> declare empcur cursor for select empno,ename,job,sal from emp;
 -> declare continue handler for NOT FOUND set vfinished=1;
 -> set ccnt=0;
 -> set mcnt=0;
 -> set acnt=0;
 -> set other=0;
 -> open empcur;
 -> label1:loop
 -> fetch empcur into vempno,vename,vjob,vsal;
 -> if vfinished=1 then
 -> leave label1;
 -> end if;
 -> if vjob='MANAGER' then
 -> set mcnt=mcnt+1;
 -> set vincsal=vsal*1.1;
 -> update emp
 -> set sal=vincsal
 -> where empno=vempno;
 ->
 -> elseif vjob='CLERK' then
 -> set ccnt=ccnt+1;
 -> set vincsal=vsal*1.2;
 -> update emp
 -> set sal=vincsal
 -> where empno=vempno;
 -> elseif vjob='ANALYST' then
 -> set acnt=acnt+1;
 -> set vincsal=vsal*1.25;
 -> update emp
 -> set sal=vincsal
 -> where empno=vempno;
 -> else
 -> set other=other+1;
 -> set vincsal=vsal*1.08;
 -> update emp
 -> set sal=vincsal
 -> where empno=vempno;
 -> end if;
 ->
 -> select vempno,vename,vjob,vsal,vincsal;
 -> end loop;
 ->
 -> close empcur;
 -> end//

3. Write a procedure that displays the following information of all emp 
Empno,Name,job,Salary,Status,deptno 
Note: - Status will be (Greater, Lesser or Equal) respective to average 
salary of their own department. Display an error message Emp table is 
empty if there is no matching record.

delimiter //
create procedure displaystatus()
begin
declare vfinished,vcnt int default 0;
declare vempno,vdeptno int;
declare vename,vjob,vstatus varchar(20);
declare vsal,vavgsal float(9,2);
declare empcur cursor for select empno,ename,job,sal,deptno from emp;
declare continue handler for NOT FOUND set vfinished=1;
#load the data from table to cursor
open empcur;
label1:loop
fetch empcur into vempno,vename,vjob,vsal,vdeptno;
if vfinished =1 then
 if vcnt=0 then
 select 'emp table is empty'
 end if 
 leave label1;
end if
set vcnt=vcnt+1;
select avg(sal) into vavgsal
from emp
where deptno=vdeptno;
if vsal<vavgsal then
 set vstatus='lesser';
elseif vsal=vavgsal then 
 set vstatus='equal';
else
 set vstatus='greater';
end if;
select vempno,vename,vjob,vsal,vdeptno,vavgsal,vstatus;
end loop;
close empcur;
end//
delimiter ;
