-- A script file for executing an SQL script file.
-- Usage: 'runscript foo' to execute an input file foo.sql
--       An output file foo.out will be created, which shows both
--       the input statements and their outputs.

-- Check is the input script file exists by executing UNIX "ls"
host ls &&1..sql

-- Override some of the default options of sqlplus. --

  -- Do not display the terminal output generated by commands in a
  -- command file.
set termout off

  -- Do not list the text of an SQL statement or PL/SQL command before
  -- and after replacing sustitution variables with values.
set verify off

  -- Echo the input statements in the output.
set echo on

  -- Turn on serveroutput for using dbms_output.
set serveroutput on

  -- Dump the output to the script file with an extension 'out'.
spool &&1..out

-- Execute the script file. --
start &&1

-- Restore the options to their default values. --
spool off
set serveroutput off
set echo off
set verify on
set termout on
