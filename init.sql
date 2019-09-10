-- setup line
SET TERMOUT OFF;

SET LONG 32;
SET PAGESIZE 50000;

-- set vim as default editor
DEFINE _EDITOR=vim

-- setup line width to terminal screen width
HOST echo "SET LINESIZE $(./termwidth.sh)" > .tmp.sql;
@.tmp.sql;
HOST rm .tmp.sql;

-- change data format to common readable format
ALTER SESSION SET NLS_DATE_FORMAT = 'yyyy-mm-dd hh24:mi:ss';

SET TERMOUT ON;
