-- *************************************************************
-- DROP DATABASE, TABLE, INDEX, PROCEDURE, FUNCTION, VIEW, TRIGGER
-- *************************************************************

-- ************************************************
-- DROP DATABASE
-- ************************************************
-- Drop the existing 'company_db' database.
-- This will remove the database and all its associated objects (tables, views, triggers, etc.).
-- Use this carefully in production environments!
DROP DATABASE IF EXISTS MyDatabase;

-- ************************************************
-- DROP TABLE
-- ************************************************
-- Drop the 'employee' table if it exists.
-- This will remove the table and all its data.
-- The 'employee' table is assumed to contain employee records.
-- In this case, let's assume the table has columns like 'id', 'name', 'position', and 'salary'.

DROP TABLE IF EXISTS employees;

-- ************************************************
-- DROP INDEX
-- ************************************************
-- Drop the index 'idx_employee_salary' if it exists.
-- The index may have been created on the 'salary' column for better performance on salary-based queries.
-- This will drop the index, but the 'employee' table itself remains unaffected.

-- Example of dropping an index on the 'salary' column in the 'employee' table.
-- You would drop an index if you no longer need it or if you want to recreate it later with different settings.

DROP INDEX IF EXISTS idx_LastName;

-- ************************************************
-- DROP PROCEDURE
-- ************************************************
-- Drop the stored procedure 'get_employee_by_id' if it exists.
-- This procedure is assumed to retrieve an employee by their 'id'.
-- Stored procedures are often used for reusable logic in the database.
-- You may want to drop the procedure if it is no longer necessary or if you're making changes.

-- Example of dropping a procedure that retrieves an employee's details by their id.

DROP PROCEDURE IF EXISTS GetEmployeeByLastName;

-- ************************************************
-- DROP FUNCTION
-- ************************************************
-- Drop the function 'calculate_bonus' if it exists.
-- This function might calculate employee bonuses based on performance or salary.
-- Dropping a function is useful if the logic needs to change or if it's no longer relevant.

-- Example of dropping a function that calculates bonuses for employees based on their salary.

DROP FUNCTION IF EXISTS GetFullName;


-- ************************************************
-- DROP VIEW
-- ************************************************
-- Drop the 'employee_summary_view' if it exists.
-- This view might aggregate employee data (e.g., showing employee names, positions, and salaries).
-- Views can be dropped when no longer needed or when the schema changes.

-- Example of dropping a view that summarizes employee details.

DROP VIEW IF EXISTS EmployeeDetailsView;

-- ************************************************
-- DROP TRIGGER
-- ************************************************
-- Drop the trigger 'employee_before_insert_trigger' if it exists.
-- This trigger may have been set to run before inserting new employees, validating data or setting default values.
-- Dropping the trigger is appropriate if you no longer need the behavior it enforces.

-- Example of dropping a trigger that runs before inserting into the 'employee' table.

DROP TRIGGER IF EXISTS trgAfterInsertEmployee;

