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
	CLUSTER clsDepartment (pmkDnumber),
	PRIMARY KEY(pmkDnumber)
);

CREATE TABLE tblDeptLocations
(
	fnkDnumber varchar(255) NOT NULL,
	fldDlocation varchar(255) NOT NULL,
	CONSTRAINT fk_DeptLocDnumber FOREIGN KEY (fnkDnumber) REFERENCES tblDepartment(pmkDnumber),
	CLUSTER clsDepartment (fnkDnumber),
	PRIMARY KEY(fnkDnumber, fldDlocation)
);

CREATE TABLE tblProject
(
	fldPname varchar(255),
	pmkPnumber varchar(255) NOT NULL,
	fldPlocation varchar(255),
	fnkDnum varchar(255),
	CONSTRAINT chk_ProjLocation CHECK (fldPlocation IN ('Bellaire','Sugarland','Houston','Stafford')),
	CONSTRAINT fk_PrjDnum FOREIGN KEY (fnkDnum) REFERENCES tblDepartment(pmkDnumber),
	CLUSTER clsDepartment (fnkDnum),
	PRIMARY KEY(pmkPnumber)
);
commit;
-- ii. Create an index on the clustering key (i.e., dnumber). Well, there are only a handfulof tuples, so it’s an overkill to create an index here, but let’s do it anyway for the sake of experiencing it. Commit after creating the index.
CREATE INDEX idxDepartment ON CLUSTER clsDepartment;
commit;
-- iii. Insert the tuples shown in the textbook Figure 3.6 (page 72) into the clustered tables. Insert null for the column mgrssn of the Department table, since the table Employee is omitted in this exercise. You can use insert_tuples_dept_locs_projs.sql as is.(Specifically, include the command “start insert_tuples_dept_locs_projs.sql” in the input script.)
/* Textbook Company database (Figure 3.6)
 * Insert statements listed in the alphabetical order of table 
 * names. Modify this order before inserting the tuples into the 
 * tables. Make any additional necessary modifications.
 */

INSERT INTO tblDepartment VALUES ('Research', 5, NULL, '22-May-78'); 
INSERT INTO tblDepartment VALUES ('Administration', 4, NULL, '01-Jan-85');
INSERT INTO tblDepartment VALUES ('Headquarters', 1, NULL, '19-Jun-71'); 

INSERT INTO tblDeptLocations VALUES (1, 'Houston');
INSERT INTO tblDeptLocations VALUES (4, 'Stafford');
INSERT INTO tblDeptLocations VALUES (5, 'Bellaire');
INSERT INTO tblDeptLocations VALUES (5, 'Sugarland');
INSERT INTO tblDeptLocations VALUES (5, 'Houston');

INSERT INTO tblProject VALUES ('ProductX', 1, 'Bellaire', 5);
INSERT INTO tblProject VALUES ('ProductY', 2, 'Sugarland', 5);
INSERT INTO tblProject VALUES ('ProductZ', 3, 'Houston', 5);
INSERT INTO tblProject VALUES ('Computerization', 10, 'Stafford', 4);
INSERT INTO tblProject VALUES ('Reorganization', 20, 'Houston', 1);
INSERT INTO tblProject VALUES ('Newbenefits', 30, 'Stafford', 4);

commit;

-- iv. Execute the following queries against the clustered tables: (1) retrieve tuples from each clustered table (i.e., Department, Dept_locations, Project),  Note that, although the files of the three tables have been merged into one, we still see them as separate tables at the logical level.
SELECT * FROM tblDepartment;
SELECT * FROM tblDeptLocations;
SELECT * FROM tblProject;
-- (2) retrieve the location and the project (name) of a department named ‘Administration’.
SELECT tblProject.fldPname, tblProject.fldPlocation 
	FROM tblProject JOIN tblDepartment 
	ON tblProject.fnkDnum = tblDepartment.pmkDnumber 
	WHERE tblDepartment.fldDname = 'Administration';

-- v. Drop the index, clustered tables, and the cluster. Commit after dropping them all.
DROP INDEX idxDepartment;
DROP TABLE tblDepartment CASCADE CONSTRAINTS;
DROP TABLE tblDeptLocations CASCADE CONSTRAINTS;
DROP TABLE tblProject CASCADE CONSTRAINTS;
DROP CLUSTER clsDepartment;
commit;
