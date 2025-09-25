CREATE DATABASE Sales;
USE Sales;

CREATE TABLE sales_data (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Region VARCHAR(20),
    Product VARCHAR(30),
    Quantity INT,
    UnitPrice INT,
    Total INT
);

INSERT INTO sales_data (OrderID, CustomerName, Region, Product, Quantity, UnitPrice, Total) VALUES
(101, 'Akash', 'South', 'Laptop', 2, 40000, 80000),
(102, 'Arun', 'North', 'Laptop', 1, 40000, 40000),
(103, 'Akash', 'South', 'Tablet', 3, 15000, 45000),
(104, 'Priya', 'East', 'Laptop', 1, 40000, 40000),
(105, 'Akash', 'South', 'Laptop', 1, 40000, 40000),
(106, 'Divya', 'North', 'Tablet', 2, 15000, 30000),
(107, 'Ravi', 'West', 'Mobile', 5, 10000, 50000),
(108, 'John', 'East', 'Tablet', 2, 15000, 30000),
(109, 'Sara', 'West', 'Laptop', 1, 40000, 40000),
(110, 'Arun', 'North', 'Mobile', 3, 10000, 30000);

SELECT * FROM sales_data;

SELECT CustomerName, Region, Product, Total,
       ROW_NUMBER() OVER(PARTITION BY Region ORDER BY Total DESC) AS row_num
FROM sales_data;
