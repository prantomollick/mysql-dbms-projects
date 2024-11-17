-- Active: 1731438237227@@127.0.0.1@3306@mandg
--------------------------------------------------
-- Date functions in MySQL
--------------------------------------------------

-- 1-Identify common MySQL date functions
-- 2-Explain the benefits of MySQL date functions

-- Date functions
-- Extract outputs that contain information on time and date values

-- find the current date and time
USE mandg;

SELECT NOW();
-- find the current date
SELECT CURDATE();
-- find the current time
SELECT CURTIME();

SELECT CURRENT_DATE;
SELECT CURRENT_TIME;
SELECT CURRENT_TIMESTAMP;

SELECT DATE_FORMAT(OrderDate, "%M") FROM mg_orders;
SELECT DATE_FORMAT(OrderDate, "%D %M %Y") FROM mg_orders;

SELECT DATEDIFF(DeliveryDate, OrderDate) FROM mg_orders WHERE `DeliveryDate` IS NOT NULL;
