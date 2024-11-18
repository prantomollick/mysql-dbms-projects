-- Active: 1731438237227@@127.0.0.1@3306@ordersdb
--------------------------------------------------
-- Further Optimization Techniques
--------------------------------------------------

DROP TABLE products;
CREATE TABLE Products (
    ProductID VARCHAR(10),
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2),
    NumberOfItems INT
);


INSERT INTO Products (ProductID, ProductName, Price, NumberOfItems) VALUES
('P1', 'Artificial grass bags', 50.00, 100),
('P2', 'Wood panels', 20.00, 250),
('P3', 'Patio slates', 40.00, 60),
('P4', 'Sycamore trees', 10.00, 50),
('P5', 'Trees and Shrubs', 50.00, 75),
('P6', 'Water fountain', 80.00, 15);


START TRANSACTION;

SELECT * FROM orders;
INSERT INTO orders (`OrderID`, `ClientID`, `ProductID`, `Quantity`, `Cost`, `Date`) VALUES
(31, "C11", "P1", 10, 500, "2022-09-30");

SELECT * FROM orders;

UPDATE products SET NumberOfItems = (`NumberOfItems` - 10) WHERE `ProductID` = "P1";

SELECT * FROM products;

-- Inner join operation
SELECT orders.`OrderID`, orders.`ClientID`, orders.`Quantity`, products.`ProductID`, products.`NumberOfItems` FROM
orders INNER JOIN products ON (orders.`ProductID` = products.`ProductID`) WHERE orders.`OrderID` = 31;

ROLLBACK;

SELECT * FROM orders;

-- Now write start transection again followed by the same command
START TRANSACTION;

INSERT INTO orders(`OrderID`, `ClientID`, `ProductID`, `Quantity`, `Cost`, `Date`) VALUES
(31, "C11", "P1", 10, 500, "2022-09-30");

UPDATE products SET `NumberOfItems` = (`NumberOfItems` - 10) WHERE `ProductID` = "P1";

SELECT * FROM products;

COMMIT;

SELECT orders.`OrderID`, orders.`ClientID`, orders.`Quantity`, products.`ProductID`, products.`NumberOfItems` FROM
orders INNER JOIN products ON (orders.`ProductID` = products.`ProductID`) WHERE orders.`OrderID` = 31;


-- Common Table Expression in MySQL
-- Common table expression
-- Optimizing complex database queries by compiling them as simple blocks of code

SELECT CONCAT(AVG(Cost), " (2020)") AS "Average Sale" FROM orders WHERE YEAR(Date) = 2020
UNION 
SELECT CONCAT(AVG(`Cost`), " (2021)") FROM orders WHERE YEAR(Date) = 2021
UNION
SELECT CONCAT(AVG(Cost), " (2022)") FROM orders WHERE YEAR(Date) = 2022;


-- More optimal
WITH
Average_Sales_2020 AS (SELECT CONCAT(AVG(Cost), " (2020)") AS "Average Sale" FROM orders
WHERE YEAR(Date) = 2020), 
`Average_Sales_2021` AS (SELECT CONCAT(AVG(Cost), " (2021)") FROM orders
WHERE YEAR(Date) = 2021),
`Average_Sales_2022` AS (SELECT CONCAT(AVG(Cost), " (2022)") FROM orders
WHERE YEAR(Date) = 2022)
SELECT * FROM `Average_Sales_2020`
UNION
SELECT * FROM `Average_Sales_2021`
UNION
SELECT * FROM `Average_Sales_2022`;
