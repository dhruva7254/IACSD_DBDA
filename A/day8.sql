car

ALTER TABLE customer ADD email VARCHAR;

SELECT * FROM customer;

ALTER TABLE customer DROP email;

ALTER TABLE customer ADD brands SET<TEXT>;

UPDATE customer SET brands={'bata','reliance','puma'} WHERE cno=1;

CREATE TABLE student(
sid INT PRIMARY KEY,
sname TEXT,
hobbies LIST<TEXT>,
courses SET<TEXT>);

CREATE TABLE test1( 
id INT PRIMARY KEY, 
name VARCHAR,
data1 LIST<frozen<tuple<INT,TEXT>>>,
data2 MAP<TEXT,frozen<LIST<TEXT>>>); 

SELECT * FROM student;

UPDATE student SET hobbies=hobbies+['trekking'] WHERE sid=1;

UPDATE student SET hobbies=['trekking']+hobbies WHERE sid=1;

UPDATE student SET hobbies=hobbies-['trekking'] WHERE sid=1;

UPDATE student SET hobbies[1]='trekking' WHERE sid=1;

UPDATE customer SET brands=brands+{'a','b'} WHERE cno=1;

UPDATE customer SET brands=brands-{'a','b'} WHERE cno=1;

UPDATE customer SET brands={} WHERE cno=1;

UPDATE customer SET brands={'puma','bata'} WHERE cno=1;

UPDATE student SET marks=marks +{'java':98} WHERE sid=1;

ALTER TABLE student ADD marks MAP<TEXT,INT>;

UPDATE student SET marks={} WHERE sid=1;

UPDATE student SET marks=marks -{'java','python'} WHERE sid=1;

UPDATE student SET marks['perl']=100 WHERE sid=1;

CREATE TABLE customer1(
sid INT PRIMARY KEY,
sname VARCHAR,
saddr list<FROZEN<address>>);

CREATE TYPE address(
street TEXT,
zipcode TEXT,
city TEXT);

UPDATE student SET degree=('Mtech','PU',89) WHERE sid=1;

ALTER TABLE student ADD degree TUPLE<TEXT,TEXT,INT>;

CREATE TABLE suppiler(
sid INT PRIMARY KEY,
sname VARCHAR,
saddr address);

INSERT INTO suppiler(sid,sname,saddr) VALUES(11,'abcd',{street:'baner',zipcode:'11111',city:'Pune'});

ALTER TYPE address ADD bldgnm TEXT;

ALTER TYPE address RENAME bldgnm TO bname;

BEGIN batch
INSERT INTO customer(cno,cname,brands,mobile,billamt) VALUES(111,'xx',{'a','b'},'2222','44444')
INSERT INTO customer(cno,cname,brands,mobile,billamt) VALUES(112,'yy',{'x','y'},'2222','66666')
DELETE mobile FROM customer WHERE cno=1
apply batch;

end

ALTER TABLE customer ADD billamt SET<INT>;

CREATE INDEX idxname ON customer(billamt);

insert into customer JSON '{"cno":12,"cname":"dfsd","brands":["a","b"],"mobile":"34567","billamt":4567}';

----------------------------------------
/* Assignment Cassandra */

--Q1

DROP TABLE employee;

CREATE TABLE employee(
Empid INT,
Emp_salary INT,
Emp_lastname VARCHAR,
Emp_firstname TEXT,
Emp_dob DATE,
Emp_deptno INT,
Emp_comm FLOAT,
PRIMARY KEY((Empid,Emp_salary),Emp_firstname,emp_dob));

INSERT INTO employee(Empid,Emp_salary,Emp_lastname,Emp_firstname,Emp_dob,Emp_deptno,Emp_comm) VALUES(1001,12345,'qwert','yuiop','2018-03-09',23,45.6);
INSERT INTO employee(Empid,Emp_salary,Emp_lastname,Emp_firstname,Emp_dob,Emp_deptno,Emp_comm) VALUES(1002,45627,'drake','jhon','2014-04-20',34,32.7);

