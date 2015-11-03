SELECT tblDepartment.fldDname, COUNT(DISTINCT tblEmployee.pmkSsn) FROM tblEmployee JOIN tblDepartment ON tblEmployee.fnkDno = tblDepartment.pmkDnumber JOIN (SELECT tblEmployee.fnkDno AS refDno, AVG(fldSalary) AS avgSal FROM tblEmployee GROUP BY tblEmployee.fnkDno) ON tblEmployee.fnkDno = refDno WHERE avgSal > 30000 AND tblEmployee.fldSex = 'M' GROUP BY tblDepartment.fldDname;