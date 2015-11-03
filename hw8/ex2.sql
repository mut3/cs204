/* Textbook Exercise 5.9. 
 * For each of a, b, and c, execute not only the statement on the view but also an equivalent statement on the base table EMPLOYEE. 
 * For d and e, which do not work, execute each statement on the view and explain briefly why it does not work.
 */
CREATE VIEW DEPT_SUMMARY (D, C, Total_s, Average_s)
AS SELECT fnkDno, COUNT (*), SUM (fldSalary), AVG (fldSalary)
FROM tblEmployee
GROUP BY fnkDno;

