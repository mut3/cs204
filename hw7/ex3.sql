SELECT * FROM tbleEmployee WHERE fldSuperSsn = (SELECT pmkSsn FROM tbleEmployee WHERE fldFname="Franklin" AND fldLname="Wong");

-- d. For each project, list the project name and the total hours per week (by all employees) spent on that project.
-- e. Retrieve the names of all employees who work on every project.
-- f. Retrieve the names of all employees who do not work on any project.
-- g. For each department, retrieve the department name and the average
-- salary of all employees working in that department.
-- h. Retrieve the average salary of all female employees.
-- i. Find the names and addresses of all employees who work on at least one project located in Houston but whose department has no location in Houston.
-- j. List the last names of all department managers who have no dependents