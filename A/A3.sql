car

/* Q55 */

-- Create the faculty table
CREATE TABLE faculty (
    fid INT PRIMARY KEY,
    fname VARCHAR(255),
    skill1 VARCHAR(255),
    skill2 VARCHAR(255)
);

-- Create the courses table
CREATE TABLE courses (
    cid INT PRIMARY KEY,
    cname VARCHAR(255),
    rid INT,
    fid INT,
	CONSTRAINT fk_m FOREIGN KEY (fid) REFERENCES faculty(fid)
);

-- Create the room table
CREATE TABLE room (
    roomid INT PRIMARY KEY,
    rname VARCHAR(255),
    rloc VARCHAR(255)
);

-- Insert data into the faculty table
INSERT INTO faculty (fid, fname, skill1, skill2)
VALUES
    (10, 'kjzhcjhz', 'a', 'b'),
    (11, 'sdd', 'x', 'z'),
    (12, 'lksjk', 'a', 'x'),
    (13, 'ksdjlkj', 'a', 'b');

-- Insert data into the courses table
INSERT INTO courses (cid, cname, rid, fid)
VALUES
    (121, 'DBDA', 100, 10),
    (131, 'DAC', 101, NULL),
    (141, 'DTISS', NULL, NULL),
    (151, 'DIOT', 105, 12);

-- Insert data into the room table
INSERT INTO room (roomid, rname, rloc)
VALUES
    (100, 'Jasmin', '1st floor'),
    (101, 'Rose', '2nd floor'),
    (105, 'Lotus', '1st floor'),
    (103, 'Mogra', '1st floor');

SELECT *
FROM courses
WHERE rid IS NULL;

SELECT *
FROM faculty
WHERE fid NOT IN (SELECT DISTINCT fid FROM courses);


SELECT DISTINCT r.*
FROM room r
JOIN courses c ON r.roomid = c.rid
UNION
SELECT r.*
FROM room r
LEFT JOIN courses c ON r.roomid = c.rid
WHERE c.cid IS NULL;

SELECT *
FROM room
WHERE roomid NOT IN (SELECT rid FROM courses WHERE rid IS NOT NULL);


SELECT c.*, f.fname
FROM courses c
JOIN faculty f ON c.fid = f.fid
WHERE f.skill1 = 'database' OR f.skill2 = 'database';


SELECT c.cid, c.cname, f.fname AS faculty_name, r.rname AS room_name, r.rloc AS room_location
FROM courses c
LEFT JOIN faculty f ON c.fid = f.fid
LEFT JOIN room r ON c.rid = r.roomid;



/* Q56 */

-- Create the prod table
CREATE TABLE prod (
    prodid INT,
    pname VARCHAR(255),
    qty INT,
    price DECIMAL(10, 2),
    catid INT,
    sid INT,
    PRIMARY KEY (prodid),
    FOREIGN KEY (catid) REFERENCES category(cid),
    FOREIGN KEY (sid) REFERENCES saleman(sid)
);

-- Create the saleman table
CREATE TABLE saleman (
    sid INT PRIMARY KEY,
    sname VARCHAR(255),
    city VARCHAR(255)
);

-- Create the category table
CREATE TABLE category (
    cid INT PRIMARY KEY,
    cname VARCHAR(255),
    description VARCHAR(255)
);


-- Insert data into the prod table
INSERT INTO prod (prodid, pname, qty, price, catid, sid)
VALUES
    (123, 'lays', 30, 30.00, 1, 12),
    (111, 'pepsi', 40, 50.00, 4, 11),
    (134, 'nachos', 50, 50.00, 1, 12),
    (125, 'dairy milk', 40, 60.00, 2, 14),
    (124, 'pringles', 40, 60.00, 1, 14);

-- Insert data into the saleman table
INSERT INTO saleman (sid, sname, city)
VALUES
    (11, 'Rahul', 'Pune'),
    (12, 'Kirti', 'Mumbai'),
    (13, 'Prasad', 'Nashik'),
    (14, 'Arnav', 'Amaravati');

-- Insert data into the category table
INSERT INTO category (cid, cname, description)
VALUES
    (1, 'chips', 'very crunchy'),
    (2, 'chocolate', 'very chocolaty'),
    (3, 'snacks', 'yummy'),
    (4, 'cold drinks', 'thanda thanda cool cool');

SELECT *
FROM prod
WHERE catid = (SELECT cid FROM category WHERE cname = 'chips');


SELECT p.*
FROM prod p
JOIN saleman s ON p.sid = s.sid
WHERE s.sname = 'Kirti';


SELECT *
FROM saleman
WHERE sid NOT IN (SELECT DISTINCT sid FROM prod);


SELECT *
FROM category
WHERE cid NOT IN (SELECT DISTINCT catid FROM prod);


SELECT *
FROM prod
WHERE catid IS NULL;


SELECT *
FROM saleman
WHERE city LIKE 'P%' OR city LIKE 'N%';


ALTER TABLE saleman
ADD COLUMN credit_limit DECIMAL(10, 2);






