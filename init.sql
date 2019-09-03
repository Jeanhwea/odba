-- setup line
SET TERMOUT OFF;

SET LONG 50000;
SET PAGESIZE 50000;

-- setup line width to terminal screen width
HOST echo "SET LINESIZE $(./termwidth.sh)" > .tmp.sql;
@.tmp.sql;
HOST rm .tmp.sql;

-- change data format to common readable format
ALTER SESSION SET nls_date_format = 'yyyy-mm-dd hh24:mi:ss';

SET TERMOUT ON;
