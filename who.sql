set linesize 255;
set pagesize 50000;
set feedback off;
set tab off;
set termout off;
alter session set nls_date_format = 'yyyy-mm-dd hh24:mi:ss';
set termout on;

ttitle left 'list of user sessions' skip 1 line;
-- column logintype format a10 heading 'type';
column col01 heading 'login time';
column col02 format a12 heading 'user' truncate;
column col03 format a12 heading 'schema' truncate;
column col04 format a12 heading 'sid';
column col05 format a32 heading 'user@hostname';
column col06 format a24 heading 'program' truncate;
-- column status format a8 heading 'status' truncate;
-- column state format a8 heading 'state' truncate;

select
  t1.logon_time as col01,
  t1.username as col02,
  t1.schemaname as col03,
  t1.service_name as col04,
  t1.osuser || '@' || t1.machine as col05,
  -- t1.status as status,
  -- t1.state as state,
  t1.program as col06
  from v$session t1
 where lower(t1.type) = 'user'
 order by col01 desc, col02;
