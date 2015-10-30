SELECT * FROM tblEmployee WHERE fnkSuperSsn = (SELECT pmkSsn FROM tblEmployee WHERE tblEmployee.fldFname = 'Franklin' AND tblEmployee.fldLname = 'Wong');

-- d. For each project, list the project name and the total hours per week (by all employees) spent on that project.
SELECT fldPname, SUM(fldHours) FROM tblProject JOIN tblWorksOn ON tblProject.pmkPnumber = tblWorksOn.fnkPno GROUP BY fldPname;

-- e. Retrieve the names of all employees who work on every project.
-- first insert the information that Franklin Wong (ssn = 333445555) is working on two additional projects with pnumber 1 and 30 (hours unknown), respectively
INSERT INTO tblWorksOn VALUES (333445555, 1, NULL);
INSERT INTO tblWorksOn VALUES (333445555, 30, NULL);

-- create subtable ESSN|count( projects for ESSN)

SELECT fldFname, fldLname FROM tblEmployee JOIN tblWorksOn ON tblEmployee.pmkSsn = tblWorksOn.fnkEssn WHERE (SELECT tblWorksOn.fnkEssn AS 'subSsn', COUNT(tblWorksOn.fnkPno) FROM tblWorksOn GROUP BY subSsn);

-- delete the information added in the first step
DELETE FROM tblWorksOn WHERE fnkEssn = 333445555 AND fnkPno IN (1,30);

-- f. Retrieve the names of all employees who do not work on any project.

SELECT fldFname, fldLname FROM tblEmployee WHERE pmkSsn NOT IN (SELECT DISTINCT fnkEssn FROM tblWorksOn);

-- g. For each department, retrieve the department name and the average
-- salary of all employees working in that department.
-- h. Retrieve the average salary of all female employees.
-- i. Find the names and addresses of all employees who work on at least one project located in Houston but whose department has no location in Houston.
-- j. List the last names of all department managers who have no dependents
SELECT fldLname FROM tblEmployee WHERE pmkSsn NOT IN (SELECT DISTINCT fnkEssn FROM tblDependent) AND pmkSsn IN (SELECT DISTINCT fnkMgrSsn FROM tblDepartment);