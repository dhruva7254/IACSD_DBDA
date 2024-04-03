car
CREATE INDEX marks_idx ON Student(marks DESC, name);

/* to find highly paid employee in each department */

SELECT * FROM
(SELECT empno,ename,sal,deptno,ROW_NUMBER()OVER
(PARTITION BY deptno ORDER BY sal DESC) AS rn,
DENSE_RANK() OVER (PARTITION BY deptno ORDER BY sal DESC) drn 
FROM emp) e
WHERE e.drn=1;

delimiter//
create procedure in

delimiter//
CREATE
