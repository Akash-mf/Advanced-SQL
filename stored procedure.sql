USE college;

SELECT * FROM data;

                                                                                                                                                                                                                                             
-- 2 Simple Stored Procedure: Get all data
DELIMITER //

CREATE PROCEDURE GetAllOrders()
BEGIN
    SELECT * FROM data;
END //

DELIMITER ;

CALL GetAllOrders();

DROP PROCEDURE IF EXISTS product_sum;


DELIMITER ##

CREATE PROCEDURE product_sum(IN rname VARCHAR(10), OUT total_sum INT)
BEGIN
    SELECT SUM(total) INTO total_sum FROM data WHERE productline = rname;
END ##

DELIMITER ;

-- Declare and initialize the variable
SET @arun = 0;

-- Call the stored procedure
CALL product_sum('Electronics', @arun);

-- Retrieve the result
SELECT @arun;

SHOW TABLES;
SELECT * FROM employee1;


SELECT * FROM employees;


CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO employees (employee_id, employee_name, department, salary) VALUES
(1, 'John Doe', 'HR', 55000.00),
(2, 'Jane Smith', 'Finance', 72000.00),
(3, 'Mike Johnson', 'Engineering', 88000.00),
(10, 'Emily Davis', 'Sales', 63000.00);

DELIMITER //

CREATE FUNCTION get_salary(emp_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE het_salary DECIMAL(10,2);
    
    SELECT salary INTO het_salary FROM employees WHERE employee_id = emp_id;
    
    RETURN het_salary;
END //

DELIMITER ;


SELECT get_salary(10);









-- With Input Parameter: Get orders by location

DELIMITER //

CREATE PROCEDURE GetOrdersByLocation(IN locationName VARCHAR(20))
BEGIN
    SELECT * FROM data
    WHERE CustomerLocation = locationName;
END //

DELIMITER ;

CALL GetOrdersByLocation('Toronto');


 -- 3. With Multiple Inputs: Total sales by product line in a location
 
 DELIMITER //

CREATE PROCEDURE GetSalesByProductAndLocation(
    IN prodLine VARCHAR(20),
    IN locationName VARCHAR(20)
)
BEGIN
    SELECT SUM(Total) AS TotalSales
    FROM data
    WHERE ProductLine = prodLine AND CustomerLocation = locationName;
END //

DELIMITER ;

CALL GetSalesByProductAndLocation('Electronics', 'Tokyo');

-- 4. Update Procedure: Change Quantity and Recalculate Total
SET SQL_SAFE_UPDATES = 0;


DELIMITER //

CREATE PROCEDURE UpdateOrderQuantity(
    IN orderId INT,
    IN newQuantity INT
)
BEGIN
    UPDATE data
    SET Quantity = newQuantity,
        Total = UnitPrice * newQuantity
    WHERE OrderID = orderId;
END //

DELIMITER ;


CALL UpdateOrderQuantity(4, 6);

SET SQL_SAFE_UPDATES = 1;

-- 5. Delete Procedure: Delete orders below a certain total

DELIMITER //

CREATE PROCEDURE DeleteLowValueOrders(
    IN minTotal INT
)
BEGIN
    DELETE FROM data
    WHERE Total < minTotal;
END //

DELIMITER ;

CALL DeleteLowValueOrders(250);

-- 6. Procedure with Output: Count orders for a product

DELIMITER //

CREATE PROCEDURE CountOrdersByProduct(
    IN prodLine VARCHAR(20),
    OUT totalOrders INT
)
BEGIN
    SELECT COUNT(*) INTO totalOrders
    FROM data
    WHERE ProductLine = prodLine;
END //

DELIMITER ; 

CALL CountOrdersByProduct('Clothing', @count);
SELECT @count;


