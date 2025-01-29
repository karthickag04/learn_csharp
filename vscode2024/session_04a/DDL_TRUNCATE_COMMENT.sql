-- *************************************************************
-- TRUNCATE TABLE & COMMENT ON OBJECT
-- *************************************************************

-- ************************************************
-- TRUNCATE TABLE
-- ************************************************
-- Truncate the 'employee' table to remove all rows but keep the table structure.
-- Truncating a table is faster than DELETE since it doesn't log individual row deletions.
-- Note: Truncating a table doesn't fire triggers, and it can't be rolled back (in most databases).
-- The table structure and schema remain intact for future use.

-- Syntax: 
-- TRUNCATE TABLE table_name;
-- It removes all rows from the table but does not remove the table structure.

-- Example: Truncate the 'employee' table.
-- This is useful when you want to remove all data without removing the table structure.

TRUNCATE TABLE employee;


-- ************************************************
-- COMMENT ON OBJECT
-- ************************************************
-- COMMENT ON OBJECT adds a description or metadata to database objects (tables, columns, views, etc.).
-- This can be helpful for documentation, as it provides clarity on the purpose of the object.

-- Syntax: 
-- COMMENT ON table_object IS 'description';
-- COMMENT ON column_object IS 'description';

-- Example 1: Add a comment to the 'employee' table.
-- Describes the purpose of the table.
-- This is useful for developers or users who may interact with the table later.

-- Adding a description to the 'employee' table to specify it holds employee records.
/*
COMMENT ON TABLE employee IS 'Table storing employee records including employee ID, name, position, and salary.';
*/

-- Example 2: Add a comment to a column in the 'employee' table.
-- Describes the 'id' column (which is the primary key).
/*
COMMENT ON COLUMN employee.id IS 'Unique identifier for each employee.';
*/

-- Example 3: Add a comment to the 'name' column in the 'employee' table.
-- Describes the 'name' column (which stores employee names).
/*
COMMENT ON COLUMN employee.name IS 'Full name of the employee.';
*/

-- Example 4: Add a comment to the 'position' column in the 'employee' table.
-- Describes the 'position' column (which stores the job title or role of the employee).
/*
COMMENT ON COLUMN employee.position IS 'Job position or role of the employee within the company.';
*/

-- Example 5: Add a comment to the 'salary' column in the 'employee' table.
-- Describes the 'salary' column (which stores the employee's salary).
/*
COMMENT ON COLUMN employee.salary IS 'Employee\'s monthly salary.';
*/

-- ************************************************
-- ADDING COMMENTS TO INDEXES (OPTIONAL)
-- ************************************************
-- You can also add comments to indexes. Here’s an example for indexing the 'salary' column in the 'employee' table.

-- Example: Add a comment to the 'idx_employee_salary' index.
-- This provides information on the purpose of the index (e.g., improving query performance for salary-based queries).
/*
COMMENT ON INDEX idx_employee_salary IS 'Index on employee salary column for performance optimization in salary-based queries.';
*/

-- ************************************************
-- ADDING COMMENTS TO PROCEDURES (OPTIONAL)
-- ************************************************
-- Example: Add a comment to the 'get_employee_by_id' procedure.
-- This helps document what the procedure does.
-- You would typically use this when your stored procedures contain complex logic or multiple steps.
-- Adds a description of the procedure that fetches an employee by their unique ID.
/*
COMMENT ON PROCEDURE get_employee_by_id IS 'Procedure to retrieve an employee\'s details by employee ID.';
*/

-- ************************************************
-- ADDING COMMENTS TO FUNCTIONS (OPTIONAL)
-- ************************************************
-- Example: Add a comment to the 'calculate_bonus' function.
-- This provides documentation on what the function does.
-- Describes a function that calculates bonuses based on the employee's salary.
/*
COMMENT ON FUNCTION calculate_bonus IS 'Function to calculate employee bonus based on salary (10% of salary).';
*/

-- ************************************************
-- ADDING COMMENTS TO VIEWS (OPTIONAL)
-- ************************************************
-- Example: Add a comment to the 'employee_summary_view'.
-- This provides documentation on what the view does.
-- Describes a view that aggregates employee details (id, name, position, and salary).
/*
COMMENT ON VIEW employee_summary_view IS 'View that summarizes employee details including ID, name, position, and salary.';
*/

-- ************************************************
-- ADDING COMMENTS TO TRIGGERS (OPTIONAL)
-- ************************************************
-- Example: Add a comment to the 'employee_before_insert_trigger'.
-- This explains the purpose of the trigger (e.g., to set default values or perform validation before insert).
/*
COMMENT ON TRIGGER employee_before_insert_trigger IS 'Trigger that sets default position to \'Unknown\' if no position is provided during employee insert.';
*/

