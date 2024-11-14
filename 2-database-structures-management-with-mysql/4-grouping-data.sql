-- Active: 1731438237227@@127.0.0.1@3306@garden_orders

--------------------------------------------------
--Group BY Tables
--------------------------------------------------


DROP DATABASE garden_orders;

-- Create the database
CREATE DATABASE garden_orders;

USE garden_orders;

CREATE TABLE orders (
    OrderID INT PRIMARY KEY,
    Department VARCHAR(255),
    OrderDate DATE,
    OrderQty INT,
    OrderTotal DECIMAL(10, 2) 
);

INSERT INTO orders (OrderID, Department, OrderDate, OrderQty, OrderTotal) VALUES
(1, 'Lawn Care', '2022-05-05', 12, 500.00),
(2, 'Decking', '2022-05-22', 150, 1450.00),
(3, 'Compost and Stones', '2022-05-27', 20, 780.00),
(4, 'Trees and Shrubs', '2022-06-01', 15, 400.00),
(5, 'Garden Decor', '2022-06-10', 2, 1250.00),
(6, 'Lawn Care', '2022-06-10', 12, 500.00),
(7, 'Decking', '2022-06-25', 150, 1450.00),
(8, 'Compost and Stones', '2022-05-29', 20, 780.00),
(9, 'Trees and Shrubs', '2022-06-10', 15, 400.00),
(10, 'Garden Decor', '2022-06-10', 2, 1250.00),
(11, 'Lawn Care', '2022-06-25', 10, 400.00),
(12, 'Decking', '2022-06-25', 100, 1400.00),
(13, 'Compost and Stones', '2022-05-30', 15, 700.00),
(14, 'Trees and Shrubs', '2022-06-15', 10, 300.00),
(15, 'Garden Decor', '2022-06-11', 2, 1250.00),
(16, 'Lawn Care', '2022-06-10', 12, 500.00),
(17, 'Decking', '2022-06-25', 150, 1450.00),
(18, 'Trees and Shrubs', '2022-06-10', 15, 400.00);


SELECT * FROM orders;

SELECT `Department` FROM orders GROUP BY `Department`;

--COUNT DEPARTMENT
SELECT `Department`, COUNT(`Department`) FROM orders GROUP BY `Department`;

-- SUM OF ORDER TOTAL BY DEPARTMENT
SELECT `Department`, SUM(`OrderTotal`) FROM orders GROUP BY `Department`;

--
SELECT `Department`, MIN(`OrderQty`) FROM orders GROUP BY `Department`;

SELECT `Department`, AVG(`OrderTotal`) FROM orders GROUP BY `Department`;

SELECT `Department`, SUM(`OrderTotal`) from orders GROUP BY `Department` HAVING SUM(`OrderTotal`) > 2275;





