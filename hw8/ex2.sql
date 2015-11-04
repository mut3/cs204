/* Textbook Exercise 5.9. 
 * For each of a, b, and c, execute not only the statement on the view but also an equivalent statement on the base table EMPLOYEE. 
 * For d and e, which do not work, execute each statement on the view and explain briefly why it does not work.
 */
CREATE VIEW DEPT_SUMMARY (D, C, Total_s, Average_s)
AS SELECT fnkDno, COUNT (*), SUM (fldSalary), AVG (fldSalary)
FROM tblEmployee
GROUP BY fnkDno;

-- a)
SELECT *
FROM DEPT_SUMMARY;
-- equiv
SELECT fnkDno, COUNT (*), SUM (fldSalary), AVG (fldSalary)
FROM tblEmployee
GROUP BY fnkDno;

-- b)
SELECT D, C
FROM DEPT_SUMMARY
WHERE TOTAL_S > 100000;
-- equiv
SELECT fnkDno, COUNT(*)
FROM tblEmployee
JOIN (
	SELECT fnkDno AS refDno, SUM (fldSalary) AS refSal
	FROM tblEmployee
	GROUP BY fnkDno
)
ON fnkDno = refDno
WHERE refSal > 100000
GROUP BY fnkDno;

-- c)
SELECT D, AVERAGE_S
FROM DEPT_SUMMARY
WHERE C > ( SELECT C FROM DEPT_SUMMARY WHERE D=4);
-- equiv
SELECT fnkDno, AVG (fldSalary)
FROM tblEmployee
JOIN (
	SELECT fnkDno AS refDno, COUNT(*) AS refCount
	FROM tblEmployee
	GROUP BY fnkDno
)
ON fnkDno = refDno
WHERE refCount > (SELECT COUNT(*) FROM tblEmployee WHERE fnkDno = 4)
GROUP BY fnkDno;

-- d)
UPDATE DEPT_SUMMARY
SET D=3
WHERE D=4;

-- e)
DELETE FROM DEPT_SUMMARY
WHERE C > 4;

/* E and D do not work because a view is not a full table and is just 
 * reading and aggregating other records. Views cannot update or delete
 * records as these respectivly try
 */

DROP VIEW DEPT_SUMMARY;
