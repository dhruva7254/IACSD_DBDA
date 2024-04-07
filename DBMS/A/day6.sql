car

/* write a PROCEDURE to display all the employees where sal < avg(sal) of its own department */
delimiter //
create PROCEDURE displayempbyavg()
BEGIN
	DECLARE vset,vempno,vdeptno int DEFAULT 0;
	DECLARE vename, vjob varchar(20);
	DECLARE vsal,vavgsal FLOAT(9,2);
	DECLARE empcur cursor for select empno,ename,job,sal,deptno from emp;
	DECLARE continue handler for not found set vset=1;
	open empcur;
	label1:loop
		fetch empcur into vempno,vename,vjob,vsal,vdeptno;
		if vset=1 THEN
			leave label1;
		end if;
		select avg(sal) into vavgsal
		from emp
		where deptno=vdeptno;
		if vsal<vavgsal then
			select vempno,vename,vjob,vsal,vdeptno;
		end if;
	end loop;
	close empcur;
end//
delimiter ;

call displayempbyavg();

DROP PROCEDURE displayempbyavg;

/* - */
/* write a function to calculate experience of an employee */
delimiter //
create function calculateexp(ehiredate date) returns int 
BEGIN	
		declare vexp int;
		set vexp=floor(datediff(curdate(),ehiredate)/365);
		return vexp;
end//
delimiter ;

set global log_bin_trust_function_creators=1;

select empno,ename,hiredate,calculateexp(hiredate) from emp;

/* write a function to generateemail email should be 3rd to 6th character from ename followed by 1st 3 characters of job, followed by @muycompany.com */
delimiter //
create function generateemail(enm varchar(20),ejob varchar(20)) returns varchar(50) 
BEGIN	
		declare vemail varchar(50);
		set vemail=concat(substr(enm,3,4),'.',left(ejob,3),'@muycompany.com');
		return vemail;
end//
delimiter ;

set global log_bin_trust_function_creators=1;

select empno,ename,job,generateemail(ename,job) from emp;

drop function generateemail;

/* - */
TRIGGERS

triggers sre used for data analysis purpose for security purpose.


create table dept_audit(
did int,
dname varchar(20),
old_dname varchar(20),
newloc varchar(20),
oldloc varchar(20),
username varchar(20),
change_date date);

delimiter //
create trigger insertdepttr before update 
on dept 
for each row
	insert into dept_audit values(old.deptno,NEW.dname,old.dname,new.loc,old.loc,user(),curdate());
//

delimiter ;

select * from dept_audit;
//

delimiter ;

drop trigger insertdepttr;

update dept 
set loc='car'

update dept
set dname='a'.loc='b'
where deptno=30;
//

alter table dept_audit
add auction varchar(20)
//

desc 
//

select * from dept_audit




