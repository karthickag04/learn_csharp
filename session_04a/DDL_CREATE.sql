-- ===========================================
-- CREATE DATABASE: Creates a new database
-- ===========================================
-- This creates a new database named 'MyDatabase'.
CREATE DATABASE MyDatabase;
GO

-- ===========================================
-- CREATE TABLE: Creates a new table in the database
-- ===========================================
-- This creates a new table named 'Employees' with columns for EmployeeID, FirstName, LastName, and HireDate.
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,       -- Primary key column
    FirstName NVARCHAR(50),           -- First name of the employee
    LastName NVARCHAR(50),            -- Last name of the employee
    HireDate DATE                     -- Hire date of the employee
);
GO

-- ===========================================
-- CREATE INDEX: Creates an index on a table column
-- ===========================================
-- This creates an index on the 'LastName' column of the 'Employees' table to speed up searches by LastName.
CREATE INDEX idx_LastName ON Employees (LastName);
GO

-- ===========================================
-- CREATE PROCEDURE: Creates a stored procedure
-- ===========================================
-- This creates a stored procedure to retrieve all employees based on a specific 'LastName'.
CREATE PROCEDURE GetEmployeeByLastName
    @LastName NVARCHAR(50)          -- Input parameter for the LastName to search
AS
BEGIN
    SELECT EmployeeID, FirstName, LastName, HireDate
    FROM Employees
    WHERE LastName = @LastName;     -- Query employees with the specified LastName
END;
GO

-- ===========================================
-- CREATE FUNCTION: Creates a user-defined function
-- ===========================================
-- This creates a function that returns the full name of an employee.
CREATE FUNCTION GetFullName (@EmployeeID INT)
RETURNS NVARCHAR(100)
AS
BEGIN
    DECLARE @FullName NVARCHAR(100);

    -- Concatenate FirstName and LastName for the given EmployeeID
    SELECT @FullName = FirstName + ' ' + LastName
    FROM Employees
    WHERE EmployeeID = @EmployeeID;

    RETURN @FullName;               -- Return the full name
END;
GO

-- ===========================================
-- CREATE VIEW: Creates a view that represents a subset of the data
-- ===========================================
-- This creates a view named 'EmployeeDetailsView' to show EmployeeID, Full Name, and Hire Date.
CREATE VIEW EmployeeDetailsView AS
SELECT EmployeeID, 
       FirstName + ' ' + LastName AS FullName,   -- Combine FirstName and LastName as FullName
       HireDate
FROM Employees;
GO

-- ===========================================
-- CREATE TRIGGER: Creates a trigger that automatically executes when certain conditions occur
-- ===========================================
-- This trigger fires after an insert on the 'Employees' table to log the creation of a new employee.
CREATE TRIGGER trgAfterInsertEmployee
ON Employees
FOR INSERT
AS
BEGIN
    DECLARE @EmployeeID INT;
    DECLARE @FullName NVARCHAR(100);

    -- Get the EmployeeID and FullName of the newly inserted employee
    SELECT @EmployeeID = EmployeeID, @FullName = FirstName + ' ' + LastName
    FROM INSERTED;                    -- 'INSERTED' holds the new row data

    -- Log the insertion event
    PRINT 'New employee inserted: ' + @FullName + ' with EmployeeID: ' + CAST(@EmployeeID AS NVARCHAR(10));
END;
GO
