SHOW DATABASES;

USE practice;

CREATE TABLE Employ (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Position VARCHAR(50),
    HireDate DATE NOT NULL DEFAULT (CURRENT_DATE)
);

SELECT VERSION();

CREATE TABLE AuditLog (
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    Action TEXT NOT NULL,
    ActionDate DATETIME NOT NULL
);


DELIMITER //

CREATE TRIGGER trg_BeforeInsert
BEFORE INSERT ON Employ
FOR EACH ROW
BEGIN
    IF NEW.Position IS NULL OR NEW.Position = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Position cannot be empty.';
    END IF;
END;
//

DELIMITER ;

INSERT INTO Employ (FirstName, LastName, Position)
VALUES ('Alice', 'Smith', NULL); -- This will throw an error.

DELIMITER //

CREATE TRIGGER trg_AfterInsert
AFTER INSERT ON Employ
FOR EACH ROW
BEGIN
    INSERT INTO AuditLog (Action, ActionDate)
    VALUES (CONCAT('New employee added: ', NEW.FirstName, ' ', NEW.LastName), NOW());
END;
//

DELIMITER ;

INSERT INTO Employ (FirstName, LastName, Position)
VALUES ('John', 'Doe', 'Manager');

SELECT * FROM AuditLog;

-- Before UPDATE
DELIMITER //

CREATE TRIGGER trg_BeforeUpdate
BEFORE UPDATE ON Employ
FOR EACH ROW
BEGIN
    IF NEW.Position IS NULL OR NEW.Position = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Position cannot be empty.';
    END IF;
END;
//

DELIMITER ;

-- CHECK BEFORE_UPDATE

UPDATE Employees
SET Position = ''
WHERE EmployeeID = 1; -- This will throw an error.


-- AFTER UPDATE

DELIMITER //

CREATE TRIGGER trg_AfterUpdate
AFTER UPDATE ON Employees
FOR EACH ROW
BEGIN
    INSERT INTO AuditLog (Action, ActionDate)
    VALUES (CONCAT('Employee updated: ', OLD.FirstName, ' ', OLD.LastName, 
                   ' -> ', NEW.FirstName, ' ', NEW.LastName), NOW());
END;
//

DELIMITER ;

UPDATE Employees
SET FirstName = 'Jane', LastName = 'Doe'
WHERE EmployeeID = 1;

SELECT * FROM AuditLog; -- Verify the log.

-- AFTER DELETE
DELIMITER //

CREATE TRIGGER trg_AfterDelete
AFTER DELETE ON Employees
FOR EACH ROW
BEGIN
    INSERT INTO AuditLog (Action, ActionDate)
    VALUES (CONCAT('Employee deleted: ', OLD.FirstName, ' ', OLD.LastName), NOW());
END;
//

DELIMITER ;

DELETE FROM Employees
WHERE EmployeeID = 1;

SELECT * FROM AuditLog; -- Verify the log.





 
