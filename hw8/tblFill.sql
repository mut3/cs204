/* Textbook Company database (Figure 3.6)
 * Insert statements listed in the alphabetical order of table 
 * names. Modify this order before inserting the tuples into the 
 * tables. Make any additional necessary modifications.
 */
ALTER TABLE tblEmployee DROP CONSTRAINT fk_EmpDno;

INSERT INTO tblEmployee VALUES ('James', 'E', 'Borg', 888665555, '10-Nov-27', '450 Stone, Houston, TX', 'M', 55000, null, 1);
INSERT INTO tblEmployee VALUES ('Jennifer', 'S', 'Wallace', 987654321, '20-Jun-31', '291 Berry, Bellaire, TX', 'F', 43000, 888665555, 4);
INSERT INTO tblEmployee VALUES ('Ahmad', 'V', 'Jabbar', 987987987, '29-Mar-59', '980 Dallas, Houston, TX', 'M', 25000, 987654321, 4);
INSERT INTO tblEmployee VALUES ('Alicia', 'J', 'Zelaya', 999887777, '19-Jul-58', '3321 Castle, Spring, TX', 'F', 25000, 987654321, 4);
INSERT INTO tblEmployee VALUES ('Franklin', 'T', 'Wong', 333445555, '08-Dec-45', '638 Voss, Houston, TX', 'M', 40000, 888665555, 5);
INSERT INTO tblEmployee VALUES ('Joyce', 'A', 'English', 453453453, '31-Jul-62', '5631 Rice, Houston, TX', 'F', 25000, 333445555, 5);
INSERT INTO tblEmployee VALUES ('Ramesh', 'K', 'Narayan', 666884444, '15-Sep-52', '975 Fire Oak, Humble, TX', 'M', 38000, 333445555, 5);  
INSERT INTO tblEmployee VALUES ('John', 'B', 'Smith', 123456789, '09-Jan-55', '731 Fondren, Houston, TX', 'M', 30000, 333445555, 5);

INSERT INTO tblDepartment VALUES ('Research', 5, 333445555, '22-May-78'); 
INSERT INTO tblDepartment VALUES ('Administration', 4, 987654321, '01-Jan-85');
INSERT INTO tblDepartment VALUES ('Headquarters', 1, 888665555, '19-Jun-71'); 

INSERT INTO tblDependent VALUES (333445555, 'Alice', 'F', '05-Apr-76', 'Daughter');
INSERT INTO tblDependent VALUES (333445555, 'Theodore', 'M', '25-Oct-73', 'Son');
INSERT INTO tblDependent VALUES (333445555, 'Joy', 'F', '03-May-48', 'Spouse');
INSERT INTO tblDependent VALUES (987654321, 'Abner', 'M', '29-Feb-32', 'Spouse');
INSERT INTO tblDependent VALUES (123456789, 'Michael', 'M', '01-Jan-78', 'Son');
INSERT INTO tblDependent VALUES (123456789, 'Alice', 'F', '31-Dec-78', 'Daughter');
INSERT INTO tblDependent VALUES (123456789, 'Elizabeth', 'F', '05-May-57', 'Spouse');

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

INSERT INTO tblWorksOn VALUES (123456789, 1, 32.5);
INSERT INTO tblWorksOn VALUES (123456789, 2, 7.5);
INSERT INTO tblWorksOn VALUES (666884444, 3, 40.0);
INSERT INTO tblWorksOn VALUES (453453453, 1, 20.0);
INSERT INTO tblWorksOn VALUES (453453453, 2, 20.0);
INSERT INTO tblWorksOn VALUES (333445555, 2, 10.0);
INSERT INTO tblWorksOn VALUES (333445555, 3, 10.0);
INSERT INTO tblWorksOn VALUES (333445555, 10, 10.0);
INSERT INTO tblWorksOn VALUES (333445555, 20, 10.0);
INSERT INTO tblWorksOn VALUES (999887777, 30, 30.0);
INSERT INTO tblWorksOn VALUES (999887777, 10, 10.0);
INSERT INTO tblWorksOn VALUES (987987987, 10, 35.0);
INSERT INTO tblWorksOn VALUES (987987987, 30, 5.0);
INSERT INTO tblWorksOn VALUES (987654321, 30, 20.0);
INSERT INTO tblWorksOn VALUES (987654321, 20, 15.0);
INSERT INTO tblWorksOn VALUES (888665555, 20, null);



commit;

ALTER TABLE tblEmployee ADD CONSTRAINT fk_EmpDno FOREIGN KEY (fnkDno) REFERENCES tblDepartment(pmkDnumber);

