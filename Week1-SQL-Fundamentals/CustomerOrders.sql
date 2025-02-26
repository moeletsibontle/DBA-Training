--Create a database

CREATE DATABASE CustomerOrderDB;
GO
--Use the database
USE CustomerOrderDB;
GO

--Create Customers Table
CREATE TABLE Customers (
 CustomerID INT IDENTITY(1,1) PRIMARY KEY, --Automatically creates a CLUSTERED INDEX
 Name VARCHAR(100) NOT NULL,
 Email VARCHAR(100) UNIQUE NOT NULL --Automatically creates a UNIQUE INDEX
 );
 GO 

--Create Products Table
CREATE TABLE Products (
 ProductID INT IDENTITY(1,1) PRIMARY KEY,
 ProductName VARCHAR(100) NOT NULL,
 Price DECIMAL(10,2) NOT NULL
 );

--Create Orders Table
CREATE TABLE Orders(
 OrderID INT IDENTITY(1,1) PRIMARY KEY,
 CustomerID INT,
 OrderDate DATETIME DEFAULT GETDATE(),
 FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
 );

 --Deleted the Customer Table and created the on called Customers using
 --DROP TABLE Customer;

 --Adding Data to the Tables

 --Insert Customers, Products, Orders
 INSERT INTO Customers (Name, Email) VALUES
  ('Bontle Moeletsi', 'bontle@email.com'),
  ('Naledi Sehlati', 'naledi@email.com'),
  ('Zozo Mogale', 'zozo@email.com');

INSERT INTO Products (ProductName, Price) VALUES
 ('Peset Blue', '1500.00'),
 ('Peset Red', '1200.00'),
 ('Peset Orange', '1000.00');

INSERT INTO Orders (CustomerID, OrderDate) VALUES
 (1, '2024-02-24'),
 (2, '2024-02-23'),
 (3, '2024-02-22');

 --

 SELECT * FROM Customers;
 SELECT * FROM Products;
 SELECT * FROM Orders;

 SELECT * FROM Orders
 WHERE CustomerID = 1;

 /*Writing SQL Queries - Task 1: SELECT, INSERT, UPDATE, DELETE Queries */

 --SELECT - Retrieve all customers
 SELECT * FROM Customers;

 -- SELECT - Retrieve orders with customer names
SELECT Orders.OrderID, Customers.Name, Orders.OrderDate
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

--INSERT - Add a new Customer
INSERT INTO Customers (Name, Email) VALUES ('Kabelo Sehlati', 'Kabelo@email.com');

 --UPDATE - Change a customer's email
UPDATE Customers
SET Email = 'BMoeletsi@email.com'
WHERE Name = 'Bontle Moeletsi';
 
 --DELETE - Remove a Customer
DELETE FROM Customers WHERE Name = 'Kabelo Sehlati';

--Using JOIN

--INNER JOIN (Only Matching Records in both table) - Orders with customer names -who placed an order
SELECT Orders.OrderID, Customers.Name, Orders.OrderDate
FROM Orders
INNER JOIN Customers ON Orders.OrderID = Orders.CustomerID;

-- LEFT JOIN (All from the left table, matches the right) - Show all customers even if they have no order
SELECT Customers.Name, Orders.OrderID, Orders.OrderDate
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

--RIGHT JOIN (All from the right table, matches the left) - Show all orders, even if customers are missing/deleted
SELECT  Orders.OrderID, Customers.Name, Orders.OrderDate
FROM Orders
RIGHT JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

--FULL JOIN (All records from both tables) - Show all customers and orders
SELECT Customers.Name, Orders.OrderID, Orders.OrderDate
FROM Customers
FULL JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

/* GROUP BY, HAVING, ORDER BY*/

--GROUP BY - Count order per customer
SELECT Customers.Name, COUNT(Orders.OrderID) AS OrderCount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.OrderID
GROUP BY Customers.Name;

--HAVING - Show only customers with more than 1 order
SELECT Customers.Name, COUNT(Orders.OrderID) AS OrderCount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.OrderID
GROUP BY Customers.Name
HAVING COUNT(Orders.OrderID) > 1;

-- ORDER BY - List products by price (Highest to lowest)
SELECT * 
FROM Products
ORDER BY Price DESC;

/*Indexing Basics - Speed up data retrival*/

SELECT * FROM Orders WHERE CustomerID = 1;

CREATE INDEX idx_CustomerID ON Orders (CustomerID);





