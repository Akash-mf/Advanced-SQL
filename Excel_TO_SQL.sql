USE product;

SELECT * FROM Employees;

SHOW TABLES; 

SELECT * FROM company_spreadsheet;

RENAME TABLE company_spreadsheet TO company;

SELECT * FROM company;

Rename TABLE department_dataset TO department;

SELECT * FROM department; 
USE product;

SELECT * FROM Employees;

SHOW TABLES; 

SELECT * FROM company_spreadsheet;

RENAME TABLE company_spreadsheet TO company;

SELECT * FROM company;

Rename TABLE department_dataset TO department;

SELECT * FROM employees;
SELECT * FROM department;
SELECT * FROM company;

SELECT first_name, last_name FROM company;

SELECT id, first_name, last_name FROM company;

SELECT id, first_name, last_name AS 'Last Name' FROM company;

SELECT * FROM company
WHERE department = "Marketing";

SELECT first_name, department FROM company
WHERE department = "Marketing" GROUP BY first_name; 

SELECT * FROM company
WHERE department = "Sales"; 

SELECT first_name, department FROM company
WHERE department = "Sales" GROUP BY first_name; 

SELECT first_name, last_name FROM company 
WHERE department LIKE "Sales";

SELECT first_name, last_name, department FROM company 
WHERE department LIKE "Sales";

SELECT first_name, last_name, tshirt_size FROM company 
WHERE tshirt_size = "L";

SELECT first_name, last_name 
FROM company
WHERE id = 10;

SELECT first_name, last_name, department 
FROM company
WHERE department = "Marketing" OR department = "Sales";

SELECT first_name, last_name, department 
FROM company
WHERE department = "Marketing" AND tshirt_size = "L";

SELECT first_name, last_name, department 
FROM company
WHERE department IS NOT 'Sales';

SELECT first_name, last_name, department  
FROM company  
WHERE department != 'Sales';

-- Logical operator
SELECT first_name, last_name, department 
FROM company
WHERE department = 'sales' OR department = 'Marketing' OR department = 'Services';

SELECT first_name, last_name, department 
FROM company
WHERE department = 'Sales' OR department = 'Marketing' AND tshirt_size ='L'AND 
first_name != 'Rikki';

SELECT first_name, last_name, department, tshirt_size
FROM company
WHERE department = 'Sales' OR department = 'Marketing' AND tshirt_size ='L'AND 
first_name != 'Rikki'; 

SELECT first_name, last_name, department 
FROM company
WHERE (department = 'Sales' OR department = 'Marketing') AND tshirt_size ='L'AND 
first_name != 'Rikki'; 

SELECT DISTINCT(department) FROM company;

-- limit
SELECT * FROM company
LIMIT 10;

SELECT * FROM company
WHERE tshirt_size = 'L'
LIMIt 10; 

SELECT * FROM company
WHERE tshirt_size = 'L'
LIMIT 1 OFFSET 10;

SELECT * FROM company
WHERE Vacation_taken = 9; 

SELECT * FROM company
WHERE Vacation_taken > 9; 

SELECT * FROM company
WHERE Vacation_taken >= 9; 

SELECT * FROM company
WHERE Vacation_taken < 9; 


SELECT * FROM company
WHERE Vacation_taken <> 9;

SELECT * FROM company
WHERE Vacation_taken != 9;  

SELECT * FROM company
WHERE Vacation_taken IS NOT 9; 

SELECT COUNT(Vacation_taken) FROM company;

SELECT * FROM company 
WHERE last_name LIKE "T%";

SELECT * FROM company 
WHERE last_name LIKE "%T";

SELECT * FROM company 
WHERE last_name LIKE "%t%"; 

 SELECT * FROM company 
WHERE last_name LIKE "_a%"; 


SELECT * FROM department; 

SELECT COUNT(ID) FROM department;

SELECT SUM(ID) FROM department; 

SELECT SUM(Dept_name)
FROM department
WHERE ID >= 1 AND id <= 5;

SELECT AVG(Vacation_taken) AS Average_Vacation_taken
From company

SELECT AVG(Vacation_taken) AS Average_Vacation_taken
From company
WHERE department ="marketing";

SELECT AVG(Vacation_taken) AS Average_Vacation_taken
From company
WHERE department ="sales"

SELECT MIN(Vacation_taken) 
FROM company;

SELECT MAX(Vacation_taken) 
FROM company;

SELECT COUNT(id) 
FROM company
WHERE vacation_taken > 20;

SELECT DISTINCT (tshirt_size) FROM company; 

SELECT DISTINCT (tshirt_size) 
FROM company
WHERE tshirt_size IS NOT NULL; 

-- UPPER, LOWER, LENGTH
SELECT UPPER(first_name)
FROM company;

SELECT LOWER(first_name)
FROM company; 

SELECT LENGTH(first_name)
FROM company;

SELECT first_name
FROm company
WHERE LENGTH(first_name) > 8;

SELECT first_name
FROm company
WHERE LENGTH(first_name) > 4;


SELECT first_name, last_name, tshirt_size
FROm company; 

SELECT first_name, last_name, tshirt_size
FROm company
ORDER BY first_name; 

SELECT first_name, last_name, tshirt_size
FROm company
ORDER BY first_name DESC; 

SELECT first_name, last_name, tshirt_size
FROm company
ORDER BY first_name ASC; 

SELECT first_name, last_name, tshirt_size
FROm company
ORDER BY tshirt_size DESC; 

SELECT first_name, last_name, tshirt_size
FROm company
ORDER BY tshirt_size DESC, first_name; 


SELECT first_name, last_name, tshirt_size
FROm company
ORDER BY tshirt_size DESC, first_name DESC; 

SELECT department, COUNT(department)
FROm company
GROUP BY department; 

SELECT department, COUNT(department)
FROm company
GROUP BY department
ORDER BY department; 

SELECT department, COUNT(department)
FROm company
GROUP BY department
ORDER BY department; 

SELECT department, COUNT(department) 
FROm company
GROUP BY department
HAVING COUNT(department)<10
ORDER BY department; 


SELECT department, COUNT(department) AS Number_Of_employees
FROm company
GROUP BY department
HAVING Number_Of_employees<10
ORDER BY department; 

SELECT tshirt_size, COUNT(*) AS 'Total'
FROM company
GROUP BY tshirt_size;

SELECT tshirt_size, COUNT(*) AS 'Total'
FROM company
GROUP BY tshirt_size
HAVING tshirt_size IS NOT NULL;

-- subqueries
SELECT * FROM company
ORDER BY vacation_taken; 

SELECT * FROM company
ORDER BY Vacation_taken DESC;

SELECT * FROM company
WHERe vacation_taken = (select MAX(vacation_taken) From company);

SELECT * FROM company
WHERE department = (select Dept_name FROM department WHERE location = "tech");

SELECT * FROM department;
SELECT * FROM company; 

SHOW TABLES;

SELECT Dept_name FROM department
WHERE location = "pune"; 

SELECT * FROM company 
WHERE department = (SELECT Dept_name FROM department WHERE location = "Mumbai"); 

SELECT * FROM company 
WHERE department IN (
  SELECT Dept_name FROM department WHERE location = 'Mumbai'
);

SELECT COUNT(*) 
FROM information_schema.tables 
WHERE table_schema = 'public' AND table_type = 'BASE TABLE';
