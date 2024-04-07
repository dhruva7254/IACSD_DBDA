--PLSQL Assignment 1--

--Q 1--

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

----

