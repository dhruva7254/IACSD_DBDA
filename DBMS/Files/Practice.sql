

6:52 PM | 12.9KB/s
Vo
WiFi
O172%
←
Avinash Patil DBDA I...
20 minutes ago
PG-DBDA (March 2024 Batch) Date: 01/04/2024
Time: 02:00 PM to 4:00 PM SET-1A02
Note: Submit a .sql file with its name as your PRN number_name
(eg: 01_Rahul_Sinha.sql)

MySQL(25 Marks)

1. Create a customers tables and having 4 constraints in the table(3 Marks)
2. Insert minimum three records in the table(2 Marks)
Now use HR database to do rest of the query:
3. Write an Query to find name of employee whose name contains only 4 characters (2 Marks) 
4.  Display total salary paid to employees work in each department(2 Marks)
5. Write a query that returns all employees who work in departments with an average salary greater than 75,000 per year. (3 Marks)
6. Write a query to fetch the region id which contains the most number of cities. (3 Marks)
·
Attempt any 2 from below questions:
7. Write a stored procedure that takes an employee ID as an input parameter and returns the employees name, department name, and hire date..(5 Marks)
OR
8. Write a stored function that takes an employee ID as an input parameter and returns the number of years the employee has been with the company.(5 Marks)
OR
9. Write a trigger to be used to automatically update Salary_history table when any employees salary is updated?(5 Marks)

MongoDB-Use Restaurant.json (15 Marks: 3 each)

1. To retrieve all documents in the restaurant collection where the name field starts with the letter P.
2. To retrieve all documents in the restaurant collection where the cuisine field is equal to Bakery or Chinese.
3. To retrieve all documents in the restaurant collection where the grades.score field is greater than or equal to 20.

----------------------------------------------------------------------------------------------------------------------------
-------
---------------------------------------------------------------------------------------------
Paper Code: A
1 of 3
SUNBEAM INSTITUTE OF INFORMATION 
TECHNOLOGY 
KARAD 
 Module End Lab Exam (DBT)
Course Name: PG – DAC Batch : Mar 2024
Module Name: Database Technologies Date: 18 / 03/ 2024
Max. Marks: 40 Duration : 2:00 Hours
Instructions :
1. Create new workspace (folder) by the name DBT_12 digit PRN in your home directory.
2. Create new text document with name DBT_12 digit PRN_Solution and save it in above 
folder.
3. Copy queries and output in text document.
4. After evaluation, first compress/zip your folder (named DBT_12 digit PRN) and upload it 
on EMIS.
Sr. 
No. Points to cover Max
Marks
Marks by
Evaluator
1. MySQL Queries 20
2. MySQL Program (Stored Procedure) 7
3. MySQL Program (Triggers) 8
4. MongoDB 5
Total: 40 ______________________
______________________ ________________________
Signature of Student Signature of Evaluator
Paper Code: A
2 of 3

Section I: (Use HR, SALES db) (20 marks)
1. Write a query to get the names (first_name, last_name), salary & PF (PF of all the 
 employees is calculated as 15% of salary).
2. Display customer name, salespeople name, onum and amt
3. Display the first name and salary for all employees who earn more than employee 
 number 103 (Employees table).
4. Write a query to get department wise average salaries of employees.
5. List of first and last names of employees where first names start with 'P' and last name 
 ends with 'Y'.
6. Find the employee who has the third highest salary.
7. Display department id, department name, employee id and employee name (first name 
 and last name should be in one column of output). (using joins)
8. Display the department number and department name for all departments whose 
 location number is equal to the location number of department number 90 
 (Departments table).
9. Write such query that will return only three rows from fourth row of employees table 
 and sort by salary in descending order.
10. Write a query to get department name, managers full name (first and last name) and 
 salary of the manager whose experience is more than 5 years. (Output of your query 
 should have 3 columns 1. department_name, 2. manager_name(with first and last 
 name), 3. Salary)

Section II: MySQL Program (15 marks)
1. Write a procedure using case-when to check class of given employee id. (07 marks)
(Use employees table)
Store the result in status table having columns (salary, e_status)
If salary < 5000, lower class.
If salary >= 5000 and salary < 15000, middle class.
If salary >= 15000, higher class.
2. Create two tables named, accounts (id PK & Auto Increment, type, balance) and (08 marks)
transactions (id PK & Auto Increment, accid, type, amount, txtime)
Table 1 accounts (parent table) Table 2 transactions (child table) 
id Type Balance
1 Savings 5000
2 Current 10000
Write trigger with any name to perform following operations:
 Whenever new record is added in parent table, a record should be added in child 
table i.e. transactions (as shown in table-2).
id accid type amount txtime
1 1 Deposit 5000 2024-02-10 21:30:10
2 2 Deposit 10000 2024-03-15 22:35:15
Paper Code: A
3 of 3

Section III: MongoDB (05 marks)
1. Create and use a database 
2. Create a collection called “books” as per following structure & insert 5 documents
id name author subject price
1001 Pointers in C Yashwant Kanetkar C Programming 123.456
1002 Exploring C Yashwant Kanetkar C Programming 371.019
1003 ANSI C Programming E Balaguruswami C Programming 334.215
1004 ANSI C Programming Dennis Ritchie C Programming 140.121
2001 C++ Complete Reference Herbert Schildt C++ Programming 417.764
3. Delete the document-holding name as "Exploring C"
4. Find all books whose author name ends with ‘r’ and price is less than 200.
5. Find no. of books of each author & sort output by name.
------------------------------------------------------------------------------------------
----------------------
----------------------------------------------------------------------------

