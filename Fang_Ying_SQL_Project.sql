SELECT * FROM employee.employee;


use test;

create database sample2

use sample2;


create table customer
( 
customer int primary key , 
customernumber int not null unique check ( customernumber>0),
lastname varchar(30) not null, 
firstname varchar(30) not null, 
areacode int default 71000,
address varchar(50),
country varchar(50) default 'Malaysia'
) 

INSERT INTO customer (customernumber, lastname, firstname, areacode, address, country)
VALUES
  (100, 'Fang Ying', 'Sham', 418999, 'sdadasfdfd', DEFAULT),
  (200, 'Mei Mei', 'Tan', DEFAULT, 'adssdsadsd', 'Thailand'),
  (300, 'Albert', 'John', DEFAULT, 'dfdsfsdf', DEFAULT);
  
  
  
  -- All records
SELECT * FROM customer;

-- Specific columns
SELECT customerid, customernumber, lastname, firstname FROM customer;



-- Add new column
ALTER TABLE customer ADD phonenumber VARCHAR(20);

-- Update values
UPDATE customer SET phonenumber = '1234545346' WHERE customerid = 1;
UPDATE customer SET phonenumber = '45554654' WHERE customerid = 2;

-- Delete column
ALTER TABLE customer DROP COLUMN phonenumber;


-- (Note: Below will fail if column already dropped)
-- ALTER TABLE customer MODIFY phonenumber VARCHAR(10);  -- Only valid if column exists



-- Delete specific record
DELETE FROM customer WHERE country = 'Thailand';

-- Delete all records (optional)
-- DELETE FROM customer;

-- Drop the table
DROP TABLE customer;



-- Delete specific record
DELETE FROM customer WHERE country = 'Thailand';

-- Delete all records (optional)
-- DELETE FROM customer;

-- Drop the table
DROP TABLE customer;



CREATE DATABASE SaleOrder;
USE SaleOrder;


CREATE TABLE customer (
  CustomerID INT NOT NULL PRIMARY KEY,
  CustomerFirstName VARCHAR(50) NOT NULL,
  CustomerLastName VARCHAR(50) NOT NULL,
  CustomerAddress VARCHAR(50) NOT NULL,
  CustomerSuburb VARCHAR(50),
  CustomerCity VARCHAR(50) NOT NULL,
  CustomerPostCode CHAR(4),
  CustomerPhoneNumber CHAR(12)
);

CREATE TABLE inventory (
  InventoryID TINYINT NOT NULL PRIMARY KEY,
  InventoryName VARCHAR(50) NOT NULL,
  InventoryDescription VARCHAR(255)
);

CREATE TABLE employee (
  EmployeeID TINYINT NOT NULL PRIMARY KEY,
  EmployeeFirstName VARCHAR(50) NOT NULL,
  EmployeeLastName VARCHAR(50) NOT NULL,
  EmployeeExtension CHAR(4)
);

CREATE TABLE sale (
  SaleID TINYINT NOT NULL PRIMARY KEY,
  CustomerID INT NOT NULL,
  InventoryID TINYINT NOT NULL,
  EmployeeID TINYINT NOT NULL,
  SaleDate DATE NOT NULL,
  SaleQuantity INT NOT NULL,
  SaleUnitPrice DECIMAL(8,2) NOT NULL,
  FOREIGN KEY (CustomerID) REFERENCES customer(CustomerID),
  FOREIGN KEY (InventoryID) REFERENCES inventory(InventoryID),
  FOREIGN KEY (EmployeeID) REFERENCES employee(EmployeeID)
);



CREATE TABLE customer (
  CustomerID INT NOT NULL PRIMARY KEY,
  CustomerFirstName VARCHAR(50) NOT NULL,
  CustomerLastName VARCHAR(50) NOT NULL,
  CustomerAddress VARCHAR(50) NOT NULL,
  CustomerSuburb VARCHAR(50),
  CustomerCity VARCHAR(50) NOT NULL,
  CustomerPostCode CHAR(4),
  CustomerPhoneNumber CHAR(12)
);




-- 2. Inventory table
CREATE TABLE inventory (
  InventoryID TINYINT NOT NULL PRIMARY KEY,
  InventoryName VARCHAR(50) NOT NULL,
  InventoryDescription VARCHAR(255)
);

-- 3. Employee table
CREATE TABLE employee (
  EmployeeID TINYINT NOT NULL PRIMARY KEY,
  EmployeeFirstName VARCHAR(50) NOT NULL,
  EmployeeLastName VARCHAR(50) NOT NULL,
  EmployeeExtension CHAR(4)
);


-- 4. Sale table (now foreign keys will work)
CREATE TABLE sale (
  SaleID TINYINT NOT NULL PRIMARY KEY,
  CustomerID INT NOT NULL,
  InventoryID TINYINT NOT NULL,
  EmployeeID TINYINT NOT NULL,
  SaleDate DATE NOT NULL,
  SaleQuantity INT NOT NULL,
  SaleUnitPrice DECIMAL(8,2) NOT NULL,
  FOREIGN KEY (CustomerID) REFERENCES customer(CustomerID),
  FOREIGN KEY (InventoryID) REFERENCES inventory(InventoryID),
  FOREIGN KEY (EmployeeID) REFERENCES employee(EmployeeID)
);


select * from 


-- COUNT
SELECT COUNT(*) AS `Number of Records` FROM customer WHERE CustomerFirstName LIKE 'B%';

-- SUM + GROUP BY
SELECT 
  sale.EmployeeID,
  employee.EmployeeFirstName,
  employee.EmployeeLastName,
  COUNT(*) AS `Number of Orders`,
  SUM(SaleQuantity) AS `Total Quantity`
FROM sale
JOIN employee ON sale.EmployeeID = employee.EmployeeID
GROUP BY sale.EmployeeID, employee.EmployeeFirstName, employee.EmployeeLastName;

-- Monthly Sale Report
SELECT 
  MONTH(SaleDate) AS `Month`,
  COUNT(*) AS `Number of Sales`,
  SUM(SaleQuantity * SaleUnitPrice) AS `Total Amount`
FROM sale
GROUP BY MONTH(SaleDate);

-- MAX, MIN, AVG
SELECT MAX(Salary) FROM EmployeeSalary;
SELECT MIN(Salary) FROM EmployeeSalary;
SELECT AVG(Salary) FROM EmployeeSalary;

