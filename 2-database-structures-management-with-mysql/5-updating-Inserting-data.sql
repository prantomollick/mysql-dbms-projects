-- Active: 1731438237227@@127.0.0.1@3306@companydb
--------------------------------------------------
-- Updating and Inserting Data
--------------------------------------------------
-- Drop if this name database exists
DROP DATABASE CompanyDB;

-- Create a new database
CREATE DATABASE CompanyDB;

-- Use the new database
USE CompanyDB;

-- Create the Employees table
CREATE TABLE Employees (
    EmployeeID INT NOT NULL PRIMARY KEY,
    FullName VARCHAR(255) NOT NULL,
    JobTitle VARCHAR(255) NOT NULL,
    County VARCHAR(255) NOT NULL,
    LineManagerID INT
);

-- Create the EmployeeContactInfo table
CREATE TABLE EmployeeContactInfo (
    EmployeeID INT NOT NULL,
    ContactNumber VARCHAR(15),
    Email VARCHAR(255),
    PRIMARY KEY (EmployeeID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Insert data into the Employees table
INSERT INTO Employees (EmployeeID, FullName, JobTitle, County, LineManagerID) VALUES
(1, 'Seamus Hogan', 'Manager', 'Pinal County', 3),
(2, 'Thomas Eriksson', 'Assistant', 'Pinal County', 1),
(3, 'Simon Tolo', 'Head Chef', 'Gila County', 3),
(4, 'Francesca Soffia', 'Assistant', 'Cochise County', 1),
(5, 'Emily Sierra', 'Accountant', 'Cochise County', 1),
(6, 'Greta Galkina', 'Accountant', 'Cochise County', 3),
(7, 'Pranto Mollick', 'Software Engineer', 'Cochise County', 4);

-- Insert sample data into the EmployeeContactInfo table
INSERT INTO EmployeeContactInfo (EmployeeID, ContactNumber, Email) VALUES
(1, '1234567890', 'seamus.hogan@example.com'),
(2, '0987654321', 'thomas.eriksson@example.com'),
(3, '5555555555', 'simon.tolo@example.com'),
(4, '2222222222', 'francesca.soffia@example.com'),
(5, '1111111111', 'emily.sierra@example.com'),
(6, '3333333333', 'greta.galkina@example.com');


--Insert a data into the EmployeeContactInfo table
INSERT INTO EmployeeContactInfo (EmployeeID, ContactNumber, Email) VALUES
(7, '4444444444', 'john.doe@example.com');

SELECT * FROM EmployeeContactInfo;

--Replace a data into the EmployeeContactInfo table
REPLACE INTO EmployeeContactInfo (EmployeeID, ContactNumber, Email) VALUES
(7, '4444444446', 'john.doe@example.com');

SELECT * FROM EmployeeContactInfo;
