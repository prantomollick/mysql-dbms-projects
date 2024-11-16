-- Active: 1731438237227@@127.0.0.1@3306@gardenstore

--------------------------------------------------
-- Virtual Tables in MySQL
--------------------------------------------------

-- 1Q Explain what views are
-- 2Q Create, rename and drop views in MySQL database

--Views
-- Virtual tables used for accessing and manipulating data with MySQL
-- why database engineers use views
----------------------------------------------------
-- Create a Subset
-- Focus on a subset of a table’s data

-- Suppose a table might have 7 columns you only need data from 3 columns, you can create subset for this 3 columns
-- views can only use to combine for multiple tables 

-- Creating a virtual table
-- 1.	Create the virtual table
-- 2.	Select the table’s columns
-- 3.	Specify a table to extract data from
-- 4.	Set the conditions
-- 5.	Set data order and filtering rule

-- Q: Pranto need to identiy their top 3 best-selling products with the use of a virtual table or view 
-- to make sure they have enough quantity in stock for the next few months

-- Step 1: Create a new database
DROP DATABASE GardenStore;

CREATE DATABASE GardenStore;

-- Step 2: Use the new database
USE GardenStore;

-- Step 3: Create the Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    ClientID VARCHAR(10),
    ProductID VARCHAR(10),
    Quantity INT,
    Cost DECIMAL(10, 2)
);

-- Step 4: Create the Products table
CREATE TABLE Products (
    ProductID VARCHAR(10) PRIMARY KEY,
    Item VARCHAR(50),
    Price DECIMAL(10, 2)
);

-- Step 5: Insert data into the Orders table
INSERT INTO Orders (OrderID, ClientID, ProductID, Quantity, Cost) VALUES
(1, 'C11', 'P1', 10, 500.00),
(2, 'C12', 'P2', 5, 100.00),
(3, 'C14', 'P3', 20, 800.00),
(4, 'C16', 'P4', 15, 150.00);

-- Step 6: Insert data into the Products table
INSERT INTO Products (ProductID, Item, Price) VALUES
('P1', 'Artificial grass bags', 50.00),
('P2', 'Wood panels', 20.00),
('P3', 'Patio slates', 40.00),
('P4', 'Sycamore trees', 10.00),
('P5', 'Trees and Shrubs', 50.00),
('P6', 'Water fountain', 80.00);



CREATE View Top3Products AS SELECT products.`Item`, orders.`Quantity`, orders.`Cost`
FROM orders INNER JOIN products ON orders.`ProductID` = products.`ProductID`
ORDER BY orders.`Cost` DESC LIMIT 3;

SELECT * FROM top3products;

--rename the vierutal table use mysql rename commands
RENAME TABLE Top3Products TO TopProducts;


-- use can use drop command to drop the view
DROP VIEW TopProducts;

-- the view has been removed so there are no impact on original tablee