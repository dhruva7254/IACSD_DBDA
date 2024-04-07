car
/* Q1 */
CREATE TABLE vehicle(
    Vid INT PRIMARY KEY,
    Vname VARCHAR(15),
    Price INT,
    Description VARCHAR(25)
);

CREATE TABLE customer(
    Custid INT PRIMARY KEY,
    Cname VARCHAR(15),
    address VARCHAR(25)
);

CREATE TABLE salesman(
    Sid INT PRIMARY KEY,
    Sname VARCHAR(15),
    address VARCHAR(25)
);

CREATE TABLE cust_vehicle(
	Custid INT,
	Vid INT,
	Sid INT,
	Buy_price INT,
	CONSTRAINT pk PRIMARY KEY(Custid,Vid),
	CONSTRAINT fk_c FOREIGN KEY(Custid) REFERENCES customer(Custid) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_v FOREIGN KEY(Vid) REFERENCES vehicle(Vid) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_s FOREIGN KEY(Sid) REFERENCES salesman(Sid) ON DELETE SET NULL ON UPDATE CASCADE
	);

INSERT INTO vehicle VALUES (1, 'Activa', 80000, 'scooter');
INSERT INTO vehicle VALUES (2, 'Santro', 800000, 'car');
INSERT INTO vehicle VALUES (3, 'Motor bike', 100000, 'bike');

INSERT INTO customer VALUES (1, 'Nilima', 'Pimpiri');
INSERT INTO customer VALUES (2, 'Ganesh', 'Pune');
INSERT INTO customer VALUES (3, 'Pankaj', 'Mumbai');

INSERT INTO salesman VALUES (10, 'Rajesh', 'Mumbai');
INSERT INTO salesman VALUES (11, 'Seema', 'Pune');
INSERT INTO salesman VALUES (13, 'Rakhi', 'Pune');

INSERT INTO cust_vehicle VALUES (1, 1, 10, 75000);
INSERT INTO cust_vehicle VALUES (1, 2, 10, 790000);
INSERT INTO cust_vehicle VALUES (2, 3, 11, 80000);
INSERT INTO cust_vehicle VALUES (3, 3, 11, 75000);
INSERT INTO cust_vehicle VALUES (3, 2, 10, 800000);

/* Q2 */
ALTER TABLE vehicle ADD INDEX (Price);

CREATE INDEX idx_vehicle_price ON vehicle (Price);

/* Q3 */
SELECT c.Custid, c.Cname, v.Vname, s.Sname, (cv.Buy_price - v.Price) AS DiscountEarned
FROM customer c
INNER JOIN cust_vehicle cv ON c.Custid = cv.Custid
INNER JOIN vehicle v ON cv.Vid = v.Vid
INNER JOIN salesman s ON cv.Sid = s.Sid;

/* Q4 */
SELECT c.Cname, v.Vname, s.Sname, s.address
FROM customer c
INNER JOIN cust_vehicle cv ON c.Custid = cv.Custid
INNER JOIN vehicle v ON cv.Vid = v.Vid
RIGHT JOIN salesman s ON cv.Sid = s.Sid
WHERE s.address = 'Pune';

/* Q5 */
SELECT COUNT(c.Custid)  
FROM customer c
INNER JOIN cust_vehicle cv ON c.Custid = cv.Custid
INNER JOIN vehicle v ON cv.Vid = v.Vid
WHERE v.Vname='Motor bike';

/* Q6 */
CREATE VIEW find_discount AS  
SELECT c.Cname, v.Vname, Price, Buy_price, Price-Buy_price 'discount'
FROM customer c 
INNER JOIN cust_vehicle cv ON c.Custid=cv.Custid 
INNER JOIN vehicle v ON v.Vid=cv.Vid;

SELECT * FROM find_discount;

/* Q7 */ 
SELECT c.Cname, v.Vname, Price, s.Sname, Price-Buy_price 'discount earned'
FROM customer c 
INNER JOIN cust_vehicle cv ON c.Custid=cv.Custid 
INNER JOIN vehicle v ON v.Vid=cv.Vid
INNER JOIN salesman s ON cv.Sid = s.Sid;

/* Q8 */
CREATE VIEW my_hr AS  
SELECT empno, ename, job, comm
FROM emp
WHERE comm IS NOT NULL;

SELECT * FROM my_hr;

/* Q9 */
CREATE VIEW mgr30 AS  
SELECT *
FROM emp
WHERE deptno=30;

SELECT * FROM mgr30;

/* Q10 */
INSERT INTO mgr30 VALUES (329, 'Nilima', 'CLERK', 211, '2006-05-06', 12345, 1, 30);
INSERT INTO mgr30 VALUES (345, 'Ganesh', 'SALESMAN', 235, '2008-07-12', 19876, 3, 30);
INSERT INTO mgr30 VALUES (367, 'Pankaj', 'MANAGER', 242, '2010-09-24', 12847, 5, 30);

/* Q11 */
INSERT INTO dept VALUES (50, 'FINANCE', 'TEXAS');
INSERT INTO dept VALUES (60, 'MARKETING', 'CALIFORNIA');
INSERT INTO dept VALUES (70, 'PRODUCTION', 'FLORIDA');

/* Q12 */
ROLLBACK;

/* Q13 */
SET autocommit=0;
SELECT * FROM emp;
INSERT INTO EMP VALUES (100,'Benjamin','CLERK',7902,'2010-09-24',800,NULL,20);
INSERT INTO EMP VALUES (101,'Michael','SALESMAN',7698,'1980-02-22',1600,NULL,10);
INSERT INTO EMP VALUES (102,'Oliver','MANAGER',7839,'1981-02-02',1250,NULL,30);
SAVEPOINT A;
INSERT INTO EMP VALUES (103,'William','ANALYST',7566,'1981-04-28',2850,NULL,20);
INSERT INTO EMP VALUES (104,'Daniel','CLERK',7788,'1980-09-01',2450,NULL,10);
INSERT INTO EMP VALUES (105,'Henry','SALESMAN',7782,'1981-05-09',3000,NULL,30);
SAVEPOINT B;
DELETE FROM EMP WHERE empno=100;
DELETE FROM EMP WHERE empno=104;
ROLLBACK TO B;
SELECT * FROM emp;
ROLLBACK TO A;
SELECT * FROM emp;
COMMIT;
SELECT * FROM emp;
ROLLBACK;
SET autocommit=1;

/* Q14 */
delimiter //
CREATE PROCEDURE getMin(IN edn INT, OUT minsal DECIMAL(10,2))
BEGIN
    SELECT MIN(sal) INTO minsal
    FROM emp
    WHERE deptno=edn;
END//
delimiter ;
CALL getMin(10, @ms);
SELECT @ms AS 'Minimum Salary';