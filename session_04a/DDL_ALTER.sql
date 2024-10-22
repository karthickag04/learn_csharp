-- 1. ALTER TABLE: Adding a new column, modifying an existing column, and dropping a column
-- ===============================================================================

-- Add a new column named 'Age' of data type INT to the 'Employees' table.
-- This operation is used when we need to expand the table schema to include new data.
ALTER TABLE Employees
ADD Age INT;  -- New column 'Age' is added as an integer.

-- Modify an existing column named 'Age' to change its data type to VARCHAR(50).
-- This can be useful if the data type was initially defined incorrectly or needs to be adjusted.
ALTER TABLE Employees
ALTER COLUMN Age VARCHAR(50);  -- Change 'Age' column's data type from INT to VARCHAR(50).

-- Drop an existing column named 'Age' from the 'Employees' table.
-- Dropping a column removes it from the table entirely, typically used when the column is no longer needed.
ALTER TABLE Employees
DROP COLUMN Age;  -- The 'Age' column is removed from the table.

-- ======================================================================================

-- 2. ALTER PROCEDURE: Modifying the logic of an existing stored procedure
-- ======================================================================================

-- The 'GetEmployeeDetails' stored procedure selects employee details from the 'Employees' table.
-- We are modifying the procedure to only return employees whose status is 'Active'.

ALTER PROCEDURE GetEmployeeDetails
AS
BEGIN
    -- Select employee details for employees who are active (Status = 'Active').
    SELECT EmployeeID, Name, Department
    FROM Employees
    WHERE Status = 'Active';  -- Filtering for employees whose status is 'Active'.
END;

-- ======================================================================================

-- 3. ALTER FUNCTION: Modifying a user-defined function (UDF)
-- ======================================================================================

-- The 'GetFullName' function is a scalar function that concatenates 'FirstName' and 'LastName' from the 'Employees' table.
-- Here, we're modifying the function to include an optional title like 'Mr.' or 'Ms.'.

ALTER FUNCTION GetFullName(@EmployeeID INT)
RETURNS NVARCHAR(100)
AS
BEGIN
    DECLARE @FullName NVARCHAR(100);
    -- Concatenate FirstName, LastName, and Title, using 'Mr.' or 'Ms.' based on gender.
    SELECT @FullName = Title + ' ' + FirstName + ' ' + LastName
    FROM Employees
    WHERE EmployeeID = @EmployeeID;
    
    RETURN @FullName;  -- Return the concatenated full name with title.
END;

-- ======================================================================================

-- 4. ALTER INDEX: Rebuilding or reorganizing an index for performance improvements
-- ======================================================================================

-- The 'IX_EmployeeName' is a non-clustered index on the 'Name' column in the 'Employees' table.
-- Rebuilding the index will optimize the query performance that uses this index.

ALTER INDEX IX_EmployeeName ON Employees
REBUILD;  -- Rebuilding the index to optimize query performance and free up space.

-- Alternatively, if we don't need to rebuild but just want to reorganize (less resource-intensive):
-- ALTER INDEX IX_EmployeeName ON Employees
-- REORGANIZE;

