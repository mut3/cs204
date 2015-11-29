-- Will Barnwell
-- CS 204
-- HW 11
-- denorm.sql

-- i. Merge the schemas of three tables Department, Dept_locations, and Project into one table schema. Show the resulting schema (with no duplicate columns) and show all functional and multi-valued dependencies in the way shown in Figure 15.12 (page 527) of the textbook. (Use a double arrowhead for a multi-valued dependency.). 
-- Drawn on paper and submitted in class with exercise 2
-- ii. Create the merged table. Specify the primary key of the merged table. Commit after creating the table. In addition, discuss briefly how you would enforce the functional dependency constraints identified in step i. Note that specifying the primary key of the merged relation does not automatically enforce the dependency constraints identified in the exercise b-i, because the merged table is not in the normal form.  
CREATE TABLE tblDepartmentProjectLocation
(
	fldDname varchar(255),
	pmkDnumber varchar(255) NOT NULL,
	fnkMgrSsn int,
	fldMgrStartDate varchar(255),
	fldDlocation varchar(255) NOT NULL,
	fldPname varchar(255),
	pmkPnumber varchar(255) NOT NULL,
	fldPlocation varchar(255),
	CONSTRAINT chk_ValidProjLocation CHECK (fldPlocation IN ('Bellaire','Sugarland','Houston','Stafford')),
	PRIMARY KEY(pmkDnumber, pmkPnumber, fldDlocation)
);
commit;
-- iii. Insert into the merged table tuples merged from the tuples in the original tables. Commit after the insertion is done. This insertion of merged tuples can be done by executing one SQL statement which inserts the result of a SELECT statement into the merged table. The SELECT statement combines the tuples from the three original tables (i.e., Department, Dept_locations, Project) through joins. (Before executing the SELECT statement, create the original three tables using the provide script create_tables_dept_locs_projs.sql and insert tuples into them using the provided script insert_tuples_dept_locs_projs.sql. Make sure to drop the original tables after inserting tuples into the merged table.) 
--create tables
start tblCreate.sql;
-- fill tables
start tblFill.sql;
-- insert records
INSERT INTO tblDepartmentProjectLocation (
	fldDname,
	pmkDnumber,
	fnkMgrSsn,
	fldMgrStartDate,
	fldDlocation,
	fldPname,
	pmkPnumber,
	fldPlocation
)
SELECT 
	tblDepartment.fldDname,
	tblDepartment.pmkDnumber,
	tblDepartment.fnkMgrSsn,
	tblDepartment.fldMgrStartDate,
	tblDeptLocation.fldDlocation,
	tblProject.fldPname,
	tblProject.pmkPnumber,
	tblProject.fldPlocation
FROM tblProject 
JOIN tblDepartment 
	ON tblProject.fnkDnum = tblDepartment.pmkDnumber
JOIN tblDeptLocation
	ON tblDeptLocation.fnkDnumber = tblDepartment.pmkDnumber;
--drop tables
start tblClear.sql;
commit;
-- iv. Create an index on the column dnumber. Well, as in the exercise a, there are only a handful of tuples, so it’s an overkill to create an index here, but let’s do it anyway for the sake of experiencing it. Commit after creating the index. 
CREATE INDEX idxDnumber ON tblDepartmentProjectLocation (pmkDnumber);
commit;
-- v. Execute the following queries against the merged table: (1) retrieve tuples belonging to each of the original tables (i.e., Department, Dept_locations, Project), 
-- tblDepartment columns
SELECT DISTINCT fldDname, pmkDnumber, fnkMgrSsn, fldMgrStartDate FROM tblDepartmentProjectLocation;
-- tblDeptLocation columns
SELECT DISTINCT fldDlocation, pmkDnumber FROM tblDepartmentProjectLocation;
-- tblProject columns
SELECT DISTINCT fldPname, pmkPnumber, fldPlocation, pmkDnumber FROM tblDepartmentProjectLocation;
-- (2) retrieve the location and the project (name) of a department named 'Administration'. Make sure there are no duplicate tuples in the query results. 
SELECT  DISTINCT fldPlocation, fldPname FROM tblDepartmentProjectLocation WHERE fldDname = 'Administration';
-- vi. Drop the index and the merged table. Commit after dropping them all.
DROP INDEX idxDnumber;
DROP TABLE tblDepartmentProjectLocation CASCADE CONSTRAINTS;
commit;