-- setup line
HOST echo "SET LINESIZE $(./termwidth.sh)" > .tmp.sql;
@.tmp.sql;
HOST rm .tmp.sql;
ALTER SESSION SET nls_date_format = 'yyyy-mm-dd hh24:mi:ss';
