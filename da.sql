@preaction;
ttitle left 'List of User Tables' skip 1 line;
column tablespace_name format a20 heading 'Tablespace';
column table_name format a32 heading 'Table';
column table_status format a16 heading 'Status';
column table_comments format a80 heading 'Comments' truncate;

select
  a.tablespace_name as tablespace_name,
  a.table_name as table_name,
  -- a.status as table_status,
  replace(replace(b.comments, chr(13), ''), chr(10), '\n') as table_comments
from
  all_tables a
  left join user_tab_comments b on a.table_name = b.table_name
order by
  tablespace_name,
  table_name;
