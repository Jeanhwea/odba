SET LINESIZE 200;
SET PAGESIZE 0;
SET FEEDBACK OFF;
SET TAB OFF;

COLUMN tabname FORMAT A32 HEADING 'NAME';
COLUMN colname FORMAT A32 HEADING 'TYPE';
COLUMN colcmt FORMAT A80 HEADING 'COMMENT' TRUNCATE;

SELECT cc.TABLE_NAME AS tabname,
       cc.COLUMN_NAME AS colname,
       cc.COMMENTS AS colcmt
  FROM USER_COL_COMMENTS cc
 WHERE cc.TABLE_NAME = '&table';
