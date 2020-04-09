@preaction;
ttitle left 'List of User Tables' skip 1 line;
column tspname format a20 heading 'Tablespace';
column tabname format a32 heading 'Table';
column tabcmt  format a80 heading 'Comments' truncate;

-- select max(length(table_name)) from user_tables;
-- select max(length(comments)) from user_tab_comments;

select
  -- t1.tablespace_name as tspname,
  t1.table_name as tabname,
  replace(replace(t2.comments, chr(13), ''), chr(10), '_rn_') as tabcmt
from
  user_tables t1, user_tab_comments t2
where
  t1.table_name = t2.table_name
order by
  tabname;
