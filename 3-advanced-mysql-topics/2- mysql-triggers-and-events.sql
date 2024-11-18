-- Active: 1731438237227@@127.0.0.1@3306@ordersdb
--------------------------------------------------
--  MySQL Triggers and events 
--------------------------------------------------

-- Trigger
-- A set of actions available in the form of a stored program invoked when an event occurs

-- CREATE MySQL TRIGGER
    -- MySQL syntax statement used to create a trigger
    -- CREATE TRIGGER

-- Row-level
    -- Trigger invoked for each row
-- Statement-level
    -- Trigger invoked for each statement
DROP TABLE orders;
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
(6, 'C11', 'P2', 5, 800.00, '2020-09-09'),
(7, 'C11', 'P4', 22, 1200.00, '2020-09-10'),
(8, 'C13', 'P1', 15, 150.00, '2020-09-10'),
(9, 'C11', 'P1', 10, 500.00, '2020-09-12'),
(10, 'C12', 'P2', 5, 100.00, '2020-09-13'),
(11, 'C14', 'P5', 5, 100.00, '2020-09-15'),
(12, 'C13', 'P1', 10, 500.00, '2022-09-01'),
(13, 'C12', 'P2', 5, 100.00, '2022-09-05'),
(14, 'C13', 'P3', 20, 800.00, '2022-09-07'),
(15, 'C14', 'P4', 15, 150.00, '2022-09-08'),
(16, 'C11', 'P3', 10, 450.00, '2022-09-09'),
(17, 'C12', 'P2', 5, 800.00, '2022-09-10'),
(18, 'C13', 'P4', 22, 1200.00, '2022-09-10'),
(19, 'C13', 'P1', 15, 150.00, '2022-09-10'),
(20, 'C11', 'P1', 10, 500.00, '2022-09-12'),
(21, 'C12', 'P2', 5, 100.00, '2022-09-13'),
(22, 'C12', 'P1', 10, 500.00, '2021-09-01'),
(23, 'C12', 'P2', 5, 100.00, '2021-09-05'),
(24, 'C13', 'P3', 20, 800.00, '2021-09-03'),
(25, 'C14', 'P4', 15, 150.00, '2021-09-07'),
(26, 'C11', 'P3', 10, 450.00, '2021-09-08'),
(27, 'C12', 'P1', 20, 1000.00, '2021-09-01'),
(28, 'C12', 'P2', 10, 200.00, '2021-09-05'),
(29, 'C13', 'P3', 20, 800.00, '2021-09-03'),
(30, 'C11', 'P1', 10, 500.00, '2022-09-01');

SELECT * FROM orders;

DELIMITER $$
CREATE Trigger OrderQtyCheck
BEFORE INSERT ON orders
FOR EACH ROW
BEGIN
    IF NEW.Quantity < 0 THEN
        SET NEW.Quantity = 0;
    END IF;
END $$

DELIMITER ;


DROP TRIGGER
IF EXISTS orders.OrderQtyCheck;


-- Scheduled events
    -- A task that takes place at a specific time according to a schedule.
-- Names
    -- All events have unique names
-- Statements
    -- Each event contains one or more SQL statements
-- Occurrence
    -- Events can occur once or multiple times

-- One-time events
    -- Scheduled events that occur just once

-- Recurring events
    -- Scheduled events that occur on a regular basis

-- MySQL CREATE EVENT statement
    -- Scheduled events are created using CREATE EVENT keywords
    -- CREATE EVENT

DELIMITER $$

CREATE EVENT GenerateRevenueReport
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 12 HOUR
DO
BEGIN
    INSERT INTO ReportData (OrderID, ClientID, ProductID, Quantity, Cost, Date)
    SELECT OrderID, ClientID, ProductID, Quantity, Cost, Date
    FROM orders
    WHERE `Date` BETWEEN '2022-08-01' AND '2022-08-31';
END $$

DELIMITER ;



DELIMITER $$

CREATE EVENT DailyRestock
ON SCHEDULE EVERY 1 DAY
DO
BEGIN
    IF EXISTS (SELECT 1 FROM products WHERE `NumberOfItems` < 50) THEN
        UPDATE products SET `NumberOfItems` = 50 WHERE `NumberOfItems` < 50;
    END IF;
END $$

DELIMITER ;


-- Drop events
DROP EVENT IF EXISTS DailyRestock;

