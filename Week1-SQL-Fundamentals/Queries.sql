
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

--Retrive all orders
SELECT Orders.OrderID, Customers.Name, Products.ProductName, Orders.Quantity, Orders.OrderDate
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN Products ON Orders.ProductID = Products.ProductID;

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

