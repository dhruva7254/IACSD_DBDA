car
--to write functions in mysql, we need to set a global variable 
set GLOBAL log_bin_trust_function_creators=1; 
--write a function to calculate experience of employee 
create function calctc(empno date) returns (ctc int) 
 -> begin 
 -> declare vexp int; 
 -> set vexp=floor(datediff(curdate(),ehiredate)/365); 
 -> return vexp; 
 -> end// 
--to call the function 
select empno,ename,hiredate,calculateexp(hiredate) 
 -> from emp; 
--
--write a function to generateemail 
email should be 3 rd to 6 th character from ename, followed by . and 1 st 3 characters of  job, followed by @muycompany.com 
delimiter // 
create function generateemail(enm varchar(20),ejob varchar(20)) returns varchar(50) begin
 declare vemail varchar(50); 
 set vemail=concat(substr(enm,3,4),'.',left(ejob,3),'@mycompany.com');  return vemail; 
end// 
delimiter ; 
-----
create function generateemail(enm varchar(20),ejob varchar(20)) returns varchar(50)
    -> begin
    ->    declare vemail varchar(50);
    ->    set vemail=concat(substr(enm,3,4),'.',left(ejob,3),'@mycompany.com');
    ->    return vemail;
    -> end//
-----
delimiter // 
create function calctc(empnum int) returns int
	begin
		declare s1 int;
		declare hir date;
		select sal,hiredate into s1,hir from emp where empno=empnum;
		declare DA int;
		declare HRA int;
		declare TA int;
		declare SA int;
		declare Eexp int;
		declare CTC int;
		set DA=(1.15*s1);
		set HRA=(1.20*s1);
		set TA=(1.08*s1);
		set Eexp=floor(datediff(curdate(),hir)/365);
		if Eexp<1 THEN
			set SA=0;
		elseif Eexp>=1 and Eexp<2 then
			set SA=(1.10*s1);
		elseif Eexp>=2 and Eexp<4 then
			set SA=(1.10*s1);
		ELSE
			set SA=(1.30*s1);
		end if;
		set CTC=s1+DA+HRA+TA+SA;
		return CTC;
	end//
delimiter ; 
-----

delimiter // 
create function calctc(en int) returns int
	begin
		declare s1 int;
		select sal into s1 from emp where empno=en;
		return s1;
	end//
delimiter ; 
---
		declare hir date;
		select sal,hiredate into s1,hir from emp where empno=empnum;
		declare DA int;
		declare HRA int;
		declare TA int;
		declare SA int;
		declare Eexp int;
		declare CTC int;
		set DA=(1.15*s1);
		set HRA=(1.20*s1);
		set TA=(1.08*s1);
		set Eexp=floor(datediff(curdate(),hir)/365);
		if Eexp<1 THEN
			set SA=0;
		elseif Eexp>=1 and Eexp<2 then
			set SA=(1.10*s1);
		elseif Eexp>=2 and Eexp<4 then
			set SA=(1.10*s1);
		ELSE
			set SA=(1.30*s1);
		end if;
		set CTC=s1+DA+HRA+TA+SA;
		return CTC;
	end//
delimiter ; 
----
----
---
delimiter // 
create function calctc(en int) returns int
	begin
		declare s1 int;
		declare hir date;
		select sal,hiredate into s1,hir from emp where empno=en;
		return s1;
	end//
delimiter ; 
---
---
---
drop function calctc;
----
 select calctc(7369);
 ---


--------------------------------------------------
if condition then
 statements;
elseif condition then 
 statements
else 
 statements
end if;
--

--to write functions in mysql, we need to set a global variable
set GLOBAL log_bin_trust_function_creators=1;
--write a function to calculate experience of employee
create function calculateexp(ehiredate date) returns int
 -> begin
 -> declare vexp int;
 -> set vexp=floor(datediff(curdate(),ehiredate)/365);
 -> return vexp;
 -> end//
--to call the function
select empno,ename,hiredate,calculateexp(hiredate)
 -> from emp;
--

--
 write a procedure to find netsal of the given employee and find the remark, if 
netsal <1000 “less”
--if >=1000 and <2000 then ‘ok’
--if netsal >=2000 and < 3000 then ‘good’
otherwise better
display remark inside the procedure
netsal= sal+comm

delimiter //
create procedure findNetsal(eid int,out remark varchar(50))
begin
 declare vsal,vcomm,vnetsal float(9,2);
 select sal,comm into vsal,vcomm
 from emp
 where empno=eid;
 
 set vnetsal=vsal+ifnull(vcomm,0);
 
 if vnetsal<1000 then
 set remark ='less';
 
 elseif vnetsal<2000 then
 set remark='ok';
 
 elseif vnetsal<3000 then
 set remark='good';
 
 else 
 set remark='better';
 
 
 end if;
select eid,vsal,vcomm,vnetsal,remark;
end//
delimiter 
--

---

 
set GLOBAL log_bin_trust_function_creators=1;

delimiter // 
create function finddctc(en int) returns int
begin
	declare vsal,vctc,vs,vexp int;
	declare vhir date;
	select sal,hiredate into vsal,vhir from emp where empno=en;
	set vs=(vsal*1.15)+(vsal*1.20)+(vsal*1.08);
	set vexp=floor(datediff(curdate(),vhir)/365);
	if vexp<1 then
		set vctc=vs;
	elseif vexp<2 then
		set vctc=vs+(vsal*0.10);
	elseif vexp<4 then
		set vctc=vs+(vsal*0.20);
	else 
		set vctc=vs+(vsal*0.30);
	end if;
	return vctc;
end//
delimiter ; 

select finddctc(empno) from emp;























--------------------
delimiter // 
create function findcctc(en int) returns int
begin
	declare vsal,vctc int;
	declare vhir date;
	select sal,hiredate into vsal,vhir from emp where empno=en;
	return vhir;
end//
delimiter ; 

select findcctc(empno) from emp;
----------------



--to insert record into dept table
delimiter //
create procedure insertdept(in did int,dnm varchar(20),dloc varchar(20))
begin
 insert into dept values(did,dnm,dloc);
end//
delimiter ;

call insertdept(10,’admin’,’pune’)











----

----
