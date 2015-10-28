DROP TABLE IF EXISTS tblEmployee, tblDepartment, tblDeptLocations, tblProject, tblWorksOn, tblDependent;

CREATE TABLE tblEmployee
(
	fldFname varchar(255),
	fldMinit varchar(1),
	fldLname varchar(255),
	pmkSsn int(9) NOT NULL,
	fldBdate varchar(255),
	fldAddress varchar(255),
	fldSex varchar(255),
	fldSalary varchar(255),
	fnkSuperSsn int(9),
	fnkDno varchar(255),
	CONSTRAINT chk_EmployeeSex CHECK (fldSex='M' OR fldSex='F'),
	CONSTRAINT chk_EmployeeSalary CHECK (fldSalary > 20000),
	CONSTRAINT fk_EmpDno FOREIGN KEY (fnkDno) REFERENCES tblDepartment(pmkDnumber),
	PRIMARY KEY(pmkSsn)
);

CREATE TABLE tblDepartment
(
	fldDname varchar(255),
	pmkDnumber varchar(255) NOT NULL,
	fnkMgrSsn varchar(255),
	fldMgrStartDate varchar(255),
	CONSTRAINT fk_DeptMgrSsn FOREIGN KEY (fnkMgrSsn) REFERENCES tblEmployee(pmkSsn),
	PRIMARY KEY(pmkDnumber)
);

CREATE TABLE tblDeptLocations
(
	fnkDnumber varchar(255) NOT NULL,
	fldDlocation varchar(255) NOT NULL,
	CONSTRAINT fk_DeptLocDnumber FOREIGN KEY (fnkDnumber) REFERENCES tblDepartment(pmkDnumber),
	PRIMARY KEY(fnkDnumber, fldDlocation)
);

CREATE TABLE tblProject
(
	fldPname varchar(255),
	pmkPnumber varchar(255) NOT NULL,
	fldPlocation varchar(255),
	fnkDnum varchar(255),
	CONSTRAINT chk_ProjLocation CHECK (fldPlocation='Bellaire' OR fldPlocation='Sugarland' OR fldPlocation='Houston' OR fldPlocation='Stafford'),
	CONSTRAINT fk_PrjDnum FOREIGN KEY (fnkDnum) REFERENCES tblDepartment(pmkDnumber),
	PRIMARY KEY(pmkPnumber)
);

CREATE TABLE tblWorksOn
(
	fnkEssn varchar(255) NOT NULL,
	fnkPno varchar(255) NOT NULL,
	fldHours varchar(255),
	CONSTRAINT chk_WorksOn_Hours CHECK (fldHours >= 5 AND fldHours <= 40),
	CONSTRAINT fk_WksEssn FOREIGN KEY (fnkEssn) REFERENCES tblEmployee(pmkSsn),
	CONSTRAINT fk_WksPno FOREIGN KEY (fnkPno) REFERENCES tblProject(pmkPnumber),
	PRIMARY KEY(fnkEssn, fnkPno)
);

CREATE TABLE tblDependent
(
	fnkEssn int(9) NOT NULL,
	fldDependentName varchar(255) NOT NULL,
	fldSex char(1),
	fldBdate varchar(255),
	fldRelationship varchar(255),
	CONSTRAINT fk_DepnEssn FOREIGN KEY (fnkEssn) REFERENCES tblEmployee(pmkSsn),
	PRIMARY KEY(fnkEssn, fldDependentName)
);

ALTER TABLE tblEmployee ADD CONSTRAINT fk_EmpSuperSsn FOREIGN KEY (fnkSuperSsn) REFERENCES tblEmployee(pmkSsn);

