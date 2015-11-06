-- 1) Creates a procedure 'mytables' which takes a user name (i.e., Oracle login name) as the input and outputs the names of all tables created by the user,
CREATE OR REPLACE PROCEDURE mytables (userName IN VARCHAR2 DEFAULT NULL)
AS
--Variables EXCEPTION DEF
no_name_given EXCEPTION;
tableName VARCHAR2;
BEGIN
	IF (userName = NULL)
		RAISE no_name_given;
	ENDIF;
	SELECT username into name
	FROM all_users
	WHERE username = upper(userName);
	CURSOR c_user_tables IS
	  SELECT table_name FROM all_tables
	  WHERE owner = userName;
	
	OPEN c_user_tables;
   	LOOP
      FETCH c_user_tables into tableName;
      EXIT WHEN c_user_tables%notfound;
      dbms_output.put_line(tableName);
   	END LOOP;
   	CLOSE c_user_tables;

EXCEPTION
	WHEN no_name_given THEN
		dbms_output.put_line('Error: missing user name');
	WHEN no_data_found THEN
		dbms_output.put_line('Error: invalid user name');
	WHEN others THEN
		dbms_output.put_line('Error: Generic!');
END mytables;




-- 2) Executes the procedure three times, once without giving the user name, once with giving an invalid user name (e.g., ‘foobar’), and once with giving a valid user name (e.g., your name). When no user name is given, the procedure shall output a message 'Error: missing user name.' and when an invalid user name is given, 'Error: invalid user name.' Use error handlers for this. (Example codes of user-defined error handling can be found at http://www.tutorialspoint.com/plsql/plsql_exceptions.htm - see the section on User-Defined Exceptions).
DECLARE
	testName VARCHAR2;
BEGIN
	mytables();
	testName := 'foobar';
	mytables(testName);
	testName := 'wbarnwel';
	mytables(testName);
END;
/
-- 3) Drop the procedure.
DROP PROCEDURE mytables;