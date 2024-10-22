-- DDL (Data Definition Language):

	-- CREATE: Create database objects (tables, views, etc.)
	-- CREATE TABLE TableName (Column1 DataType, Column2 DataType, ...);
	-- CREATE VIEW ViewName AS SELECT * FROM TableName;

	-- ALTER: Modify existing database objects
	-- ALTER TABLE TableName ADD ColumnName DataType;
	-- ALTER TABLE TableName MODIFY COLUMN ColumnName DataType;

	-- DROP: Delete database objects
	-- DROP TABLE TableName;
	-- DROP VIEW ViewName;

	-- TRUNCATE: Remove all rows from a table (without deleting the table)
	-- TRUNCATE TABLE TableName;

-- TCL (Transaction Control Language):

	-- BEGIN TRANSACTION: Start a new transaction
	-- BEGIN TRANSACTION;

	-- COMMIT: Save the changes made in a transaction
	-- COMMIT;

	-- ROLLBACK: Revert changes made in the current transaction
	-- ROLLBACK;

	-- SAVEPOINT: Set a point in a transaction to roll back to if needed
	-- SAVEPOINT SavepointName;

	-- SET TRANSACTION ISOLATION LEVEL: Define the transaction's isolation level (e.g., Read Committed, Serializable)
	-- SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- DML (Data Manipulation Language):

	-- SELECT: Retrieve data from a database
	-- SELECT * FROM TableName;

	-- INSERT: Add new records to a table
	-- INSERT INTO TableName (Column1, Column2) VALUES (Value1, Value2);

	-- UPDATE: Modify existing records
	-- UPDATE TableName SET Column1 = NewValue WHERE Condition;

	-- DELETE: Remove records from a table
	-- DELETE FROM TableName WHERE Condition;

-- DCL (Data Control Language):

	-- GRANT: Assign permissions to users or roles
	-- GRANT SELECT, INSERT ON TableName TO UserName;

	-- REVOKE: Remove previously granted permissions
	-- REVOKE SELECT, INSERT ON TableName FROM UserName;
