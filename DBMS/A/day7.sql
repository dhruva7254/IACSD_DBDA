car;
 D:\cassandra setup\apache-cassandra-3.11.4-bin\apache-cassandra-3.11.4\bin>cqlsh

WARNING: console codepage must be set to cp65001 to support utf-8 encoding on Windows platforms.
If you experience encoding problems, change your console codepage with 'chcp 65001' before starting cqlsh.

Connected to Test Cluster at 127.0.0.1:9042.
[cqlsh 5.0.1 | Cassandra 3.11.4 | CQL spec 3.4.4 | Native protocol v4]
Use HELP for help.
WARNING: pyreadline dependency missing.  Install to enable tab completion.
cqlsh> CREATE KEYSPACE iacsd0324 WITH replication={'class':'SimpleStrategy','replication_factor':'1'};
cqlsh> use iacsd0324;
cqlsh:iacsd0324> create table customer(cno int primary key,cname text,mobile text);
cqlsh:iacsd0324> select * from customer;

 cno | cname | mobile
-----+-------+--------

(0 rows)
cqlsh:iacsd0324> insert into customer(cno,cname,mobile) values(1,'rajesh','333');
cqlsh:iacsd0324> select * from customer;

 cno | cname  | mobile
-----+--------+--------
   1 | rajesh |    333

(1 rows)
cqlsh:iacsd0324>


cqlsh:iacsd0324> select * from customer where cno>1 allow filtering;

 cno | cname | mobile
-----+-------+--------
   2 | deepa |    111
   

cqlsh:iacsd0324> insert into customer(cno,cname,mobile) values(2,'deepa','111');
cqlsh:iacsd0324> select * from customer;

 cno | cname  | mobile
-----+--------+--------
   1 | rajesh |    333
   2 |  deepa |    111
   
   
cqlsh:iacsd0324> select * from customer where cno=1;

 cno | cname  | mobile
-----+--------+--------
   1 | rajesh |    333

(1 rows)


cqlsh:iacsd0324> create table employee(
             ... empid int,
             ... emp_firstname text,
             ... emp_lastname text,
             ... emp_sal decimal,
             ... emp_dob date,
             ... emp_deptno int,
             ... emp_comm float,
             ... primary key((empid,emp_sal),emp_firstname,emp_dob));
cqlsh:iacsd0324> insert into employee(
             ... empid,emp_sal,emp_firstname,emp_lastname,emp_dob,emp_deptno,emp_comm) values(12,1200,'Kishori','khadilkar','2000-11-11',10,345);
cqlsh:iacsd0324> select * from employee;

 empid | emp_sal | emp_firstname | emp_dob    | emp_comm | emp_deptno | emp_lastname
-------+---------+---------------+------------+----------+------------+--------------
    12 |    1200 |       Kishori | 2000-11-11 |      345 |         10 |    khadilkar

(1 rows)
cqlsh:iacsd0324>


cqlsh:iacsd0324> SELECT * FROM system_schema. keyspaces;

 keyspace_name      | durable_writes | replication
--------------------+----------------+-------------------------------------------------------------------------------------
        system_auth |           True | {'class': 'org.apache.cassandra.locator.SimpleStrategy', 'replication_factor': '1'}
      system_schema |           True |                             {'class': 'org.apache.cassandra.locator.LocalStrategy'}
           dbdaacts |           True | {'class': 'org.apache.cassandra.locator.SimpleStrategy', 'replication_factor': '1'}
                 hr |           True | {'class': 'org.apache.cassandra.locator.SimpleStrategy', 'replication_factor': '1'}
 system_distributed |           True | {'class': 'org.apache.cassandra.locator.SimpleStrategy', 'replication_factor': '3'}
             system |           True |                             {'class': 'org.apache.cassandra.locator.LocalStrategy'}
      system_traces |           True | {'class': 'org.apache.cassandra.locator.SimpleStrategy', 'replication_factor': '2'}
          iacsd0324 |           True | {'class': 'org.apache.cassandra.locator.SimpleStrategy', 'replication_factor': '1'}
             mydata |           True | {'class': 'org.apache.cassandra.locator.SimpleStrategy', 'replication_factor': '1'}

(9 rows)



SELECT empid FROM system_schema.employee WHERE keyspace_name='iacsd0324';
SELECT columnfamily_name FROM system_schema.columnfamilies WHERE keyspace_name
= 'iacsd0324';


 insert into employee(empid,emp_sal,emp_firstname,emp_lastname,emp_dob,emp_deptno,emp_comm) values(13,2000,'Arun','kumar','2014-09-23',12,678);

Select * from employee where empid=13 and emp_sal=2000 and emp_dob=’2014-09-23’ and emp_firstname=’Arun’;

Select * from employee where empid=13 and emp_sal=2000 and emp_firstname=’Arun’;

Select * from employee where empid=13 and emp_sal=2000 and emp_firstname=’Arun’ and emp_dob=’2014-09-23’;



