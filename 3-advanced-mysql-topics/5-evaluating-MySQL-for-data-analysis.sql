-- Active: 1731438237227@@127.0.0.1@3306@ordersdb
--------------------------------------------------
-- Evaluating MySQL for Data Analysis 
--------------------------------------------------
--subquery
SELECT ProductID FROM products WHERE `ProductID` = ANY(SELECT `ProductID` FROM orders WHERE `Quantity` >= 10);

-- join method
SELECT orders.`ClientID`, orders.`Cost`, clients.FullName, clients.ContactNumber FROM orders
INNER JOIN clients ON (orders.`ClientID` = clients.ClientID) AND (`Date` BETWEEN '2020-09-10' AND '2020-09-20');


-- Analyze total sales and revenue
SELECT ProductName, SUM(Quantity) AS TotalQuantity, SUM(Quantity * Price) AS TotalRevenue
FROM Sales
GROUP BY ProductName;


-- Create a sample table
CREATE TABLE TopProducts (
    SaleID INT,
    ProductName VARCHAR(255),
    SaleDate DATE,
    Quantity INT,
    Price DECIMAL(10, 2)
);

-- Insert sample data
INSERT INTO TopProducts (SaleID, ProductName, SaleDate, Quantity, Price) VALUES
(1, 'Laptop', '2024-01-01', 2, 1500.00),
(2, 'Smartphone', '2024-01-02', 3, 800.00),
(3, 'Tablet', '2024-01-03', 1, 600.00),
(4, 'Headphones', '2024-01-04', 5, 100.00);



SELECT * FROM TopProducts;

DROP TABLE orders;
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    ClientID VARCHAR(50),
    ProductID VARCHAR(50),
    Quantity INT,
    Cost DECIMAL(10, 2),
    Date DATE
);


INSERT INTO Orders (ClientID, ProductID, Quantity, Cost, Date) VALUES
('Cl1', 'P1', 10, 500.00, '2020-09-01'),
('Cl2', 'P2', 5, 100.00, '2020-09-05'),
('Cl1', 'P3', 20, 800.00, '2020-09-06'),
('Cl4', 'P4', 15, 150.00, '2020-09-07'),
('Cl3', 'P3', 10, 450.00, '2020-09-08'),
('Cl2', 'P4', 5, 800.00, '2020-09-09'),
('Cl1', 'P4', 22, 1200.00, '2020-09-10'),
('Cl3', 'P1', 15, 150.00, '2020-09-11'),
('Cl1', 'P1', 15, 500.00, '2020-09-12'),
('Cl2', 'P2', 5, 100.00, '2020-09-13'),
('Cl1', 'P1', 10, 500.00, '2020-09-21');


SELECT clients.ClientID, Clients.FullName, Clients.ContactNumber, Orders.`OrderID`, orders.`Cost`, orders.`Date`
FROM clients
LEFT JOIN orders ON clients.ClientID = orders.ClientID
UNION
SELECT clients.ClientID, Clients.FullName, Clients.ContactNumber, Orders.`OrderID`, orders.`Cost`, orders.`Date`
FROM clients
RIGHT JOIN orders ON clients.ClientID = orders.ClientID;


DROP Table orders;

CREATE TABLE Orders (
    OrderID INT,
    ClientID VARCHAR(10),
    ProductID VARCHAR(10),
    Quantity INT, 
    Cost DECIMAL(10, 2),
    Date DATE
);


