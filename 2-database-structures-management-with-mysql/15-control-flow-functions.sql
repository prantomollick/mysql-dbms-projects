-- Active: 1731438237227@@127.0.0.1@3306@mandg

--------------------------------------------------
-- Control Flow Functions in MySQL
--------------------------------------------------

-- 1 Identify common MySQL control flow functions
-- 2 Explain the benefits of MySQL control flow functions

-- Control flow functions
    -- Evaluate conditions and determine the execution path of a query

-- CASE
    -- Runs through a set of conditions contained within a CASE block and returns a value when the first condition is met

SELECT * FROM sales_revenue;


SELECT `ItemID`,
CASE
    WHEN LEAST(Q1,Q2,Q3,Q4) <= 25000 THEN "Loss"
    ELSE "Profit"
END AS Profit_Loss
FROM sales_revenue;

-- The CASE function is used to evaluate conditions and return a value when the first condition is met.