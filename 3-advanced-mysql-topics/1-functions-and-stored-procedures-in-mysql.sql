-- Active: 1731438237227@@127.0.0.1@3306@ordersdb
--------------------------------------------------
-- functions-and-stored-procedures-in-mysql
--------------------------------------------------

-- Lucky Shrub and user-defined functions

DROP DATABASE OrdersDB;
CREATE DATABASE OrdersDB;

USE OrdersDB;

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    ClientID VARCHAR(10),
    ProductID VARCHAR(10),
    Quantity INT,
    Cost DECIMAL(10, 2),
    Date DATE
);

INSERT INTO Orders (OrderID, ClientID, ProductID, Quantity, Cost, Date) VALUES
(1, 'C11', 'P1', 10, 500.00, '2020-09-01'),
(2, 'C12', 'P2', 5, 100.00, '2020-09-05'),
(3, 'C13', 'P3', 20, 800.00, '2020-09-03'),
(4, 'C14', 'P4', 15, 150.00, '2020-09-07'),
(5, 'C13', 'P3', 10, 450.00, '2020-09-08'),
(6, 'C12', 'P2', 22, 1200.00, '2020-09-09'),
(7, 'C13', 'P1', 15, 150.00, '2020-09-10'),
(8, 'C11', 'P1', 10, 500.00, '2020-09-12'),
(9, 'C12', 'P2', 5, 100.00, '2020-09-13');

-- If you found error to excute this code on VS code, try it into the MySQL Workbench or any other MySQL client.
DELIMITER $$

CREATE FUNCTION GetTotalCost(Cost DECIMAL(5, 2)) RETURNS DECIMAL(5, 2) DETERMINISTIC
BEGIN
    IF (Cost >= 100 AND Cost < 500) THEN
        SET Cost = Cost - (Cost * 0.1);
    ELSEIF (Cost >= 500) THEN
        SET Cost = Cost - (Cost * 0.2);
    END IF;
    RETURN Cost;
END$$

DELIMITER ;

SELECT GetTotalCost(500);

DROP FUNCTION `GetTotalCost`;


CREATE TABLE Products (
    ProductID VARCHAR(2) PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(5, 2),
    NumberOfItems INT
);

INSERT INTO Products (ProductID, ProductName, Price, NumberOfItems) VALUES
('P1', 'Artificial grass bags', 50.00, 100),
('P2', 'Wood panels', 20.00, 250),
('P3', 'Patio slates', 40.00, 60),
('P4', 'Sycamore trees', 10.00, 50),
('P5', 'Trees and Shrubs', 50.00, 75),
('P6', 'Water fountain', 80.00, 15);

SELECT * FROM products;

DELIMITER $$

CREATE PROCEDURE GetProductSummary(
    OUT NumberOfLowPriceProducts INT,
    OUT NumberOfHighPriceProducts INT
)
BEGIN
    SELECT COUNT(ProductID) INTO NumberOfLowPriceProducts
    FROM Products
    WHERE Price < 50;

    SELECT COUNT(ProductID) INTO NumberOfHighPriceProducts
    FROM Products
    WHERE Price >= 50;
END$$

DELIMITER ;

CALL GetProductSummary(@TotalNumberOfLowPriceProducts, @TotalNumberOfHeighPriceProducts);

SELECT @TotalNumberOfLowPriceProducts, @TotalNumberOfHeighPriceProducts;