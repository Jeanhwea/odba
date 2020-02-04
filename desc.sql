@preaction
set verify off;
define tablename = &1;

ttitle left 'Columns of Table [&tablename]' skip 1 line;
column column_name format a32 heading 'Name';
column column_type format a16 heading 'Type';
column column_length format 999999 heading 'Length';
column column_null format a8 heading 'Nullable';
column column_comments format a80 heading 'Comments' truncate;

select
  a.column_name as column_name,
  a.data_type as column_type,
  a.data_length as column_length,
  decode(a.NULLABLE, 'N', 'Not Null', 'Y', '') as column_null,
  replace(replace(b.comments, chr(13), ''), chr(10), '_rn_') as column_comments
from
  user_tab_columns a
  left join user_col_comments b on a.table_name = b.table_name
    and a.column_name = b.column_name
where
  upper(a.table_name) = upper('&tablename')
order by
  a.column_id;
