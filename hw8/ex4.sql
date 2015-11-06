-- 1) Creates a function 'deptavgsal' which takes a department number and returns the average salary of all employees in the department. If the input department number is missing, the function should return -1, and if invalid, return -2.
CREATE OR REPLACE FUNCTION deptavgsal
(Dno IN INT DEFAULT NULL)
RETURN number
AS
retVal number;
deptNum INT;
CURSOR c_avg_sal IS
	SELECT fnkDno, AVG (fldSalary)
	FROM tblEmployee
	WHERE fnkDno = Dno
	GROUP BY fnkDno;
BEGIN
   	IF (Dno IS NOT NULL) THEN
        OPEN c_avg_sal;
        FETCH c_avg_sal into deptNum, retVal;
        RETURN retVal;
        CLOSE c_avg_sal;
   	ELSE
        RETURN -1;
   	END IF;
END deptavgsal;
/ 
-- 2) Calls the function as a 'stand-alone' (i.e., without a base table) function, once with no department number, three times with an invalid number (specifically, 2, 3, and 6), three times with a valid number (specifically, 1, 4, and 5). If a function is to be called stand-alone, then the system dummy table DUAL may be used instead. (Run 'select * from DUAL;' to see what’s in the table DUAL.
SELECT deptavgsal(2) FROM DUAL;
SELECT deptavgsal(3) FROM DUAL;
SELECT deptavgsal(6) FROM DUAL;

SELECT deptavgsal(1) FROM DUAL;
SELECT deptavgsal(4) FROM DUAL;
SELECT deptavgsal(5) FROM DUAL;
-- 3) Calls the function inside a query statement to retrieve the name and the deptavgsal of all departments of which the deptavgsal is greater than 32000 and displays the result in the increasing order of department number.
SELECT pmkDnumber, fldName, deptavgsal(tblDepartment.pmkDnumber) 
FROM tblDepartment 
WHERE deptavgsal(tblDepartment.pmkDnumber) > 32000
ORDER BY pmkDnumber ASC;
-- 4) Drops the function
DROP FUNCTION deptavgsal;