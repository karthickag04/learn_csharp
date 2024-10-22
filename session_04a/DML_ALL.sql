-- *************************************************************
-- SQL Operations: SELECT, INSERT, UPDATE
-- *************************************************************

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
SELECT * FROM employee;

-- Example: Retrieve only the 'name' and 'position' of employees from the 'employee' table.
-- This will return the 'name' and 'position' columns only.
-- Syntax: SELECT column1, column2 FROM table_name;
SELECT name, position FROM employee;

-- Example: Retrieve employees whose salary is greater than 70,000.
-- This uses the WHERE clause to filter records based on a condition.
-- Syntax: SELECT * FROM table_name WHERE condition;
SELECT * FROM employee WHERE salary > 70000;

-- Example: Retrieve employees whose position is 'Software Engineer' and salary is greater than 80,000.
-- Syntax: SELECT * FROM table_name WHERE condition1 AND condition2;
SELECT * FROM employee WHERE position = 'Software Engineer' AND salary > 80000;

-- ************************************************
-- INSERT: Inserts new rows into a table
-- ************************************************
-- The INSERT INTO statement is used to add new rows to a table.
-- The basic syntax is:
-- INSERT INTO table_name (column1, column2, ...) VALUES (value1, value2, ...);

-- Example: Insert a new employee into the 'employee' table.
-- Syntax: INSERT INTO table_name (column1, column2, ...) VALUES (value1, value2, ...);
INSERT INTO employee (name, position, salary) 
VALUES ('Alice Johnson', 'Data Analyst', 75000);

-- Example: Insert multiple employees in a single query.
-- Syntax: INSERT INTO table_name (column1, column2, ...) VALUES (value1, value2, ...), (value3, value4, ...), ...;
INSERT INTO employee (name, position, salary) 
VALUES ('Michael Green', 'HR Specialist', 72000),
       ('Sophie Black', 'Marketing Manager', 85000);

-- ************************************************
-- UPDATE: Updates existing records in a table
-- ************************************************
-- The UPDATE statement is used to modify existing records in a table.
-- The basic syntax is:
-- UPDATE table_name SET column1 = value1, column2 = value2, ... WHERE condition;

-- Example: Update the salary of an employee with a specific name.
-- Syntax: UPDATE table_name SET column1 = value1 WHERE condition;
UPDATE employee SET salary = 78000 WHERE name = 'Alice Johnson';

-- Example: Increase the salary by 5% for all employees who are 'Software Engineers'.
-- Syntax: UPDATE table_name SET column1 = value1 WHERE condition;
UPDATE employee SET salary = salary * 1.05 WHERE position = 'Software Engineer';

-- Example: Update the position of an employee whose name is 'Michael Green'.
-- Syntax: UPDATE table_name SET column1 = value1 WHERE condition;
UPDATE employee SET position = 'Senior HR Specialist' WHERE name = 'Michael Green';

-- *************************************************************
-- Example Operations with Employee Table
-- *************************************************************

-- 1. Retrieve all employees from the 'employee' table
-- This will list all columns and all rows in the 'employee' table
SELECT * FROM employee;

-- 2. Insert a new employee into the 'employee' table
INSERT INTO employee (name, position, salary) 
VALUES ('Chris White', 'Product Manager', 90000);

-- 3. Update an employee's position and salary in the 'employee' table
UPDATE employee 
SET position = 'Lead Software Engineer', salary = 95000 
WHERE name = 'John Doe';

-- 4. Retrieve employees with a salary greater than 80,000
SELECT * FROM employee WHERE salary > 80000;

-- 5. Insert multiple employees into the 'employee' table
INSERT INTO employee (name, position, salary) 
VALUES ('Emma Davis', 'Accountant', 68000),
       ('Lucas Miller', 'Developer', 82000);

-- 6. Update the salary for all 'Software Engineers' by 10%
UPDATE employee SET salary = salary * 1.10 WHERE position = 'Software Engineer';

