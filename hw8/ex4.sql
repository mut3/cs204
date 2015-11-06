-- 1) Creates a function “deptavgsal” which takes a department number and returns the average salary of all employees in the department. If the input department number is missing, the function should return -1, and if invalid, return -2.
CREATE OR REPLACE FUNCTION deptavgsal
(Dno IN DEFAULT NULL)
RETURN number
AS
retVal number;
CURSOR c_avg_sal IS
	SELECT fnkDno, AVG (fldSalary) into retVal
	FROM tblEmployee
	WHERE fnkDno = Dno
	GROUP BY fnkDno;
BEGIN
   	IF (Dno IS NOT NULL) THEN
        OPEN c_avg_sal;
        FETCH c_avg_sal into retVal;
        RETURN retVal;
        CLOSE c_avg_sal;
   	ELSE
        RETURN -1;
   	END IF;
END deptavgsal; 
-- 2) Calls the function as a “stand-alone” (i.e., without a base table) function, once with no department number, three times with an invalid number (specifically, 2, 3, and 6), three times with a valid number (specifically, 1, 4, and 5). If a function is to be called stand-alone, then the system dummy table DUAL may be used instead. (Run “select * from DUAL;” to see what’s in the table DUAL. 
-- 3) Calls the function inside a query statement to retrieve the name and the deptavgsal of all departments of which the deptavgsal is greater than 32000 and displays the result in the increasing order of department number. 
-- 4) Drops the function