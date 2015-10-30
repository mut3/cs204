-- a) A department must have at least one employee. Note: Insert a tuple whose dnumber equals 6 before checking this constraint. All the other columns may be null. Make sure to roll back the insertion after checking the constraint. (In order to rollback, include “rollback;” at the end.)
INSERT INTO tblDepartment VALUES ('BTTF Remembrance', 6, 333445555, '21-October-2015');

SELECT * FROM tblDepartment WHERE tblDepartment.pmkDnumber NOT IN (SELECT DISTINCT fnkDno FROM tblEmployee);

rollback;

-- b) An employee with two or more dependents must receive a minimum salary of $35000.

SELECT fldFname, fldLname, depCount, fldSalary FROM tblEmployee JOIN (SELECT fnkEssn AS refSsn, COUNT(DISTINCT fldDependentname) AS depCount FROM tblDependent GROUP BY fnkEssn) ON pmkSsn = refSsn WHERE depCount >= 2 AND fldSalary < 35000;

-- c) An employee must work on projects for a total of at least 37.5 hours per week.

SELECT fldFname, fldLname, hourCount FROM tblEmployee JOIN (SELECT fnkEssn AS refSsn, SUM(fldHours) AS hourCount FROM tblWorksOn GROUP BY fnkEssn) ON pmkSsn = refSsn WHERE hourCount < 37.5;
