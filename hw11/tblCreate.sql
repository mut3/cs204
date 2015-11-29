CREATE TABLE tblDepartment
(
	fldDname varchar(255),
	pmkDnumber varchar(255) NOT NULL,
	fnkMgrSsn int,
	fldMgrStartDate varchar(255),
	CONSTRAINT fk_DeptMgrSsn FOREIGN KEY (fnkMgrSsn) REFERENCES tblEmployee(pmkSsn),
	PRIMARY KEY(pmkDnumber)
);

CREATE TABLE tblDeptLocation
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
	CONSTRAINT chk_ProjLocation CHECK (fldPlocation IN ('Bellaire','Sugarland','Houston','Stafford')),
	CONSTRAINT fk_PrjDnum FOREIGN KEY (fnkDnum) REFERENCES tblDepartment(pmkDnumber),
	PRIMARY KEY(pmkPnumber)
);
