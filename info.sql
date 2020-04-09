set linesize 255;
set pagesize 50000;
set feedback off;
set tab off;

ttitle left 'database server information' skip 1 line;
column col01 format a26 heading 'host';
column col02 format a16 heading 'ip';
column col03 format a14 heading 'db/session';
column col04 format a10 heading 'sid';

select
  utl_inaddr.get_host_name as col01,
  utl_inaddr.get_host_address as col02,
  dbtimezone || '/' || sessiontimezone as col03,
  (select name from v$database) as col04
  from dual;
