CREATE DATABASE subquery;
USE subquery;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    salary INT,
    department_id INT
);

INSERT INTO employees (employee_id, employee_name, salary, department_id) VALUES
(1, 'Alice', 70000, 10),
(2, 'Bob', 55000, 20),
(3, 'Carol', 60000, 20),
(4, 'David', 80000, 30),
(5, 'Eve', 40000, 10),
(6, 'Frank', 52000, 30),
(7, 'Grace', 67000, 40);


CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO departments (department_id, department_name, location) VALUES
(10, 'HR', 'New York'),
(20, 'Sales', 'New York'),
(30, 'Engineering', 'San Francisco'),
(40, 'Marketing', 'Boston');

-- 🔹 1. Single-row Subquery

SELECT employee_name
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);


-- 2. Multi-row Subquery
SELECT employee_name
FROM employees
WHERE department_id IN (
    SELECT department_id FROM departments WHERE location = 'New York'
);

-- 3. Correlated Subquery
SELECT employee_name, salary, department_id
FROM employees E1
WHERE salary > (
    SELECT AVG(salary)
    FROM employees E2
    WHERE E2.department_id = E1.department_id
);

-- 4. Subquery in FROM Clause
SELECT department_id, avg_salary
FROM (
    SELECT department_id, AVG(salary) AS avg_salary 
    FROM employees 
    GROUP BY department_id
) AS dept_avg
WHERE avg_salary > 50000;

-- 5. Subquery in HAVING Clause
SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id
HAVING SUM(salary) > (
    SELECT SUM(salary) 
    FROM employees 
    WHERE department_id = 10
);

