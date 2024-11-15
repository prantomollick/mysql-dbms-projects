-- Active: 1731438237227@@127.0.0.1@3306@little_lemon
--------------------------------------------------
-- constraints
--------------------------------------------------

DROP DATABASE Little_Lemon;

-- Create new database
CREATE DATABASE Little_Lemon;

USE Little_Lemon;


--create customers table to kept the customer information
CREATE TABLE Customers (
    CustomerID INT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- column doesn't accept null or empty value;
    FullName VARCHAR(100) NOT NULL,
    PhoneNumber INT NOT NULL UNIQUE
);

SHOW COLUMNS FROM customers;

-- Referential integrity constraints
CREATE TABLE Bookings(
    BookingID INT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- this is called key constraints
    BookingDate DATE NOT NULL,
    TableNumber INT NOT NULL,
    NumberOfGuests INT NOT NULL CHECK(NumberOfGuests <= 8), -- check is domain constraints
    CustomerID INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID) ON DELETE CASCADE ON UPDATE CASCADE -- Referential integrity constraints
     -- this is means when you delete something in customer table it will also effect on this table as well, it will update of delete the record in bookings table.
);

SHOW COLUMNS FROM bookings;