SELECT * FROM employee;

--Q1

SELECT * FROM employee WHERE empid IN (1001,1002);

--Q2

SELECT * FROM employee WHERE empid=1001 AND emp_dob=’1999-11-11’ AND emp_salary=5000 AND emp_firstname='Rajan';
 
UPDATE employee SET Emp_salary=5000 WHERE Empid=1001;

------------------------------

/* Mango DB */







------------------------------------------1--------------------------
Microsoft Windows [Version 10.0.19045.4170]
(c) Microsoft Corporation. All rights reserved.

C:\Users\dbda>mongod --dbpath E:\data6
{"t":{"$date":"2024-04-02T21:37:29.812+05:30"},"s":"I",  "c":"NETWORK",  "id":4915701, "ctx":"-","msg":"Initialized wire specification","attr":{"spec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":17},"incomingInternalClient":{"minWireVersi
----------------------------------------------













------------------------------2--------------------------
Microsoft Windows [Version 10.0.19045.4170]
(c) Microsoft Corporation. All rights reserved.

C:\Users\dbda>mongosh
Current Mongosh Log ID: 660c2d7dae9580ff869f9909
Connecting to:          mongodb://127.0.0.1:27017/?directConnection=true&serverSelectionTimeoutMS=2000&appName=mongosh+2.2.2
Using MongoDB:          6.0.14
Using Mongosh:          2.2.2

For mongosh info see: https://docs.mongodb.com/mongodb-shell/


To help improve our products, anonymous usage data is collected and sent to MongoDB periodically (https://www.mongodb.com/legal/privacy-policy).
You can opt-out by running the disableTelemetry() command.

------
   The server generated these startup warnings when booting
   2024-04-02T21:32:42.631+05:30: Access control is not enabled for the database. Read and write access to data and configuration is unrestricted
------

test>
---------------------------------------




-------------------------------------------------------3-------------------------------------
Microsoft Windows [Version 10.0.19045.4170]
(c) Microsoft Corporation. All rights reserved.

C:\Users\dbda>mongoimport --db iacsd0324 --movie --file D:\Dhruva\Files\movie.json
2024-04-02T21:42:08.450+0530    error parsing command line options: unknown option "movie"
2024-04-02T21:42:08.452+0530    try 'mongoimport --help' for more information

C:\Users\dbda>mongoimport --db iacsd0324 --collection movie --file D:\Dhruva\Files\movie.json
2024-04-02T21:47:35.252+0530    connected to: mongodb://localhost/
2024-04-02T21:47:35.394+0530    18 document(s) imported successfully. 0 document(s) failed to import.

C:\Users\dbda>mongoimport --db iacsd0324 --collection movie --file D:\Dhruva\Files\samplerestaurent.json
2024-04-02T21:48:53.440+0530    connected to: mongodb://localhost/
2024-04-02T21:48:55.066+0530    25359 document(s) imported successfully. 0 document(s) failed to import.

C:\Users\dbda>mongoimport --db iacsd0324 --collection restaurent --file D:\Dhruva\Files\samplerestaurent.json
2024-04-02T21:50:48.785+0530    connected to: mongodb://localhost/
2024-04-02T21:50:50.446+0530    25359 document(s) imported successfully. 0 document(s) failed to import.

C:\Users\dbda>
-----------------------------------------

----------------------

test> use iacsd0324
switched to db iacsd0324
iacsd0324> show collections
movie
restaurent
iacsd0324> db.movie.find()
[
  {
    _id: ObjectId('5aaa3334639395f86922a881'),
    name: 'sholay',
    actor: [
      'Dharamendra',
      'Amitabh',
      'Sachin Pilgaokar',
      'Dharamendra',
      'Dharamendra',
      'Mr. Khote',
      'jaya bacchan',
      'sanjiv kapoor'
    ],
    rating: 6,
--------------------------------
