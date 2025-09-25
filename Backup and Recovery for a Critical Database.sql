CREATE DATABASE critical_db;
USE critical_db;

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2)
);

INSERT INTO employees (name, salary) VALUES ('John Doe', 50000.00), ('Jane Smith', 60000.00);
SELECT * FROM employees;

DROP DATABASE critical_db;

SHOW DATABASES;

CREATE DATABASE critical_db;




