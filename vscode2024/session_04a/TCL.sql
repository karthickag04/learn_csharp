-- *************************************************************
-- TCL Commands: Control the transaction behavior ensuring
-- data integrity and consistency.
-- *************************************************************

-- ************************************************
-- BEGIN TRANSACTION
-- ************************************************
-- Starts a new transaction. All subsequent operations
-- (INSERT, UPDATE, DELETE) are treated as part of this transaction.
-- You can commit the changes or roll them back if something goes wrong.

-- Syntax:
-- BEGIN TRANSACTION;
-- Starts a new transaction, marking the beginning of a sequence of operations.
-- Example: Start a new transaction for inserting an employee record.

-- The following statement starts a transaction.
BEGIN TRANSACTION;
-- Example SQL Operation (insert employee data):
/*
INSERT INTO employee (name, position, salary) 
VALUES ('John Doe', 'Software Engineer', 80000);
*/

-- ************************************************
-- COMMIT
-- ************************************************
-- Saves all changes made in the current transaction. 
-- If a COMMIT is issued, the transaction is permanent and all changes are applied.

-- Syntax:
-- COMMIT;
-- Example: Commit the current transaction to save changes to the database.

-- Example: If all operations were successful, you can commit the transaction.
COMMIT;  

-- ************************************************
-- ROLLBACK
-- ************************************************
-- Undoes all the changes made in the current transaction.
-- If there was an error or you want to undo the operations, you can use ROLLBACK.

-- Syntax:
-- ROLLBACK;
-- Example: Rollback the transaction if an error occurs or if you want to discard changes.

-- Example: If an error occurs during an operation, you can rollback:
ROLLBACK;

-- ************************************************
-- SAVEPOINT
-- ************************************************
-- Sets a point within the transaction to which you can later roll back.
-- SAVEPOINT allows you to roll back only to a certain point in the transaction,
-- rather than rolling back the entire transaction.

-- Syntax:
-- SAVEPOINT savepoint_name;
-- Example: Set a savepoint at a specific point in the transaction.

-- Example: Set a savepoint before performing an operation (inserting an employee).

/*
SAVEPOINT savepoint_before_insert;
*/ 



-- ************************************************
-- RELEASE SAVEPOINT
-- ************************************************
-- Removes a savepoint that was previously set within the transaction.
-- Once a savepoint is released, it cannot be rolled back to that point.

-- Syntax:
-- RELEASE SAVEPOINT savepoint_name;
-- Example: After an operation is confirmed to be successful, you can release the savepoint.

-- Example: Release the savepoint after inserting the employee data successfully.

/*
RELEASE SAVEPOINT savepoint_before_insert;
*/

-- ************************************************
-- SET TRANSACTION
-- ************************************************
-- Configures the transaction's isolation level and other properties.
-- The isolation level defines how transaction integrity is visibly affected by other concurrent transactions.

-- Syntax:
-- SET TRANSACTION ISOLATION LEVEL isolation_level;
-- The most common isolation levels are:
-- - READ UNCOMMITTED
-- - READ COMMITTED
-- - REPEATABLE READ
-- - SERIALIZABLE

-- Example: Set the isolation level to REPEATABLE READ to ensure consistent data is read
-- during the transaction even if other transactions modify the data.

-- Syntax: 
-- SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Example: Setting the isolation level for a new transaction to 'READ COMMITTED'.

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;



