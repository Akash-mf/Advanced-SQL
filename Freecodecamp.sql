USE classicmodels;
SHOW tables;
SHOW table status;
 SELECT * FROM Offices;
 
 SELECT COUNT(OfficeCode)
 FROM Offices;
 
 
-- Add some more entires into the offices table, using just the required (NOT NULL) columns.
INSERT INTO Offices (OfficeCode,city,phone,addressline1,country,postalCode,territory)
VALUES ('aaa', 'Bengaluru', '+916380593319', '1, MG Road', 'India', '560001');



-- Explore what happens if you don't provide a value for a column marked as not null.


-- Try adding an entry with a primary key matching the an existing entry.

-- Retrieve and display just the city and phone number information for each office.
SELECT `city`, `phone` FROM `offices`;


-- Employees
CREATE TABLE `employees` (
  `employeeNumber` int(11) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `extension` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `officeCode` varchar(10) NOT NULL,
  `reportsTo` int(11) DEFAULT NULL,
  `jobTitle` varchar(50) NOT NULL,
  PRIMARY KEY (`employeeNumber`),
  FOREIGN KEY (`reportsTo`) REFERENCES `employees` (`employeeNumber`),
  FOREIGN KEY (`officeCode`) REFERENCES `offices` (`officeCode`)
);

DROP TABLE IF EXISTS `employees`;


SELECT * FROM employees;

select COUNT(employeeNumber) FROM employees;

-- Try inserting an entry into employees with an invalid value for officeCode.
INSERT INTO `employees` 
(employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle) 
VALUES 
(2001, 'Doe', 'John', 'x9999', 'jdoe@classicmodelcars.com', '99', 1002, 'Sales Rep');


-- Try inserting an entry into employees with an invalid value for reportsTo.
INSERT INTO `employees` 
(employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle) 
VALUES 
(2002, 'Smith', 'Anna', 'x8888', 'asmith@classicmodelcars.com', '1', 9999, 'Sales Rep');

-- Try inserting an entry into employees with an invalid value for reportsTo
INSERT INTO `employees` 
(`employeeNumber`, `lastName`, `firstName`, `extension`, `email`, `officeCode`, `reportsTo`, `jobTitle`) 
VALUES 
(2001, 'Brown', 'James', 'x3001', 'jbrown@classicmodelcars.com', '10', 1002, 'Sales Manager'),
(2002, 'Davis', 'Sarah', 'x3002', 'sdavis@classicmodelcars.com', '10', 2001, 'Sales Rep'),
(2003, 'Wilson', 'Emily', 'x3003', 'ewilson@classicmodelcars.com', '10', 2001, 'Sales Rep');

-- Create a new office location and add some employees for the new location.
INSERT INTO `offices` 
(`officeCode`, `city`, `phone`, `addressLine1`, `country`, `postalCode`, `territory`) 
VALUES 
('11', 'Dubai', '+971 4 567 8901', 'Downtown Dubai', 'UAE', '00000', 'MEA');

INSERT INTO employees 
(employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle) 
VALUES 
(3001, 'Ali', 'Mohammed', 'x4001', 'mali@classicmodelcars.com', '11', 1002, 'Sales Manager'),
(3002, 'Khan', 'Ayesha', 'x4002', 'akhan@classicmodelcars.com', '11', 3001, 'Sales Rep'),
(3003, 'Ahmed', 'Omar', 'x4003', 'oahmed@classicmodelcars);

SELECT * FROM employees;

SELECT * FROM Customers;

-- 1.List the customers in the United States with a credit limit higher than $1000.

SELECT `customerNumber`, `customerName`, `creditLimit`
FROM `customers`
WHERE `country` = 'USA' AND `creditLimit` > 1000;

-- 2. List the employee codes for sales representatives of customers in Spain, France, and Italy.

SELECT DISTINCT `salesRepEmployeeNumber`
FROM `customers`
WHERE `country` IN ('Spain', 'France', 'Italy') AND `salesRepEmployeeNumber` IS NOT NULL;


-- 3. List the names and email addresses of those employees.

SELECT e.`employeeNumber`, e.`lastName`, e.`firstName`, e.`email`
FROM `employees` e
JOIN `customers` c ON e.`employeeNumber` = c.`salesRepEmployeeNumber`
WHERE c.`country` IN ('Spain', 'France', 'Italy');

-- 4.Change the job title "Sales Rep" to "Sales Representative".
SET SQL_SAFE_UPDATES = 0;

UPDATE `employees`
SET `jobTitle` = 'Sales Representative'
WHERE `jobTitle` = 'Sales Rep';

SET SQL_SAFE_UPDATES = 1;

-- 5.Delete the entries for Sales Representatives working in London.

DELETE FROM `employees`
WHERE `jobTitle` = 'Sales Representative' AND `officeCode` IN (
    SELECT `officeCode`
    FROM `offices`
    WHERE `city` = 'London'
);

-- 6.Show a list of employees who are not sales representatives.

SELECT `employeeNumber`, `lastName`, `firstName`, `jobTitle`
FROM `employees`
WHERE `jobTitle` != 'Sales Representative'; 

--7.Show a list of customers with "Toys" in their name.

SELECT `customerNumber`, `customerName`
FROM `customers`
WHERE `customerName` LIKE '%Toys%';

SELECT * FROM customers;
SELECT * FROM employees;

-- wrong
SELECT * FROM `employees` 
WHERE `jobTitle` = 'Sales Rep';

-- Correct query
SELECT * FROM `employees` 
WHERE `jobTitle` LIKE '%Sales Rep%';

DROP TABLE IF EXISTS `productlines`;


CREATE TABLE `productlines` (
  `productLine` varchar(50) NOT NULL,
  `textDescription` varchar(4000) DEFAULT NULL,
  `htmlDescription` mediumtext,
  `image` mediumblob,
  PRIMARY KEY (`productLine`)
);

DROP TABLE `products`;


SELECT * FROM productlines;
SHOW TABLES;

TRUNCATE TABLE Products;

SELECT * FROM Products; 
SHOW Tables;




