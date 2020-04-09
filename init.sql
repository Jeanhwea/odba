-- setup line
set termout off;

set long 32;
set pagesize 50000;

-- set vim as default editor
define _editor=vim

-- setup line width to terminal screen width
host echo "set linesize $(./termwidth.sh)" > .tmp.sql;
@.tmp.sql;
host rm .tmp.sql;

-- change data format to common readable format
alter session set nls_date_format = 'yyyy-mm-dd hh24:mi:ss';

set termout on;
