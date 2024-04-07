/*Q 1*/
/*Syntax 1*/
SELECT e.empno,e.ename,e.deptno,d.deptno,d.dname,sal
from emp e inner join dept d on
e.deptno=d.deptno and sal<2000;

/*Syntax 2*/
SELECT e.empno,e.ename,e.deptno,d.deptno,d.dname,sal
from emp e,dept d
where e.deptno=d.deptno and sal<2000;

/*Q 2*/
/*write a query to display empno nam,e sal grade lowsal and high sal*/

/*Syntax 1*/
SELECT e.empno,e.ename,e.sal,g.grade,g.losal,g.hisal
from emp e,salgrade g
where e.sal between g.losal and g.hisal;

/*Syntax 2*/
SELECT e.empno,e.ename,e.sal,g.grade,g.losal,g.hisal
from emp e inner join salgrade g on
e.sal between g.losal and g.hisal;

/*Q 3*/
/*Syntax 1*/
SELECT e.empno,e.ename,e.deptno,d.deptno,d.dname
from emp e inner join dept d on
e.deptno=d.deptno WHERE e.deptno in (10,20);

/*Syntax 2*/
SELECT e.empno,e.ename,e.deptno,d.deptno,d.dname
from emp e,dept d
WHERE e.deptno=d.deptno AND e.deptno in (10,20);

/*Q 4*/
/*display all courses cname description cid and fname assigned to the courses*/
SELECT c.cname,c.description,c.cid,f.fname

WHERE c.fid=f.fid

/*Q 5*/
/*display cid cname description and rname assigned to that course*/
cid,cncme,c.rid,
WHERE c.rid = r.rid

/*Q 6*/
/*list courses with room name and faculty name*/
/*Syntax 1*/
SELECT cid,cname,fname,rname
from course c,room r,faculty f
where c.rid=r.rid and c.fid=f.fid;

/*Syntax 2*/
SELECT cid,cname,c.rid,r.rid,rname,fname
from course c inner join room r on c.rid=r.rid inner join faculty f on c.fid=f.fid;

SELECT empno,ename,e.deptno,d.deptno,dname
from emp e right join dept d on e.deptno=d.deptno; /*need extra data from dept table */

SELECT empno,ename,e.deptno,d.deptno,dname
from dept d left join emp e on e.deptno=d.deptno;

/* matching and non matchig -> outer join */

SELECT e.empno,e.ename,e.deptno,d.deptno,d.dname
from emp e left join dept d on e.deptno=d.deptno;
UNION
SELECT e.empno,e.ename,e.deptno,d.deptno,d.dname
from emp e right join dept d on e.deptno=d.deptno;

/* we cannot write directly full outer join in mysql so we use union */

SELECT c.cname,r.rname
FROM course c right join room r on c.rid=r.rid;

/* ... */
SELECT c.cname,f.fname 
FROM course c right join faculty f on c.fid=f.fid;
UNION
SELECT c.cname,f.fname 
FROM course c left join faculty f on c.fid=f.fid;

/* to display all employees who are not assigned to any department and all departments in which no employees are asssigned */
SELECT e.empno,e.ename,e.deptno,d.deptno,dname
from emp e left join dept d on e.deptno=d.deptno
WHERE d.dname is NULL
UNION
SELECT e.empno,e.ename,e.deptno,d.deptno,dname
from emp e right join dept d on e.deptno=d.deptno
WHERE e.ename is NULL;

/* to display movieid, title rating, and domestic, sales of all movies */

SELECT m.mid,m.title,b.rating,b.domestic_sales
FROM movie m inner join boxoffice b on m.mid=b.movieid; 

/* display movieid, title, rating, and domestic_sales of all the movies in which rating>4 and domestic_sales>international_sale */
SELECT m.mid,m.title,b.rating,b.domestic_sales
FROM movie m, boxoffice b 
WHERE m.mid=b.movieid and b.rating>4 and b.domestic_sales>b.international_sale 

/* display all movies for which no rating is assigned */
SELECT * FROM movie WHERE ra
SELECT m.title,m.mid,b.movieid
from movie m inner join boxoffice b on
m.mid=b.movieid and b.rating is NULL;

select * from movie m where not exists ( select * from boxoffice b where b.movieid=m.mid and rating is not null)

movie(mid,title,director,year,length_min,releasedate)
boxoffice(movieid,rating,domestic_sales,international_sales)

/* display all movie names with rating <average rating and director name starts with J */

select * from movie where director like 'J%' and mid in (select movieid from boxoffice where rating < (select avg(rating) from boxoffice))

/*display all movies which are released in jan*/

SELECT * from movies WHERE month(releasedate)=1;

/* Views in MySQL */

CREATE VIEW mgr10
AS
SELECT * FROM emp WHERE deptno=10;

SELECT * FROM mgr10;

CREATE VIEW vendor
AS
SELECT ename,deptno FROM emp 
WHERE deptno=20;
SELECT * FROM vendor;

drop view mgr10;

/* view with restrictions */
CREATE VIEW mgr10
AS
SELECT * FROM emp 
WHERE deptno=10;
with check OPTION;

SELECT * FROM mgr10;

/* to stop DML operations on view, use with read only, but works only in oracle; */

use information_schema

desc views;

select table_name,view_definition

select * from emp s
where 3=(select count(*)
from (select distinct sal from emp) e
where e.sal>s.sal)
order by sal desc;

// show CREATE TABLE table_name;

