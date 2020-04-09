@preaction
set verify off;
define tablename = &1;

ttitle left 'Columns of Table [&tablename]' skip 1 line;
column colname format a32 heading 'Name';
column coltype format a16 heading 'Type';
column collen  format 999999 heading 'Length';
column isnul   format a8 heading 'Nullable';
column colcmt  format a80 heading 'Comments' truncate;

select
  t1.column_name as colname,
  t1.data_type as coltype,
  t1.data_length as collen,
  decode(t1.NULLABLE, 'N', 'Not Null', 'Y', '') as isnul,
  replace(replace(t2.comments, chr(13), ''), chr(10), '_rn_') as colcmt
from
  user_tab_columns t1
  left join user_col_comments t2 on t1.table_name = t2.table_name
    and t1.column_name = t2.column_name
where
  lower(t1.table_name) = lower('&tablename')
order by
  t1.column_id;
