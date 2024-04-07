1.

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(255)
);

-- Adding a foreign key constraint
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

2.

INSERT INTO customers (customer_id, name, email, phone, address) VALUES
(1, 'John Doe', 'john@example.com', '123-456-7890', '123 Main St'),
(2, 'Jane Smith', 'jane@example.com', '987-654-3210', '456 Elm St'),
(3, 'Alice Johnson', 'alice@example.com', NULL, '789 Oak St');

3.

SELECT name
FROM employees
WHERE LENGTH(name) = 4;

4.

SELECT department, SUM(salary) AS total_salary_paid
FROM employees
GROUP BY department;

5.

SELECT e.*
FROM employees e
JOIN (
    SELECT department
    FROM employees
    GROUP BY department
    HAVING AVG(salary) > 75000
) dept_avg ON e.department = dept_avg.department;

6.

SELECT region_id
FROM cities
GROUP BY region_id
HAVING COUNT(*) = (
    SELECT MAX(city_count)
    FROM (
        SELECT COUNT(*) AS city_count
        FROM cities
        GROUP BY region_id
    ) AS max_city_count
);

7.

DELIMITER //

CREATE PROCEDURE GetEmployeeDetails (IN emp_id INT)
BEGIN
    SELECT e.name AS employee_name, d.name AS department_name, e.hire_date
    FROM employees e
    JOIN departments d ON e.department_id = d.department_id
    WHERE e.employee_id = emp_id;
END //

DELIMITER ;

CALL GetEmployeeDetails(123);

8.

DELIMITER //

CREATE FUNCTION CalculateYearsWithCompany (emp_id INT) RETURNS INT
BEGIN
    DECLARE hire_date DATE;
    DECLARE years_with_company INT;
    
    SELECT hire_date INTO hire_date
    FROM employees
    WHERE employee_id = emp_id;

    SET years_with_company = YEAR(CURRENT_DATE()) - YEAR(hire_date);
    
    RETURN years_with_company;
END //

DELIMITER ;

SELECT CalculateYearsWithCompany(123);

9.

DELIMITER //

CREATE TRIGGER UpdateSalaryHistory
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
    IF OLD.salary != NEW.salary THEN
        INSERT INTO Salary_history (employee_id, old_salary, new_salary, change_date)
        VALUES (OLD.employee_id, OLD.salary, NEW.salary, CURRENT_TIMESTAMP());
    END IF;
END //

DELIMITER ;

MongoDB
1.

db.restaurant.find({ "name": /^P/ })

2.

db.restaurant.find({ "cuisine": { $in: ["Bakery", "Chinese"] } })

3.

db.restaurant.find({ "grades.score": { $gte: 20 } })

------------------------------------------------------

P2
1.

SELECT first_name, last_name, salary, salary * 0.15 AS PF
FROM employees;

2.

SELECT c.name AS customer_name, s.name AS salesperson_name, o.onum, o.amt
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN salespeople s ON o.salesperson_id = s.salesperson_id;

3.

SELECT first_name, salary
FROM employees
WHERE salary > (SELECT salary FROM employees WHERE employee_id = 103);

4.

SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id;

5.

SELECT first_name, last_name
FROM employees
WHERE first_name LIKE 'P%' AND last_name LIKE '%Y';

6.

SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary = (
    SELECT DISTINCT salary
    FROM employees
    ORDER BY salary DESC
    LIMIT 1 OFFSET 2
);

7.

SELECT d.department_id, d.department_name, e.employee_id, CONCAT(e.first_name, ' ', e.last_name) AS employee_name
FROM departments d
JOIN employees e ON d.department_id = e.department_id;

8.

SELECT d.department_id, d.department_name
FROM departments d
WHERE d.location_id = (SELECT location_id FROM departments WHERE department_id = 90);

9.

SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 3 OFFSET 3;

10.

SELECT 
    d.department_name,
    CONCAT(e.first_name, ' ', e.last_name) AS manager_name,
    e.salary
FROM 
    departments d
JOIN 
    employees e ON d.manager_id = e.employee_id
WHERE 
    TIMESTAMPDIFF(YEAR, e.hire_date, CURDATE()) > 5;

--------

1.

DELIMITER //

CREATE PROCEDURE CheckEmployeeClass (IN emp_id INT)
BEGIN
    DECLARE emp_salary DECIMAL(10,2);

    SELECT salary INTO emp_salary
    FROM employees
    WHERE employee_id = emp_id;

    INSERT INTO status (salary, e_status)
    VALUES (emp_salary,
        CASE
            WHEN emp_salary < 5000 THEN 'lower class'
            WHEN emp_salary >= 5000 AND emp_salary < 15000 THEN 'middle class'
            WHEN emp_salary >= 15000 THEN 'higher class'
        END);
END //

DELIMITER ;

CALL CheckEmployeeClass(123);

2.

-- Create the accounts table
CREATE TABLE accounts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(50),
    balance DECIMAL(10, 2)
);

-- Create the transactions table
CREATE TABLE transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    accid INT,
    type VARCHAR(50),
    amount DECIMAL(10, 2),
    txtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the trigger
DELIMITER //

CREATE TRIGGER add_transaction AFTER INSERT ON accounts
FOR EACH ROW
BEGIN
    INSERT INTO transactions (accid, type, amount)
    VALUES (NEW.id, 'Deposit', NEW.balance);
END //

DELIMITER ;

----------------

1.

use company_database
db.employees.insertOne({ first_name: "John", last_name: "Doe", department: "HR", salary: 50000 })
db.employees.find()
db.dropDatabase()

2.

use my_database  // Replace 'my_database' with your database name

// Create the "books" collection and insert the documents
db.books.insertMany([
    {
        id: 1001,
        name: "Pointers in C",
        author: "Yashwant Kanetkar",
        subject: "C Programming",
        price: 123.456
    },
    {
        id: 1002,
        name: "Exploring C",
        author: "Yashwant Kanetkar",
        subject: "C Programming",
        price: 371.019
    },
    {
        id: 1003,
        name: "ANSI C Programming",
        author: "E Balaguruswami",
        subject: "C Programming",
        price: 334.215
    },
    {
        id: 1004,
        name: "ANSI C Programming",
        author: "Dennis Ritchie",
        subject: "C Programming",
        price: 140.121
    },
    {
        id: 2001,
        name: "C++ Complete Reference",
        author: "Herbert Schildt",
        subject: "C++ Programming",
        price: 417.764
    }
]);

3.

db.books.deleteOne({ name: "Exploring C" })
db.books.deleteMany({ name: "Exploring C" })

4.

db.books.find({ author: /r$/, price: { $lt: 200 } })

5.

db.books.aggregate([
    { $group: { _id: "$author", count: { $sum: 1 } } },
    { $sort: { _id: 1 } }
])


