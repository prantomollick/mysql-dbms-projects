-- Active: 1731438237227@@127.0.0.1@3306@restaurant_management_db
--------------------------------------------------
--Joining Tables
--------------------------------------------------

DROP DATABASE restaurant_management_db;

CREATE DATABASE restaurant_management_db;

USE restaurant_management_db;

-- Bookings table
CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY,
    CustomerID INT,
    BookingDate DATE,
    NumberOfGuests INT,
    SpecialRequests TEXT
);

INSERT INTO Bookings (BookingID, CustomerID, BookingDate, NumberOfGuests, SpecialRequests) VALUES
(1, 101, '2023-01-01', 2, 'None'),
(2, 102, '2023-01-02', 4, 'Vegetarian meal'),
(3, 103, '2023-01-03', 3, 'Window seat'),
(4, 104, '2023-01-04', 5, 'Birthday cake'),
(5, 105, '2023-01-05', 2, 'None'),
(6, 106, '2023-01-06', 6, 'Anniversary celebration'),
(7, 107, '2023-01-07', 2, 'None'),
(8, 108, '2023-01-08', 4, 'Gluten-free meal'),
(9, 109, '2023-01-09', 3, 'None'),
(10, 110, '2023-01-10', 2, 'None');

-- Courses table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(255),
    Description TEXT,
    Price DECIMAL(10, 2)
);

INSERT INTO Courses (CourseID, CourseName, Description, Price) VALUES
(1, 'Appetizer', 'Starter course', 5.99),
(2, 'Main Course', 'Main dish', 15.99),
(3, 'Dessert', 'Sweet dish', 6.99),
(4, 'Beverage', 'Drink', 2.99),
(5, 'Salad', 'Healthy salad', 7.99),
(6, 'Soup', 'Warm soup', 4.99),
(7, 'Pasta', 'Italian pasta', 12.99),
(8, 'Pizza', 'Cheesy pizza', 10.99),
(9, 'Burger', 'Juicy burger', 8.99),
(10, 'Sandwich', 'Delicious sandwich', 6.99);

-- Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Email VARCHAR(255),
    PhoneNumber VARCHAR(20)
);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, PhoneNumber) VALUES
(101, 'John', 'Doe', 'john.doe@example.com', '123-456-7890'),
(102, 'Jane', 'Smith', 'jane.smith@example.com', '234-567-8901'),
(103, 'Alice', 'Johnson', 'alice.johnson@example.com', '345-678-9012'),
(104, 'Bob', 'Brown', 'bob.brown@example.com', '456-789-0123'),
(105, 'Charlie', 'Davis', 'charlie.davis@example.com', '567-890-1234'),
(106, 'David', 'Wilson', 'david.wilson@example.com', '678-901-2345'),
(107, 'Eve', 'Miller', 'eve.miller@example.com', '789-012-3456'),
(108, 'Frank', 'Taylor', 'frank.taylor@example.com', '890-123-4567'),
(109, 'Grace', 'Anderson', 'grace.anderson@example.com', '901-234-5678'),
(110, 'Hank', 'Thomas', 'hank.thomas@example.com', '012-345-6789');

-- Food_Orders_Delivery_Status table
CREATE TABLE Food_Orders_Delivery_Status (
    OrderID INT PRIMARY KEY,
    Date_food_order_placed_with_supplier DATE,
    Date_food_order_received_from_supplier DATE,
    Order_status VARCHAR(255)
);

INSERT INTO Food_Orders_Delivery_Status (OrderID, Date_food_order_placed_with_supplier, Date_food_order_received_from_supplier, Order_status) VALUES
(1, '2023-02-01', '2023-02-05', 'Completed'),
(2, '2023-02-02', '2023-02-06', 'Completed'),
(3, '2023-02-03', '2023-02-07', 'Completed'),
(4, '2023-02-04', NULL, 'In Progress'),
(5, '2023-02-05', '2023-02-10', 'Completed'),
(6, '2023-02-06', '2023-02-11', 'Completed'),
(7, '2023-02-07', '2023-02-12', 'Completed'),
(8, '2023-02-08', NULL, 'In Progress'),
(9, '2023-02-09', '2023-02-14', 'Completed'),
(10, '2023-02-10', '2023-02-15', 'Completed');


-- Starters table
CREATE TABLE Starters (
    StarterName VARCHAR(255),
    Cost DECIMAL(10, 2)
);

INSERT INTO Starters (StarterName, Cost) VALUES
('Olives', 4.75),
('Flatbread', 5.00),
('Minestrone', 8.50),
('Tomato bread', 8.50),
('Falafel', 6.75),
('Hummus', 5.00),
('Bruschetta', 7.25),
('Stuffed Mushrooms', 8.00),
('Spring Rolls', 6.50),
('Garlic Bread', 4.50);



SELECT * FROM food_orders_delivery_status;

--SQL alias
SELECT OrderID, Date_food_order_placed_with_supplier AS "Order Placed Date",
Date_food_order_received_from_supplier as "Order Received Date", 
Order_status from food_orders_delivery_status;


--SQL concat two columns and alias
SELECT CONCAT(OrderID, " ", Order_Status) as "Order Status" from food_orders_delivery_status;

SELECT * FROM starters;
SELECT * FROM courses;

SELECT s.StarterName, s.Cost, c.CourseName, c.Price from courses AS c, starters as s where c.`Price` < 12 AND s.`Cost` < 5;
