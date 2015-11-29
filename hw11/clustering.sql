-- Will Barnwell
-- CS 204
-- HW 11
-- clustering.sql 

-- i. Create a cluster containing tables Department, Dept_locations, and Project, where dnumber is the clustering key. Use the table schema shown in the textbook Figure 3.7 (page 75). Omit the foreign key constraint for mgrssn in the Department table, since the table Employee is omitted in this exercise. Commit after creating the cluster and the tables in the cluster.
CREATE CLUSTER clsDepartment
(
   	dnumber NUMBER(4)
);
CREATE TABLE tblDepartment
(
	fldDname varchar(255),
	pmkDnumber varchar(255) NOT NULL,
	fnkMgrSsn int,
	fldMgrStartDate varchar(255),
	PRIMARY KEY(pmkDnumber)
)
CLUSTER clsDepartment (pmkDnumber);

CREATE TABLE tblDeptLocation
(
	fnkDnumber varchar(255) NOT NULL,
	fldDlocation varchar(255) NOT NULL,
	CONSTRAINT fk_DeptLocDnumber FOREIGN KEY (fnkDnumber) REFERENCES tblDepartment(pmkDnumber),
	PRIMARY KEY(fnkDnumber, fldDlocation)
)
CLUSTER clsDepartment (fnkDnumber);

CREATE TABLE tblProject
(
	fldPname varchar(255),
	pmkPnumber varchar(255) NOT NULL,
	fldPlocation varchar(255),
	fnkDnum varchar(255),
	CONSTRAINT chk_ProjLocation CHECK (fldPlocation IN ('Bellaire','Sugarland','Houston','Stafford')),
	CONSTRAINT fk_PrjDnum FOREIGN KEY (fnkDnum) REFERENCES tblDepartment(pmkDnumber),
	PRIMARY KEY(pmkPnumber)
)
CLUSTER clsDepartment (fnkDnum);
commit;
-- ii. Create an index on the clustering key (i.e., dnumber). Well, there are only a handfulof tuples, so it’s an overkill to create an index here, but let’s do it anyway for the sake of experiencing it. Commit after creating the index.
CREATE INDEX idxDepartment ON CLUSTER clsDepartment;
commit;
-- iii. Insert the tuples shown in the textbook Figure 3.6 (page 72) into the clustered tables. Insert null for the column mgrssn of the Department table, since the table Employee is omitted in this exercise. You can use insert_tuples_dept_locs_projs.sql as is.(Specifically, include the command “start insert_tuples_dept_locs_projs.sql” in the input script.)
start tblFill.sql;

-- iv. Execute the following queries against the clustered tables: (1) retrieve tuples from each clustered table (i.e., Department, Dept_locations, Project),  Note that, although the files of the three tables have been merged into one, we still see them as separate tables at the logical level.
SELECT * FROM tblDepartment;
SELECT * FROM tblDeptLocation;
SELECT * FROM tblProject;
-- (2) retrieve the location and the project (name) of a department named ‘Administration’.
SELECT tblProject.fldPname, tblProject.fldPlocation 
	FROM tblProject 
	JOIN tblDepartment 
	ON tblProject.fnkDnum = tblDepartment.pmkDnumber 
	WHERE tblDepartment.fldDname = 'Administration';

-- v. Drop the index, clustered tables, and the cluster. Commit after dropping them all.
DROP INDEX idxDepartment;
DROP TABLE tblDepartment CASCADE CONSTRAINTS;
DROP TABLE tblDeptLocations CASCADE CONSTRAINTS;
DROP TABLE tblProject CASCADE CONSTRAINTS;
DROP CLUSTER clsDepartment;
commit;
