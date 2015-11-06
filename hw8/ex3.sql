-- 1) Creates a procedure 'mytables' which takes a user name (i.e., Oracle login name) as the input and outputs the names of all tables created by the user,
CREATE OR REPLACE PROCEDURE mytables (userName IN VARCHAR2 DEFAULT NULL)
AS
--Variables EXCEPTION DEF
no_name_given EXCEPTION;
tableName all_tables.table_name%type;
name all_users.username%type;
BEGIN
    dbms_output.put_line('1. userName: '|| userName);
    IF (userName IS NULL) THEN
        RAISE no_name_given;
    END IF;
    dbms_output.put_line('2.');
    
    DECLARE
        CURSOR c_user_tables IS
            SELECT table_name into tableName
            FROM all_tables
            WHERE owner = upper(userName);
        CURSOR c_user_name IS
            SELECT username into name
            FROM all_users
            WHERE username=upper(userName);
    BEGIN
        dbms_output.put_line('3.');
        OPEN c_user_name;
        FETCH c_user_name into name;
        IF (c_user_name%notfound) THEN 
            RAISE no_data_found; 
        END IF;
        dbms_output.put_line('4.');
        CLOSE c_user_name;
        OPEN c_user_tables;
        LOOP
          FETCH c_user_tables into tableName;
          dbms_output.put_line('4a.');
          EXIT WHEN c_user_tables%notfound;
          dbms_output.put_line('4b.');
          dbms_output.put_line(tableName);
        END LOOP;
        CLOSE c_user_tables;
        dbms_output.put_line('5.');
    EXCEPTION
        WHEN others THEN
            dbms_output.put_line('Error: Gensdfghjeric!');
    END;
EXCEPTION
    WHEN no_name_given THEN
        dbms_output.put_line('Error: missing user name');
    WHEN no_data_found THEN
        dbms_output.put_line('Error: invalid user name');
    WHEN others THEN
        dbms_output.put_line('Error: Generic!');
END mytables;
/

-- 2) Executes the procedure three times, once without giving the user name, once with giving an invalid user name (e.g., ‘foobar’), and once with giving a valid user name (e.g., your name). When no user name is given, the procedure shall output a message 'Error: missing user name.' and when an invalid user name is given, 'Error: invalid user name.' Use error handlers for this. (Example codes of user-defined error handling can be found at http://www.tutorialspoint.com/plsql/plsql_exceptions.htm - see the section on User-Defined Exceptions).
exec mytables();
exec mytables('foobar');
exec mytables('wbarnwel');

-- 3) Drop the procedure.
DROP PROCEDURE mytables;