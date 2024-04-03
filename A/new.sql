empno,ename,sum(sal+ifnull(comm,0)),avg(sal+ifnull(comm,0)) from emp where sal>2000 and deptno in (10,20);

SELECT CONCAT(SUBSTR(ename,3,5),right(job,2)) empcode,empno,ename FROM emp;

SELECT CONCAT('$',format(ifnull(comm,0),2)) FROM emp WHERE ename regexp '^A.*N$';

SELECT empno,ename,sal,comm CASE WHEN comm>=600 THEN "excellent keep it up" WHEN comm<600|comm is NOT NULL THEN "good" ELSE "Need Improvement" end Remarks;

SELECT empno,ename,deptno,CASE WHEN deptno=10 THEN "HR" WHEN deptno=20 THEN "Admin" WHEN deptno=30 THEN "Accounts" ELSE "Purchase" end 'Department Name' from emp;

CREATE TABLE mydept_DBDA(
	deptid int PRIMARY KEY,
	dname VARCHAR(20) NOT NULL UNIQUE,
	dloc VARCHAR(20) 
	);

INSERT INTO mydept_DBDA VALUES(
	30, 'Purchase', 'Mumbai');

CREATE TABLE myemployee(
	empno INTEGER PRIMARY KEY,
	fname VARCHAR(15) NOT NULL,
	mname VARCHAR(15),
	lname VARCHAR(15) NOT NULL,
	sal FLOAT(9,2) CHECK(sal>=1000),
	doj DATE,
	passportnum VARCHAR(15) UNIQUE,
	deptno INTEGER,
	CONSTRAINT fk_deptno FOREIGN KEY(deptno) REFERENCES mydept_DBDA(deptid)
	ON DELETE set NULL
	ON UPDATE CASCADE
	);
	
CREATE TABLE Student(
	sid INT PRIMARY KEY,
	sname VARCHAR(10)
	);

CREATE TABLE Course(
	cid INT PRIMARY KEY,
	cname VARCHAR(10)
	);

CREATE TABLE Marks(
	studid INT,
	courseid INT,
	marks INT,
	CONSTRAINT pk PRIMARY KEY(studid,courseid),
	CONSTRAINT fk_sid FOREIGN KEY(studid) REFERENCES Student(sid)
	ON DELETE CASCADE,
	CONSTRAINT fk_cid FOREIGN KEY(courseid) REFERENCES Course(cid)
	);

