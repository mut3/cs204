-- 1) Create a table, named 'audit_trail', for storing an audit trail record. It suffices to include one column of a variable length character string, e.g., varchar(500). Hint: feel free to use the same one used in a trigger example code in class. 
CREATE TABLE audit_trail
(
	message varchar(500)
);
-- 2) Create four types of triggers – before_table, after_table, before_row, and after_row (and named as such, i.e.., 'before_table', 'after_table', 'before_row', and 'after_row') – with the event defined on 'update of the salary column of the table Employee' and the action specified as writing an audit record into the table created in step 1. Make each audit record as  'Before_table trigger fired.', 'After_table trigger fired.', 'Before_row trigger fired.', and 'After_row trigger fired.' 

CREATE OR REPLACE TRIGGER before_table 
BEFORE
UPDATE
ON tblEmployee 
BEGIN 
   INSERT INTO audit_trail VALUES ('Before_table trigger fired.');
END;

CREATE OR REPLACE TRIGGER before_row 
BEFORE
UPDATE OF fldSalary 
ON tblEmployee 
BEGIN 
   INSERT INTO audit_trail VALUES ('Before_row trigger fired.');
END;

CREATE OR REPLACE TRIGGER after_row 
AFTER
UPDATE OF fldSalary 
ON tblEmployee 
BEGIN 
   INSERT INTO audit_trail VALUES ('After_row trigger fired.');
END;

CREATE OR REPLACE TRIGGER after_table 
AFTER
UPDATE
ON tblEmployee 
BEGIN 
   INSERT INTO audit_trail VALUES ('After_table trigger fired.');
END;

-- 3) Fire the triggers created in step 2 by executing a statement for raising all employees’ salary by 10%. This single statement fires all four triggers. 
UPDATE tblEmployee SET fldSalary = fldSalary*1.1;

-- 4) Show the content of the audit records by executing an SQL select statement. 
SELECT * FROM audit_trail;

-- 5) Drop the four triggers.
DROP TRIGGER before_table;
DROP TRIGGER before_row;
DROP TRIGGER after_row;
DROP TRIGGER after_table;