DROP TABLE IF EXISTS tblEmployee, tblDepartment, tblDeptLocations, tblProject, tblWorksOn, tblDependent;

CREATE TABLE IF NOT EXISTS tblEmployee
(
	fldFname varchar(255),
	fldMinit varchar(255),
	fldLname varchar(255),
	pmkSsn varchar(255) NOT NULL,
	fldBdate varchar(255),
	fldAddress varchar(255),
	fldSex varchar(255),
	fldSalary varchar(255),
	fnkSuperSsn varchar(255),
	fnkDno varchar(255),
	CONSTRAINT chk_EmployeeSex CHECK (fldSex='M' OR fldSex='F'),
	CONSTRAINT chk_EmployeeSalary CHECK (fldSalary > 20000),
	PRIMARY KEY(pmkSsn)
);

CREATE TABLE IF NOT EXISTS tblDepartment
(
	fldDname varchar(255),
	pmkDnumber varchar(255) NOT NULL,
	fnkMgrSsn varchar(255),
	fldMgrStartDate varchar(255),
	PRIMARY KEY(pmkDnumber)
);

CREATE TABLE IF NOT EXISTS tblDeptLocations
(
	fnkDnumber varchar(255) NOT NULL,
	fldDlocation varchar(255) NOT NULL,
	PRIMARY KEY(fnkDnumber, fldDlocation)
);

CREATE TABLE IF NOT EXISTS tblProject
(
	fldPname varchar(255),
	pmkPnumber varchar(255) NOT NULL,
	fldPlocation varchar(255),
	fnkDnum varchar(255),
	CONSTRAINT chk_ProjLocation CHECK (fldPlocation='Bellaire' OR fldPlocation='Sugarland' OR fldPlocation='Houston' OR fldPlocation='Stafford'),
	PRIMARY KEY(pmkPnumber)
);

CREATE TABLE IF NOT EXISTS tblWorksOn
(
	fnkEssn varchar(255) NOT NULL,
	fnkPno varchar(255) NOT NULL,
	fldHours varchar(255),
	CONSTRAINT chk_WorksOn_Hours CHECK (fldHours >= 5 AND fldHours <= 40),
	PRIMARY KEY(fnkEssn, fnkPno)
);

CREATE TABLE IF NOT EXISTS tblDependent
(
	fnkEssn varchar(255) NOT NULL,
	fldDependentName varchar(255) NOT NULL,
	fldSex varchar(255),
	fldBdate varchar(255),
	fldRelationship varchar(255),
	PRIMARY KEY(fnkEssn, fldDependentName)
);

ALTER TABLE Orders
ADD CONSTRAINT fk_PerOrders
FOREIGN KEY (P_Id)
REFERENCES Persons(P_Id)