INSERT INTO Orders (OrderID, ClientID, ProductID, Quantity, Cost, Date) VALUES
(1, 'CL1', 'P1', 10, 500.00, '2020-09-01'),
(2, 'CL2', 'P2', 5, 100.00, '2020-09-05'),
(3, 'CL3', 'P3', 20, 800.00, '2020-09-03'),
(4, 'CL4', 'P4', 15, 150.00, '2020-09-07'),
(5, 'CL1', 'P3', 10, 450.00, '2020-09-08'),
(6, 'CL2', 'P3', 5, 800.00, '2020-09-09'),
(7, 'CL1', 'P4', 22, 1200.00, '2020-09-10'),
(8, 'CL3', 'P1', 15, 150.00, '2020-09-10'),
(9, 'CL1', 'P1', 10, 500.00, '2020-09-12'),
(10, 'CL4', 'P5', 5, 100.00, '2020-09-13'),
(11, 'CL4', 'P5', 5, 100.00, '2022-09-01'),
(12, 'CL1', 'P1', 10, 500.00, '2022-09-01'),
(13, 'CL2', 'P2', 5, 100.00, '2022-09-05'),
(14, 'CL3', 'P3', 20, 800.00, '2022-09-07'),
(15, 'CL4', 'P4', 15, 150.00, '2022-09-07'),
(16, 'CL3', 'P3', 10, 450.00, '2022-09-08'),
(17, 'CL2', 'P2', 5, 100.00, '2022-09-09'),
(18, 'CL3', 'P1', 18, 600.00, '2022-09-10'),
(19, 'CL1', 'P4', 7, 350.00, '2022-09-11'),
(20, 'CL2', 'P2', 12, 240.00, '2022-09-12'),
(21, 'CL3', 'P5', 6, 90.00, '2022-09-13'),
(22, 'CL4', 'P3', 9, 720.00, '2022-09-14'),
(23, 'CL1', 'P1', 8, 400.00, '2022-09-15'),
(24, 'CL2', 'P4', 14, 700.00, '2022-09-16'),
(25, 'CL3', 'P5', 4, 80.00, '2022-09-17'),
(26, 'CL4', 'P1', 11, 550.00, '2022-09-18'),
(27, 'CL1', 'P3', 13, 650.00, '2022-09-19'),
(28, 'CL2', 'P2', 16, 320.00, '2022-09-20'),
(29, 'CL3', 'P4', 19, 950.00, '2022-09-21'),
(30, 'CL4', 'P5', 10, 200.00, '2022-09-22');



CREATE TABLE Clients (
    ClientID VARCHAR(50) PRIMARY KEY,
    FullName VARCHAR(255),
    ContactNumber VARCHAR(15),
    AddressID INT
);

INSERT INTO Clients (ClientID, FullName, ContactNumber, AddressID) VALUES
('CL1', 'Takashi Ito', '351786345', 1),
('CL2', 'Jane Murphy', '351567243', 2),
('CL3', 'Laurina Delgado', '351342597', 3),
('CL4', 'Benjamin Clauss', '351342509', 4),
('CL5', 'Altay Ayhan', '351208983', 5),
('CL6', 'Greta Galkina', '351298755', 6);


DROP Table products;

CREATE TABLE Products (
    ProductID VARCHAR(10) PRIMARY KEY,
    ProductName VARCHAR(255),
    BuyPrice DECIMAL(10, 2),
    SellPrice DECIMAL(10, 2),
    NumberOfItems INT
);

INSERT INTO Products (ProductID, ProductName, BuyPrice, SellPrice, NumberOfItems) VALUES
('P1', 'Artificial grass bags', 40.00, 50.00, 100),
('P2', 'Wood panels', 15.00, 20.00, 250),
('P3', 'Patio slates', 35.00, 40.00, 60),
('P4', 'Sycamore trees', 7.00, 10.00, 50),
('P5', 'Trees and Shrubs', 35.00, 50.00, 75),
('P6', 'Water fountain', 65.00, 80.00, 15);


SELECT clients.ClientID, clients.ContactNumber,
orders.`OrderID`, orders.`Quantity`, orders.`Date`,
products.`NumberOfItems` as "Items in Stock" FROM
clients INNER JOIN orders INNER JOIN products
ON(clients.ClientID = orders.`ClientID` AND orders.`ProductID` = products.`ProductID`)
WHERE (orders.`Quantity` >= 10 AND DATE > '2020-09-05' AND products.`NumberOfItems` >= 50);