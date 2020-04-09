@preaction;
ttitle left 'List of User Tables' skip 1 line;
column tablespace_name format a20 heading 'Tablespace';
column table_name      format a32 heading 'Table';
column table_status    format a16 heading 'Status';
column table_comments  format a80 heading 'Comments' truncate;

select
  t1.tablespace_name as tablespace_name,
  t1.table_name as table_name,
  -- t1.status as table_status,
  replace(replace(t2.comments, chr(13), ''), chr(10), '\n') as table_comments
from
  all_tables t1
  left join user_tab_comments t2 on t1.table_name = t2.table_name
order by tablespace_name, table_name;
