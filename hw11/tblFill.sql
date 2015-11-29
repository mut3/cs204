//* Textbook Company database (Figure 3.6)
 * Insert statements listed in the alphabetical order of table 
 * names. Modify this order before inserting the tuples into the 
 * tables. Make any additional necessary modifications.
 */

INSERT INTO tblDepartment VALUES ('Research', 5, NULL, '22-May-78'); 
INSERT INTO tblDepartment VALUES ('Administration', 4, NULL, '01-Jan-85');
INSERT INTO tblDepartment VALUES ('Headquarters', 1, NULL, '19-Jun-71'); 

INSERT INTO tblDeptLocation VALUES (1, 'Houston');
INSERT INTO tblDeptLocation VALUES (4, 'Stafford');
INSERT INTO tblDeptLocation VALUES (5, 'Bellaire');
INSERT INTO tblDeptLocation VALUES (5, 'Sugarland');
INSERT INTO tblDeptLocation VALUES (5, 'Houston');

INSERT INTO tblProject VALUES ('ProductX', 1, 'Bellaire', 5);
INSERT INTO tblProject VALUES ('ProductY', 2, 'Sugarland', 5);
INSERT INTO tblProject VALUES ('ProductZ', 3, 'Houston', 5);
INSERT INTO tblProject VALUES ('Computerization', 10, 'Stafford', 4);
INSERT INTO tblProject VALUES ('Reorganization', 20, 'Houston', 1);
INSERT INTO tblProject VALUES ('Newbenefits', 30, 'Stafford', 4);

commit;