-- Active: 1731438237227@@127.0.0.1@3306@shop_db
-- Createe Database
DROP DATABASE shop_db;

CREATE DATABASE shop_db;

USE shop_db;


CREATE TABLE customer_purchases(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255),
    Location VARCHAR(255),
    Purchases INT
)

INSERT INTO customer_purchases (`CustomerID`, `CustomerName`, `Location`, `Purchases`) VALUES
(1, 'Takashi Ito', 'Graham County', 1500),
(2, 'Jane Murphy', 'Pinal County', 1750),
(3, 'Laurina Delgado', 'Santa Cruz County', 1000),
(4, 'Benjamin Clauss', 'Gila County', 2500),
(5, 'Altay Ayhan', 'Cochise County', 2000),
(6, 'Greta Galkina', 'Mohave County', 500),
(7, 'Julie Marr', 'Gila County', 2250);

SELECT * FROM customer_purchases;


-- Filter Command
SELECT * FROM customer_purchases WHERE `Purchases` > 2000 AND `Location` = 'gila county';


SELECT * FROM customer_purchases WHERE `Location` = 'gila county' OR `Location` = 'Santa cruz county';


SELECT * FROM customer_purchases WHERE NOT(`Location` = 'gila county' OR `Location` = 'santa cruz county');

SELECT * FROM customer_purchases WHERE `Location` IN('gila county', 'santa cruz county');

SELECT * FROM customer_purchases WHERE `Purchases` BETWEEN 1000 AND 2000;

SELECT * FROM customer_purchases WHERE `Location` LIKE 'g__%';
