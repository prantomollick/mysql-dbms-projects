-- Active: 1731438237227@@127.0.0.1@3306@clients

--------------------------------------------------
-- Copy Table
-- Copy an existing table’s data to a new table
-- Copy a table with constraints
-- Copy existing table data to a new database
--------------------------------------------------

--Copy table process
--1.	Identify the table and database to be copied
--2.	Determine the columns to be copied
--3.	Build a new table using CREATE TABLE
--4.	Structure the new table with SELECT command

DROP DATABASE clients;

CREATE DATABASE clients;

USE clients;

-- Create the table 
CREATE TABLE Clients (
    ClientID VARCHAR(3)NOT NULL PRIMARY KEY,
    FullName VARCHAR(50) NOT NULL, 
    ContactNumber VARCHAR(10) NOT NULL, 
    Location VARCHAR(20) NOT NULL
);

-- Insert the data
INSERT INTO Clients (ClientID, FullName, ContactNumber, Location) VALUES
('C11', 'Takashi Ito', '351786345', 'Pinal County'),
('C12', 'Jane Murphy', '351567243', 'Pinal County'),
('C13', 'Laurina Delgado', '351342597', 'Pinal County'),
('C14', 'Benjamin Clauss', '351342509', 'Graham County'),
('C15', 'Altay Ayhan', '351208983', 'Santa Cruz County'),
('C16', 'Greta Galkina', '351298755', 'Graham County')

SELECT * FROM clients;

--create new clientsCopy table to copy clients table using this command below:
CREATE TABLE clientsCopy SELECT * FROM clients;

SELECT * FROM clientscopy;

-- copy partial data from clients table to clientsTest2 table using this command below:
CREATE TABLE clientstest2 SELECT FullName, ContactNumber from clients;

SELECT * FROM clientstest2;

--Copying with filter data using where clause
CREATE TABLE clientstest3 SELECT FullName, ContactNumber from clients WHERE Location = "Pinal County";

SELECT * FROM clientstest3;


show COLUMNS FROM clients;

-- you can see here is the differnce when we copy clients table to clientsCopy table it doesn't copy the key constraints (create table) command
show COLUMNS from clientscopy;

-- So you can apply another command to copy exact same table to another table with constraints, it's copies existing tables structure (using like command)
CREATE Table ClientsTest4 like clients;

show COLUMNS from clientstest4;

-- So now goal is to copy data from clients table data from clients database to testclients database;
CREATE DATABASE testclients;
CREATE Table testclients.clientsTest SELECT * From clients.clients;

USE testclients;

SELECT * FROM clientsTest;

show COLUMNS from clientsTest;

-- generate new table with same structure as clients table but with different name
CREATE Table testclients.clientsTest2 like clients.clients;

-- insert all data into the new database new table
INSERT INTO testclients.clientsTest2 SELECT * FROM clients.clients;
SHOW COLUMNS FROM clientstest2;
SELECT * FROM clientstest2; 
