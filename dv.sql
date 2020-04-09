set linesize 255;
set pagesize 50000;
set feedback off;
set tab off;

ttitle left 'List of User Views' skip 1 line;
column vewname format a32 heading 'View';
column vewcmt  format a80 heading 'Comments' truncate;

select
  t1.view_name as vewname,
  replace(replace(t2.comments, chr(13), ''), chr(10), '\n') as vewcmt
from
  user_views t1
  left join user_tab_comments t2 on t1.view_name = t2.table_name
order by
  vewname;
