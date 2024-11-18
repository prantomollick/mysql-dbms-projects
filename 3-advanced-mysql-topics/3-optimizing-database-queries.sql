-- Active: 1731438237227@@127.0.0.1@3306@ordersdb


--------------------------------------------------
--  Optimizing Database queries 
--------------------------------------------------

USE ordersdb;

SELECT * FROM orders;

--This below query create extra pressure on databse
SELECT * FROM orders WHERE DATE_ADD(Date, INTERVAL 30 DAY) = '2022-09-12';
--This query is not efficient because it is using function on date field which is not indexed.

-- custom column expected delivery date.
ALTER TABLE orders ADD COLUMN ExpectedDeliveryDate DATE;

SELECT * FROM orders;

CREATE TABLE Clients (
    ClientID VARCHAR(10),
    FullName VARCHAR(100),
    ContactNumber VARCHAR(15),
    AddressID INT
);


INSERT INTO Clients (ClientID, FullName, ContactNumber, AddressID) VALUES
('C11', 'Takashi Ito', '351786345', 1),
('C12', 'John Doe', '1234567890', 2),
('C13', 'Jane Smith', '9876543210', 3),
('C14', 'Alice Johnson', '5551234567', 4),
('C15', 'Bob Brown', '4449876543', 5),
('C16', 'Charlie Davis', '3335551234', 6),
('C17', 'David Wilson', '2224499876', 7),
('C18', 'Eve Clark', '1111333555', 8),
('C19', 'Frank Miller', '9992244444', 9),
('C20', 'Grace Lee', '8888111333', 10),
('C21', 'Hank Green', '7779992222', 11),
('C22', 'Ivy Hall', '6668881111', 12),
('C23', 'Jack King', '5557779999', 13),
('C24', 'Karen Wright', '4444666888', 14),
('C25', 'Leo Scott', '3335557777', 15),
('C26', 'Mia Adams', '2224446666', 16),
('C27', 'Nina Baker', '1113335555', 17),
('C28', 'Oscar Carter', '9992244444', 18),
('C29', 'Paul Evans', '8888111333', 19),
('C30', 'Quinn Foster', '7779992222', 20);

-- MYSQL cann't use index when leading with wild card
SELECT * from clients WHERE FullName LIKE '%Ito';

ALTER TABLE clients ADD COLUMN ReverseFullName VARCHAR(200);

SELECT * FROM clients;

--create index on reverse of string
UPDATE clients SET ReverseFullName = CONCAT(SUBSTRING_INDEX(`FullName`, ' ', -1), ' ', SUBSTRING_INDEX(`FullName`, ' ', 1));

SELECT * FROM clients;

CREATE INDEX IdxReverseFullName ON Clients (ReverseFullName);

SELECT * FROM clients WHERE `ReverseFullName` LIKE 'Ito%';


-- This is not optimized
SELECT P.ProductID, P.ProductName, O.OrderID, O.ClientID, O.Cost FROM products AS P LEFT OUTER JOIN
orders AS O ON P.ProductID = O.ProductID;


-- This is optimized
SELECT P.ProductID, P.ProductName, O.OrderID, O.ClientID, O.Cost FROM products AS P INNER JOIN
orders AS O ON P.`ProductID` = O.`ProductID`;

-- create indexing contact number
SELECT * FROM clients;

--no optimized solutions, I have to Scan 20 rows to find the contact number
EXPLAIN SELECT ContactNumber FROM Clients WHERE `FullName` = 'Jane Delgado';

-- to speed up the search process using secondary index
CREATE INDEX IdxFullName ON Clients(FullName);

SELECT * FROM clients;

-- to check effeciency of the query, to excute it again, I got it in 1 search
EXPLAIN SELECT ContactNumber FROM Clients WHERE `FullName` = 'Jane Delgado';

