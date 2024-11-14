-- Active: 1731438237227@@127.0.0.1@3306@clientordersdb
--------------------------------------------------
--Joining Tables
--------------------------------------------------

DROP DATABASE ClientOrdersDB;

-- Create the database
CREATE DATABASE ClientOrdersDB;

USE ClientOrdersDB;


-- Create the Clients table
CREATE TABLE Clients ( 
    ClientID VARCHAR(3) PRIMARY KEY, 
    FullName VARCHAR(50), 
    ContactNumber VARCHAR(10), 
    Address VARCHAR(100)
)


-- Insert data into the Clients table
INSERT INTO Clients (ClientID, FullName, ContactNumber, Address) VALUES
('C1', 'Takashi Ito', '351786345', '724 Greenway Drive'),
('C2', 'Jane Murphy', '351567243', '102 Sycamore Lane'),
('C3', 'Laurina Delgado', '351342597', '291 Oak Wood Avenue'),
('C4', 'Benjamin Clauss', '351342509', '831 Beechwood Terrace'),
('C5', 'Altay Ayhan', '351208983', '755 Palm Tree Hills'),
('C6', 'Greta Galkina', '351298755', '831 Beechwood Terrace');

-- Create the Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    ClientID VARCHAR(3),
    ProductID VARCHAR(2),
    Quantity INT,
    Cost DECIMAL(10, 2),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);

-- Insert data into the Orders table
INSERT INTO Orders (OrderID, ClientID, ProductID, Quantity, Cost) VALUES
(1, 'C1', 'P1', 10, 500.00),
(2, 'C2', 'P2', 5, 100.00),
(3, 'C3', 'P3', 20, 800.00),
(4, 'C4', 'P4', 15, 150.00),
(5, 'C3', 'P3', 10, 450.00),
(6, 'C1', 'P2', 5, 800.00),
(7, 'C1', 'P4', 22, 1200.00),
(8, 'C1', 'P1', 15, 150.00);


--Inner JOIN
SELECT clients.`FullName` FROM clients INNER JOIN orders ON clients.`ClientID` = `Orders`.`ClientID`;

SELECT clients.`ClientID`, clients.`FullName` AS "Full Name", clients.`ContactNumber` AS "Phone Number", orders.`ProductID` as "Prodduct Code",
orders.`Quantity` as "Items Quantity", orders.`Cost` FROM clients INNER JOIN orders ON clients.`ClientID` = orders.`ClientID`;


-- LEFT JOIN
SELECT c.`ClientID` as "Client ID", c.`FullName` as 'Full Name', o.`OrderID` AS "ORDER ID", o.`Quantity`, o.`Cost`
FROM clients AS c LEFT JOIN orders AS o ON c.`ClientID` = o.`ClientID`;


SELECT c.`ClientID` as "Client ID", c.`FullName` AS 'Full Name', o.`OrderID` AS "ORDER ID", o.`Quantity`, o.`Cost`
FROM clients as c RIGHT JOIN orders AS O ON c.`ClientID` = o.`ClientID`

-- Creating the Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FullName VARCHAR(50),
    JobTitle VARCHAR(50),
    County VARCHAR(50),
    LineManagerID INT
);

-- Inserting data into the Employees table
INSERT INTO Employees (EmployeeID, FullName, JobTitle, County, LineManagerID) VALUES
(1, 'Seamus Hogan', 'Manager', 'Pinal County', 3),
(2, 'Thomas Eriksson', 'Assistant', 'Pinal County', 1),
(3, 'Simon Tolo', 'Head Chef', 'Gila County', 3),
(4, 'Francesca Soffia', 'Assistant', 'Cochise County', 1),
(5, 'Emily Sierra', 'Accountant', 'Cochise County', 1),
(6, 'Greta Galkina', 'Accountant', 'Cochise County', 3);

-- Using a left join to get employees and their line managers
SELECT e.FullName AS EmployeeName, e.JobTitle, e.County, m.FullName AS ManagerName
FROM Employees e
LEFT JOIN Employees m ON e.LineManagerID = m.EmployeeID;

SELECT * FROM employees;

--SELF JOIN
SELECT e1.`FullName` AS "Line Manager", e2.FullName AS 'Employee' FROM employees AS e1 INNER JOIN
employees AS e2 ON e1.`EmployeeID` = e2.`LineManagerID`;

--UNION OPERATOR HOW TO WORK
CREATE TABLE CurrentClients (
    ClientID VARCHAR(5) NOT NULL,
    FullName VARCHAR(50),
    ContactNumber INT,
    Location VARCHAR(50),
    PRIMARY KEY (ClientID)
);

CREATE TABLE LegacyClients (
    ClientID VARCHAR(5) NOT NULL,
    FullName VARCHAR(50),
    ContactNumber INT,
    Location VARCHAR(50),
    PRIMARY KEY (ClientID)
);


INSERT INTO CurrentClients (ClientID, FullName, ContactNumber, Location) VALUES
('CI01', 'Benjamin Clauss', 351854758, 'Graham County'),
('CI02', 'Altay Ayhan', 351963258, 'Pinal County'),
('CI03', 'Greta Galkina', 351784512, 'Santa Cruz County'),
('CI04', 'Julia Marr', 351854125, 'Cochise County'),
('CI05', 'Karl Murry', 351314658, 'Gila County');

INSERT INTO LegacyClients (ClientID, FullName, ContactNumber, Location) VALUES
('CI1', 'Takashi Ito', 351786345, 'Graham County'),
('CI2', 'Jane Murphy', 351567243, 'Pinal County'),
('CI3', 'Laurina Delgado', 351342597, 'Santa Cruz County'),
('CI4', 'Mike Edwards', 351342509, 'Gila County'),
('CI5', 'Julia Marr', 351208741, 'Cochise County');


SELECT FullName, Location FROM CurrentClients
UNION ALL
select `FullName`, `Location` FROM legacyclients;