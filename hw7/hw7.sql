DROP TABLE IF EXISTS tblEmployee, tblDepartment, tblDeptLocations, tblProject, tblWorksOn, tblDependent;

CREATE TABLE IF NOT EXISTS tblEmployee
(
	fldFname data_type(size) constraint_name,
	fldMinit data_type(size) constraint_name,
	fldLname data_type(size) constraint_name,
	pmkSsn data_type(size) constraint_name,
	fldBdate data_type(size) constraint_name,
	fldAddress data_type(size) constraint_name,
	fldSex data_type(size) constraint_name,
	fldSalary data_type(size) constraint_name,
	fnkSuperSsn data_type(size) constraint_name,
	fnkDno data_type(size) constraint_name,
	PRIMARY KEY(pmkSsn)
);

CREATE TABLE IF NOT EXISTS tblDepartment
(
	fldDname data_type(size) constraint_name,
	pmkDnumber data_type(size) constraint_name,
	fnkMgrSsn data_type(size) constraint_name,
	fldMgrStartDate data_type(size) constraint_name,
	PRIMARY KEY(pmkDnumber)
);

CREATE TABLE IF NOT EXISTS tblDeptLocations
(
	fnkDnumber data_type(size) constraint_name,
	fldDlocation data_type(size) constraint_name,
	PRIMARY KEY(fnkDnumber, fldDlocation)
);

CREATE TABLE IF NOT EXISTS tblProject
(
	fldPname data_type(size) constraint_name,
	pmkPnumber data_type(size) constraint_name,
	fldPlocation data_type(size) constraint_name,
	fnkDnum data_type(size) constraint_name,
	PRIMARY KEY(pmkPnumber)
);

CREATE TABLE IF NOT EXISTS tblWorksOn
(
	fnkEssn data_type(size) constraint_name,
	fnkPno data_type(size) constraint_name,
	fldHours data_type(size) constraint_name,
	PRIMARY KEY(fnkEssn, fnkPno)
);

CREATE TABLE IF NOT EXISTS tblEmployee
(
	fnkEssn data_type(size) constraint_name,
	fldDependentName data_type(size) constraint_name,
	fldSex data_type(size) constraint_name,
	fldBdate data_type(size) constraint_name,
	fldRelationship data_type(size) constraint_name,
	PRIMARY KEY(fnkEssn, fldDependentName)
);