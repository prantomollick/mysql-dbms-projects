-- Active: 1731438237227@@127.0.0.1@3306@employeedb

--------------------------------------------------
-- Subqueries in MySQL
--------------------------------------------------
--Subquery
--An inner query placed within an outer query
-- inner query clild query and outer query is parent query
-- inner query excutes first and sending result to the outer query (parent query)
-- inner query can be used in WHERE, FROM, HAVING, SELECT, JOIN clauses
-- inner query can be used to filter data, to get data from another table, to get data
-- from a view, to get data from a subquery, to get data from a derived table
-- inner query can be used to get data from a table that is not related to the outer query
-- inner query can be used to get data from a table that is related to the outer query

-- Subquery results
-- 1. Single value
-- 2. Single row
-- 3. Single column
-- 4. Multiple rows

DROP DATABASE EmployeeDB;

-- Create the database
CREATE DATABASE EmployeeDB;

USE EmployeeDB;


--1 Q Recognize a subquery and its syntax
--2 Q Identify when to use a subquery
--3 O Explain how subqueries are used in data retrieval
--Subquery | An inner query placed within an outer query
-- Subquery results
-- 1. Single value
-- 2. Single row
-- 3. Single column
-- 4. Multiple rows

-- Create the table 
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT, 
    EmployeeName VARCHAR(50), 
    Role VARCHAR(50), 
    AnnualSalary INT
);

-- Insert data into the table
INSERT INTO Employees (EmployeeID, EmployeeName, Role, AnnualSalary) VALUES
(1, 'Mario Gollini', 'Manager', 70000),
(2, 'Adrian Gollini', 'Assistant Manager', 65000),
(3, 'Giorgos Dioudis', 'Head Chef', 50000),
(4, 'Fatma Kaya', 'Assistant Chef', 45000),
(5, 'Elena Salvai', 'Head Waiter', 40000),
(6, 'John Millar', 'Receptionist', 35000)

SELECT * FROM employees;

--implementation sub query;
SELECT * FROM employees WHERE `AnnualSalary` > (SELECT `AnnualSalary` FROM employees WHERE `Role` = 'Assistant Chef');

-- Explain how subqueries interact with comparison operators
-- Demonstrate the use of subqueries
-- Demonstrate the use of subqueries with different comparison operators
    -- SQL comparison operators
        -- ANY operator
        -- ALL operator
        -- SOME operator



SELECT * FROM employees;

SELECT * FROM employees
WHERE `AnnualSalary` <= ALL (
    SELECT `AnnualSalary` FROM employees 
    WHERE `Role` 
    IN('Manager', 'Assistant Manager', 'Head Chef', 'Head Waiter')
);

SELECT * FROM employees
WHERE `AnnualSalary` <= ALL (
    SELECT `AnnualSalary` FROM employees 
    WHERE `Role` 
    IN('Manager', 'Assistant Manager', 'Head Chef', 'Head Waiter')
);

SELECT * FROM employees
WHERE `AnnualSalary` >= ANY (
    SELECT `AnnualSalary` FROM employees 
    WHERE `Role` 
    IN('Manager', 'Assistant Manager', 'Head Chef', 'Head Waiter')
);

SELECT * FROM employees
WHERE `AnnualSalary` >= SOME (
    SELECT `AnnualSalary` FROM employees 
    WHERE `Role` 
    IN('Manager', 'Assistant Manager', 'Head Chef', 'Head Waiter')
);


CREATE TABLE Bookings (
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    TableNo INT NOT NULL,
    GuestFirstName VARCHAR(50) NOT NULL,
    GuestLastName VARCHAR(50) NOT NULL,
    BookingSlot TIME NOT NULL,
    EmployeeID INT NOT NULL
);


INSERT INTO Bookings (TableNo, GuestFirstName, GuestLastName, BookingSlot, EmployeeID) VALUES
(12, 'Anna', 'Iversen', '19:00:00', 1),
(12, 'Joakim', 'Iversen', '19:00:00', 1),
(19, 'Vanessa', 'McCarthy', '15:00:00', 3),
(15, 'Marcos', 'Romero', '17:30:00', 4),
(5, 'Hiroki', 'Yamane', '18:30:00', 2),
(8, 'Diana', 'Pinto', '20:00:00', 5);


SELECT * FROM bookings;

SELECT * FROM employees WHERE EXISTS
(SELECT * FROM bookings WHERE bookings.`EmployeeID` = employees.`EmployeeID` AND
 `Role` IN("Head Chef", 'Head Waiter'));

SELECT * FROM employees WHERE NOT EXISTS
(SELECT * FROM bookings WHERE bookings.`EmployeeID` = employees.`EmployeeID` AND
 `Role` IN("Head Chef", 'Head Waiter'));


