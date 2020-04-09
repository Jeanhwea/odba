set linesize 255;
set pagesize 50000;
set feedback off;
set tab off;

ttitle left 'List of User Tablespaces' skip 1 line;
column tspname format a25 heading 'Tablespace';
column tspsize format a10 heading 'Total';
column tspubts format a10 heading 'User Size';
column tspmbts format a10 heading 'Max Size';
column tspfree format a10 heading 'Free';
column tspext  format a8 heading 'Extent?';
column tspfile format a80 heading 'Datafile';

-- desc user_tablespaces

select
  t1.tablespace_name as tspname,
  (
    select to_char(sum(t2.bytes)/1024/1024, '99999.99') || 'M'
      from dba_data_files t2
     where t1.tablespace_name = t2.tablespace_name
  ) as tspsize,
  (
    select to_char(sum(t3.bytes)/1024/1024, '99999.99') || 'M'
      from dba_free_space t3
     where t1.tablespace_name = t3.tablespace_name
  ) as tspfree,
  (
    select lpad(t4.autoextensible, 6, ' ')
      from dba_data_files t4
     where t1.tablespace_name = t4.tablespace_name
  ) as tspext,
  (
    select t5.file_name
      from dba_data_files t5
     where t1.tablespace_name = t5.tablespace_name
  ) as tspfile
  from user_tablespaces t1
 where lower(t1.allocation_type) = 'system'
 group by t1.tablespace_name
 order by tspname;
