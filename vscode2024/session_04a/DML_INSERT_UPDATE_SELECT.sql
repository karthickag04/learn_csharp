-- *************************************************************
-- SQL Operations: SELECT, INSERT, UPDATE
-- *************************************************************


-- Example: Insert a new employee into the 'Employees' table.
-- Syntax: INSERT INTO table_name (column1, column2, ...) VALUES (value1, value2, ...);
INSERT INTO Employees (EmployeeID, FirstName, LastName, HireDate) 
VALUES (1, 'Alice', 'Johnson', '2024-01-15');

-- Example: Insert multiple employees in a single query.
-- Syntax: INSERT INTO table_name (column1, column2, ...) VALUES (value1, value2, ...), (value3, value4, ...), ...;
INSERT INTO Employees (EmployeeID, FirstName, LastName, HireDate) 
VALUES (2, 'Michael', 'Green', '2023-11-20'),
       (3, 'Sophie', 'Black', '2023-10-10');


-- if you want remove and insert
TRUNCATE TABLE Employees;


-- ************************************************
-- SELECT: Retrieves data from one or more tables
-- ************************************************
-- The SELECT statement is used to query the database and retrieve data from one or more tables.
-- The basic syntax is:
-- SELECT column1, column2, ... FROM table_name;
-- or to retrieve all columns, use:
-- SELECT * FROM table_name;

-- Example: Retrieve all employee records from the 'employee' table.
-- This will return all columns and rows from the table.
-- Syntax: SELECT * FROM table_name;
SELECT * FROM Employees;




-- Example: Retrieve only the 'EmployeeID' and 'FirstName' of employees from the 'employees' table.
-- This will return the 'name' and 'position' columns only.
-- Syntax: SELECT column1, column2 FROM table_name;
SELECT EmployeeID,FirstName FROM Employees;

-- Example: Retrieve employees whose salary is greater than 70,000.
-- This uses the WHERE clause to filter records based on a condition.
-- Syntax: SELECT * FROM table_name WHERE condition;

SELECT * FROM Employees WHERE EmployeeID=2;

-- Example: Retrieve employees whose position is 'Software Engineer' and salary is greater than 80,000.
-- Syntax: SELECT * FROM table_name WHERE condition1 AND condition2;


SELECT * FROM Employees WHERE FirstName = 'Alice' AND EmployeeID = 2; -- wrong because employeeid 2 is not alice



select * from Employees;

-- ************************************************
-- UPDATE: Updates existing records in a table
-- ************************************************
-- The UPDATE statement is used to modify existing records in a table.
-- The basic syntax is:
-- UPDATE table_name SET column1 = value1, column2 = value2, ... WHERE condition;

-- Example: Update the last name of an employee with a specific first name.
-- Syntax: UPDATE table_name SET column1 = value1 WHERE condition;
UPDATE Employees SET LastName = 'Johnson-Smith' WHERE FirstName = 'Alice';

-- Example: Update the hire date for all employees hired before '2023-12-01'.
-- Syntax: UPDATE table_name SET column1 = value1 WHERE condition;
UPDATE Employees SET HireDate = '2023-12-15' WHERE HireDate < '2023-12-01';

-- Example: Update the last name of an employee with a specific EmployeeID.
-- Syntax: UPDATE table_name SET column1 = value1 WHERE condition;
UPDATE Employees SET LastName = 'Greenfield' WHERE EmployeeID = 2;

-- *************************************************************
-- Example Operations with Employees Table
-- *************************************************************

-- 1. Retrieve all employees from the 'Employees' table.
-- This will list all columns and all rows in the 'Employees' table.
SELECT * FROM Employees;

-- 2. Insert a new employee into the 'Employees' table.
INSERT INTO Employees (EmployeeID, FirstName, LastName, HireDate) 
VALUES (4, 'Chris', 'White', '2023-08-01');

-- 3. Update an employee's last name and hire date in the 'Employees' table.
UPDATE Employees 
SET LastName = 'Doe', HireDate = '2023-07-01' 
WHERE FirstName = 'John';

-- 4. Retrieve employees who were hired after '2023-01-01'.
SELECT * FROM Employees WHERE HireDate > '2023-01-01';

-- 5. Insert multiple employees into the 'Employees' table.
INSERT INTO Employees (EmployeeID, FirstName, LastName, HireDate) 
VALUES (5, 'Emma', 'Davis', '2023-09-22'),
       (6, 'Lucas', 'Miller', '2023-08-15');

-- 6. Update the hire date for all employees hired before '2023-06-01' by setting a new hire date.
UPDATE Employees SET HireDate = '2023-06-15' WHERE HireDate < '2023-06-01';
