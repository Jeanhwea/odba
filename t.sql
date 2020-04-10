set linesize 255;
set pagesize 50000;
set feedback off;
set tab off;
set verify off;
set termout off;
define tablename = '&1';
set termout on;

column colname format a25  heading 'Name';
column coltype format a10  heading 'Type';
column collen  format 9999 heading 'Len';
column colpcs  format 9999 heading 'Prec';
column isnul   format a2   heading 'NN';
column ispk    format a2   heading 'PK';
column isuniq  format a2   heading 'UQ';
column colcmt  format a80  heading 'Comment' truncate;
column cstname format a32  heading 'Constraint';

-- maximum length of user column name
-- select max(length(column_name)) user_tab_columns;

-- list table columns
ttitle left 'List columns of table [&tablename]' skip 1 line;
select
  (select 'p'
     from user_cons_columns t2, user_constraints t3
    where t3.constraint_name = t2.constraint_name and
          t1.column_name = t2.column_name and
          t1.table_name = t2.table_name and
          lower(t3.constraint_type) = 'p' and
          rownum <= 1)
    as ispk,
  (select 'u'
     from user_cons_columns t4, user_constraints t5
    where t5.constraint_name = t4.constraint_name and
          t1.column_name = t4.column_name and
          t1.table_name = t4.table_name and
          lower(t5.constraint_type) = 'u'
    group by t5.constraint_name
   having count(1) = 1)
    as isuniq,
  decode(lower(t1.nullable), 'n', '*', '') as isnul,
  t1.column_name as colname,
  t1.data_type as coltype,
  t1.data_length as collen,
  t1.data_precision as colpcs,
  (
    select replace(replace(t6.comments, chr(13), ''), chr(10), '\n')
      from user_col_comments t6
     where t6.column_name = t1.column_name and
           t6.table_name = t1.table_name and
           rownum <= 1
  ) as colcmt
  from user_tab_columns t1
 where lower(t1.table_name) = lower('&tablename')
 order by ispk, isnul, t1.column_id;

-- list constraint
ttitle left 'List constraints of table [&tablename]' skip 1 line;
select
  t1.constraint_name as cstname,
  t1.column_name as colname
  from user_cons_columns t1, user_constraints t2
 where t2.constraint_name = t1.constraint_name and
       lower(t2.constraint_type) = 'u' and
       lower(t1.table_name) = lower('&tablename')
 order by t1.position;
