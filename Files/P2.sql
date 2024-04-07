create table cust(
    cid int,
    cname varchar(20),
    cemail varchar(20),
    cmobile int
);

desc cust;

insert into cust (cid,cname,cemail,cmobile) values 
(123,'qaz','qaz@q',159),
(456,'wsx','wsx@q',357),
(789,'edc','edc@q',428);

insert into cust (cid,cname,cemail,cmobile) values
(234,'bgtsddf','sdhfg@q',624);

select cname from cust where length(cname)=4;

insert into cust (cid,cname,cemail,cmobile) values
(249,'cdfr','sdfhgv@q',3594);

select * from cust;

select cname from cust where length(cname)=4;

select deptno,sum(sal) 'total salary' from emp group by deptno;

select ename,avg(sal) from emp group by deptno having avg(sal)<2000;

select e.* from emp e inner join (select deptno from emp group by deptno having avg(sal)>2000) qsd on e.deptno=qsd.deptno;

select deptno,count(*) from emp group by deptno 


Write a query to fetch the dept number which contains the most number of employees


select deptno,count(empno) from emp group by deptno sort by count(empno) desc limit(1);

mysql> select deptno,count(empno) from emp group by deptno order by count(empno) desc limit 1;

delimiter //
create procedure displayempdet(in vempno int)
begin
    declare vempno int;
    declare vename,vdeptname varchar(20);
    declare vhiredate date;
    select e.empno,e.ename,d.dname,e.hiredate from emp e inner join 

delimiter //


delimiter //
create procedure dispallemp(in vempno int)
begin 
    declare vempno int

    