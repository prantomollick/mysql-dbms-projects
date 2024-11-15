-- Active: 1731438237227@@127.0.0.1@3306@little_lemon
--------------------------------------------------
-- changing table structure
--------------------------------------------------


DROP DATABASE Little_Lemon;

-- Create new database
CREATE DATABASE Little_Lemon;

USE Little_Lemon;

CREATE TABLE Machinery (
    EmployeeID varchar(10) NULL,
    FullName varchar(100) NULL,
    County varchar(100) NULL,
    PhoneNumber int NULL
);

-- Display table structure or table schema
SHOW COLUMNS FROM Machinery;

--alter table statement to modify the constraints of a table
ALTER TABLE Machinery
MODIFY EmployeeID VARCHAR(10) NOT NULL PRIMARY KEY,
MODIFY FullName VARCHAR(100) NOT NULL,
MODIFY county VARCHAR(100) NOT NULL,
MODIFY PhoneNumber INT NOT NULL UNIQUE;

SHOW COLUMNS FROM Machinery;

-- alter table add new column into this machinery table
ALTER TABLE Machinery
ADD COLUMN age INT NOT NULL CHECK(age >= 18);

SHOW COLUMNS FROM Machinery;

