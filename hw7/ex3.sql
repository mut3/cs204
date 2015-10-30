SELECT fldFname, fldLname FROM tblEmployee WHERE fnkSuperSsn = (SELECT pmkSsn FROM tblEmployee WHERE tblEmployee.fldFname = 'Franklin' AND tblEmployee.fldLname = 'Wong');

-- d. For each project, list the project name and the total hours per week (by all employees) spent on that project.
SELECT fldPname, SUM(fldHours) FROM tblProject JOIN tblWorksOn ON tblProject.pmkPnumber = tblWorksOn.fnkPno GROUP BY fldPname;

-- e. Retrieve the names of all employees who work on every project.
-- first insert the information that Franklin Wong (ssn = 333445555) is working on two additional projects with pnumber 1 and 30 (hours unknown), respectively
INSERT INTO tblWorksOn VALUES (333445555, 1, NULL);
INSERT INTO tblWorksOn VALUES (333445555, 30, NULL);

-- create subtable ESSN|count( projects for ESSN)

SELECT fldFname, fldLname FROM tblEmployee JOIN (SELECT tblWorksOn.fnkEssn AS refSsn, COUNT(tblWorksOn.fnkPno) AS projCount FROM tblWorksOn GROUP BY tblWorksOn.fnkEssn) ON refSsn = tblEmployee.pmkSsn WHERE projCount = (SELECT COUNT(DISTINCT pmkPnumber) FROM tblProject);

-- delete the information added in the first step
DELETE FROM tblWorksOn WHERE fnkEssn = 333445555 AND fnkPno IN (1,30);

-- f. Retrieve the names of all employees who do not work on any project.
DELETE FROM tblWorksOn WHERE fnkEssn = 888665555 AND fnkPno = 20;

SELECT fldFname, fldLname FROM tblEmployee WHERE pmkSsn NOT IN (SELECT DISTINCT fnkEssn FROM tblWorksOn);

INSERT INTO tblWorksOn VALUES (888665555, 20, null);

-- g. For each department, retrieve the department name and the average salary of all employees working in that department.
SELECT tblDepartment.fldDname, avgSal FROM tblDepartment JOIN (SELECT tblEmployee.fnkDno AS refDno, AVG(fldSalary) AS avgSal FROM tblEmployee GROUP BY tblEmployee.fnkDno) ON tblDepartment.pmkDnumber = refDno;

-- h. Retrieve the average salary of all female employees.
SELECT AVG(fldSalary) FROM tblEmployee WHERE fldSex='F';

-- i. Find the names and addresses of all employees who work on at least one project located in Houston but whose department has no location in Houston.
SELECT fldFname, fldLname, fldAddress FROM tblEmployee JOIN tblWorksOn ON tblEmployee.pmkSsn = tblWorksOn.fnkEssn JOIN tblProject ON tblWorksOn.fnkPno = tblProject.pmkPnumber WHERE tblProject.fldPlocation = 'Houston' AND tblEmployee.fnkDno NOT IN (SELECT DISTINCT tblDeptLocations.fnkDnumber FROM tblDeptLocations WHERE tblDeptLocations.fldDlocation = 'Houston');

-- j. List the last names of all department managers who have no dependents
SELECT fldLname FROM tblEmployee WHERE pmkSsn NOT IN (SELECT DISTINCT fnkEssn FROM tblDependent) AND pmkSsn IN (SELECT DISTINCT fnkMgrSsn FROM tblDepartment);

