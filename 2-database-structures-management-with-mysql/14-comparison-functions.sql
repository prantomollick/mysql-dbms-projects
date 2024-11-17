-- Active: 1731438237227@@127.0.0.1@3306@mandg

--------------------------------------------------
-- Comparison functions in MySQL
--------------------------------------------------

-- 1 Identify common MySQL comparison functions
-- 2 Explain the benefits of MySQL comparison functions

-- Comparison functions
    -- Compare values within a database

-- Comparison functions
    -- GREATEST()
    -- LEAST()
    -- ISNULL()

CREATE TABLE sales_revenue (
    ItemID INT PRIMARY KEY,
    Q1 DECIMAL(10, 2),
    Q2 DECIMAL(10, 2),
    Q3 DECIMAL(10, 2),
    Q4 DECIMAL(10, 2)
);

INSERT INTO sales_revenue (ItemID, Q1, Q2, Q3, Q4) VALUES
(1, 125000.00, 60000.00, 100000.00, 138000.00),
(2, 30000.00, 20000.00, 23000.00, 35000.00),
(3, 28000.00, 15000.00, 17000.00, 29000.00),
(4, 100000.00, 70000.00, 84000.00, 110000.00),
(5, 56000.00, 35000.00, 50000.00, 52000.00),
(6, 90000.00, 64000.00, 85000.00, 95000.00);


SELECT * FROM sales_revenue;


SELECT ItemID, GREATEST(Q1, Q2, Q3, Q4) AS highest, LEAST(Q1, Q2, Q3, Q4) AS lowest FROM sales_revenue;

SELECT * FROM mg_orders WHERE ISNULL(`DeliveryDate`);

