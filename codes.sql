-- 查看ORACLE 数据库中本用户下的所有列

select table_name,column_name from user_tab_columns;

-- 查看ORACLE 数据库中本用户下的所有列

select user,table_name,column_name from all_tab_columns;

-- 查看ORACLE 数据库中的序列号

select * from user_sequences;

-- 上面的所有对象，都可以通过下面的SQL语句查询得到

-- 查询所有的用户生成的ORACLE对象

SELECT * FROM user_objects;

-- 查看ORACLE 数据库中所有表的注释

select table_name,comments from user_tab_comments;

-- 查看ORACLE 数据库中所有列的注释

select table_name,column_name,comments from user_col_comments;

-- 给表加ORACLE的注释

COMMENT ON TABLE aa10 IS '系统参数表';

-- 给列加ORACLE的注释

COMMENT ON COLUMN aa10.aaa100 IS '参数类别';

-- 查看表中列的属性，包括 数据类型，是否非空等

DESC aa10;

-- 通过系统表，查看表中列的属性，包括 数据类型，是否非空等

SELECT TABLE_NAME, COLUMN_ID, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, DATA_PRECISION, NULLABLE FROM USER_TAB_COLUMNS ORDER BY TABLE_NAME, COLUMN_ID;

--查看所有表空间

select tablespace_name, sum(bytes)/1024/1024 from dba_data_files group by tablespace_name;

--查看未使用表空间大小

select tablespace_name,sum(bytes)/1024/1024 from dba_free_space group by tablespace_name;

-- 查看数据库中表、索引占用的数据库空间大小

SELECT * FROM user_segments;

-- 查看所有表的记录数

CREATE TABLE table_count(table_name VARCHAR2(50),columns NUMBER(20));

-- 通过PB运行下面的语句，得到结果集，将结果集在PB下执行，最后提交

select 'insert into table_count values('''||table_name||''', (select count(1)from '||table_name||'));//'||comments from user_tab_comments;

-- 所有表的记录都在table_count了

SELECT * FROM table_count;
