@preaction;
ttitle left 'List of User Tables' skip 1 line;
column tablespace_name format a20 heading 'Table Space Name';
column table_name format a32 heading 'Table Name';
column table_comments format a80 heading 'Comments' truncate;

-- select max(length(table_name)) from user_tables;
-- select max(length(comments)) from user_tab_comments;

select
  -- a.tablespace_name as tablespace_name,
  a.table_name as table_name,
  replace(replace(b.comments, chr(13), ''), chr(10), '_rn_') as table_comments
from
  user_tables a,
  User_tab_comments b
where
  a.table_name = b.table_name
order by
  table_name;
