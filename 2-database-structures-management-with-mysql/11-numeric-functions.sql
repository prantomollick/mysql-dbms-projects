-- Active: 1731438237227@@127.0.0.1@3306@gardenstore

--------------------------------------------------
-- Numeric in MySQL
--------------------------------------------------
-- 1	Q Identify and describe common MySQL numeric functions
-- 2	Q Explain the benefits of MySQL numeric functions

-- MySQL functions
    -- A code that performs an operation and returns a result, often with the use of parameters.


-- MySQL functions
    -- Numeric functions
    -- String functions
    -- Date functions
    -- Comparison functions
    -- Control flow functions

-- There are two types of numeric functions in MySQL: aggregate and non-aggregate functions.
    -- Aggregate -- Perform tasks on a set of values
    -- Math -- Perform basic mathmatical tasks on data

-- Aggregate functions
    -- SUM
    -- AVG
    -- MAX
    -- MIN
    -- COUNT


-- Math functions
-- ABS

-- Create databases
DROP DATABASE mAndG;
CREATE DATABASE mAndG;

-- Use database `m`
USE mandg;

-- Create table `clients_order`
CREATE TABLE clients_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    client_name VARCHAR(255) NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL
);

-- Insert data into `clients_order`
INSERT INTO clients_order (client_name, order_date, total_amount) VALUES
('Alice Smith', '2023-01-10', 150.50),
('Bob Johnson', '2023-02-15', 200.00),
('Charlie Brown', '2023-03-20', 300.75),
('Alice Smith', '2023-01-10', 150.50),
('Bob Johnson', '2023-02-15', 200.00),
('Charlie Brown', '2023-03-20', 300.75),
('Diana Prince', '2023-04-25', 400.00),
('Ethan Hunt', '2023-05-30', 350.25),
('Fiona Glenanne', '2023-06-05', 275.50),
('George Bailey', '2023-07-15', 500.75),
('Hannah Montana', '2023-08-20', 125.00),
('Ivy League', '2023-09-10', 600.90),
('Jack Reacher', '2023-10-12', 450.80),
('Karen Page', '2023-11-18', 700.50);


SELECT  client_name, order_id, AVG(total_amount) 
FROM clients_order GROUP BY order_id;

SELECT  client_name, ROUND(AVG(total_amount), 2)  FROM clients_order GROUP BY client_name;


CREATE TABLE mg_orders (
    OrderID INT,
    ItemID INT,
    Quantity INT,
    Cost INT,
    OrderDate DATE,
    DeliveryDate DATE,
    OrderStatus VARCHAR(20)
);


INSERT INTO mg_orders (OrderID, ItemID, Quantity, Cost, OrderDate, DeliveryDate, OrderStatus) VALUES
(1, 1, 50, 122000, '2022-04-05', '2022-05-25', 'Delivered'),
(2, 2, 75, 28000, '2022-03-08', NULL, 'In progress'),
(3, 3, 80, 25000, '2022-05-19', '2022-06-08', 'Delivered'),
(4, 4, 45, 100000, '2022-01-10', NULL, 'In progress'),
(5, 5, 70, 56000, '2022-05-19', NULL, 'In progress'),
(6, 6, 60, 90000, '2022-06-10', '2022-06-18', 'Delivered');


SELECT OrderID, ItemID, MOD(Quantity, 2) FROM mg_orders;

