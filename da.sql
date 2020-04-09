@preaction;
ttitle left 'List of User Tables' skip 1 line;
column tspname format a20 heading 'Tablespace';
column tabname format a32 heading 'Table';
column tabcmt  format a80 heading 'Comments' truncate;

select
  t1.tablespace_name as tspname,
  t1.table_name as tabname,
  -- t1.status as table_status,
  replace(replace(t2.comments, chr(13), ''), chr(10), '\n') as tabcmt
from
  all_tables t1
  left join user_tab_comments t2 on t1.table_name = t2.table_name
order by tspname, tabname;
