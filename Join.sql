USE AGS_Employees;
Create Database AGS_Employees;

-- Create the Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    ContactName VARCHAR(50),
    Country VARCHAR(50)
);

-- Create the Orders table with a foreign key reference to Customers
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    CustomerID INT,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert records into the Customers table
INSERT INTO Customers (CustomerID, CustomerName, ContactName, Country)
VALUES 
    (1, 'Alice', 'Alice Smith', 'USA'),
    (2, 'Bob', 'Bob Johnson', 'Canada'),
    (3, 'Charlie', 'Charlie Brown', 'UK');
    
-- Insert records into the Orders table
INSERT INTO Orders (OrderID, OrderDate, CustomerID, Amount)
VALUES 
    (101, '2024-11-01', 1, 250.75),
    (102, '2024-11-02', 2, 300.50),
    (103, '2024-11-03', 1, 125.00),
    (104, '2024-11-04', 3, 450.25);

SELECT * FROM Customers;
SELECT * FROM Orders;


SELECT Customers.CustomerID, Customers.CustomerName, Orders.OrderID, Orders.OrderDate, Orders.Amount
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

SELECT Customers.CustomerID, Customers.CustomerName, Orders.OrderID, Orders.OrderDate, Orders.Amount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

SELECT Customers.CustomerID, Customers.CustomerName, Orders.OrderID, Orders.OrderDate, Orders.Amount
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

SELECT Customers.CustomerID, Customers.CustomerName, Orders.OrderID, Orders.OrderDate, Orders.Amount
FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

SELECT A.CustomerID AS Customer1_ID, A.CustomerName AS Customer1_Name,
       B.CustomerID AS Customer2_ID, B.CustomerName AS Customer2_Name, 
       A.Country
FROM Customers A
JOIN Customers B ON A.Country = B.Country AND A.CustomerID < B.CustomerID;

