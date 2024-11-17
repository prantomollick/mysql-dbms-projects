-- Active: 1731438237227@@127.0.0.1@3306@gardensupplydb

--------------------------------------------------
-- Stored Procedures in MySQL
--------------------------------------------------

-- 1 Understand stored procedures in MySQL
-- 2 Create and drop stored procedures in MySQL

-- Stored procedures
-- Reusable block of code invoked on command

-- Benefits of stored procedures
    --Consistency
    --Reusability
    --Efficiency

DROP DATABASE GardenSupplyDB;

CREATE DATABASE GardenSupplyDB;

USE GardenSupplyDB;


CREATE TABLE Products (
    ProductID VARCHAR(2) PRIMARY KEY,
    Item VARCHAR(50),
    Price DECIMAL(5, 2)
);


INSERT INTO Products (ProductID, Item, Price) VALUES
('P1', 'Artificial grass bags', 50.00),
('P2', 'Wood panels', 20.00),
('P3', 'Patio slates', 40.00),
('P4', 'Sycamore trees', 10.00),
('P5', 'Trees and Shrubs', 50.00),
('P6', 'Water fountain', 80.00);

-- create procedure
CREATE PROCEDURE GetProductDetails() SELECT * FROM products;

-- call procedure
CALL GetProductDetails();

CREATE PROCEDURE GetLowestPriceProducts(LowestPrice INT) SELECT * from products WHERE Price <= LowestPrice;

CALL GetLowestPriceProducts(50);

-- drop procedure
DROP PROCEDURE GetLowestPriceProducts;

