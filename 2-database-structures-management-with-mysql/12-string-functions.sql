-- Active: 1731438237227@@127.0.0.1@3306@mandg
--------------------------------------------------
-- String functions in MySQL
--------------------------------------------------

-- 1Q Identify common MySQL string functions
-- 2Q Explain the benefits of MySQL string functions


-- String functions
    -- String functions perform different operations on string values in a database


-- String functions
    -- CONCAT
    -- SUBSTR
    -- AUCASE
    -- LCASE

-- Drop Database
DROP DATABASE mAndG;

-- Create databases
CREATE DATABASE mAndG;

-- Use database `m`
USE mandg;



CREATE TABLE items (
    ItemID INT PRIMARY KEY,
    Name VARCHAR(50),
    Cost INT
);

INSERT INTO items (ItemID, Name, Cost) VALUES
(1, 'Engagement ring', 2500),
(2, 'Silver brooch', 400),
(3, 'Earrings', 350),
(4, 'Luxury watch', 1250),
(5, 'Golden bracelet', 800),
(6, 'Gemstone', 1500);

SELECT * FROM items;

CREATE TABLE mg_orders (
    OrderID INT PRIMARY KEY,
    ItemID INT,
    Quantity INT,
    Cost INT,
    OrderDate DATE,
    DeliveryDate DATE,
    OrderStatus VARCHAR(50)
);

INSERT INTO mg_orders (OrderID, ItemID, Quantity, Cost, OrderDate, DeliveryDate, OrderStatus) VALUES
(1, 1, 50, 122000, '2022-04-05', '2022-05-25', 'Delivered'),
(2, 2, 75, 28000, '2022-03-08', NULL, 'In progress'),
(3, 3, 80, 25000, '2022-05-19', '2022-06-08', 'Delivered'),
(4, 4, 45, 100000, '2022-01-10', NULL, 'In progress'),
(5, 5, 70, 56000, '2022-05-19', NULL, 'In progress'),
(6, 6, 60, 90000, '2022-06-10', '2022-06-18', 'Delivered');


SELECT * FROM mg_orders;

-- concat different two columns data in a table;
SELECT CONCAT(Name,'-',Quantity) FROM items, mg_orders WHERE items.`ItemID` = mg_orders.`ItemID`;

-- change the case of the all status valeus
SELECT UCASE(OrderStatus) from mg_orders;
SELECT LCASE(OrderStatus) from mg_orders;

-- clients tables;
CREATE TABLE clients (
    ClientID INT PRIMARY KEY,
    ClientName VARCHAR(100),
    Address VARCHAR(255),
    ContactNo VARCHAR(15)
);

INSERT INTO clients (ClientID, ClientName, Address, ContactNo) VALUES
(1, 'Kishan Hughes', '223 Golden Hills, North Austin, TX', '387986345'),
(2, 'Indira Moncada', '119 Silver Street, Bouldin Creek, TX', '334567243'),
(3, 'Mosha Setsile', '785 Bronze Lane, East Austin, TX', '315642597'),
(4, 'Laura Mills', '908 Diamond Crescent, South Lamar, TX', '300842509'),
(5, 'Henrik Kreida', '345 Golden Hills, North Austin, TX', '358208983'),
(6, 'Millicent Blou', '812 Diamond Crescent, North Burnet, TX', '347898755');

-- substr functions to extract string data from a table substr(str, start, length);
SELECT SUBSTR(ClientName, 1, 6) from clients WHERE clients.ClientID = 1;


