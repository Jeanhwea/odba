SET LINESIZE 32767;
SET PAGESIZE 50000;
SET FEEDBACK OFF;
SET TAB OFF;

DEFINE tablename = &1;

-- TTITLE CENTER 'Columns of Table [&tablename]' SKIP 1 LINE;
-- COLUMN tabname FORMAT A32 HEADING 'Table';
COLUMN colname FORMAT A32 HEADING 'Name';
COLUMN coltype FORMAT A16 HEADING 'Type';
COLUMN collen FORMAT 999999 HEADING 'Length';
COLUMN colnull FORMAT A8 HEADING 'Nullable';
COLUMN colcmt FORMAT A80 HEADING 'Comment' TRUNCATE;


SELECT tc.COLUMN_NAME AS colname,
       tc.DATA_TYPE AS coltype,
       tc.DATA_LENGTH AS collen,
       DECODE(tc.NULLABLE, 'N', 'Not Null', 'Y', '') AS colnull,
       REPLACE(REPLACE(cc.COMMENTS, CHR(13), ''), CHR(10), ' _R_N ') AS colcmt
  FROM USER_TAB_COLUMNS tc
         LEFT JOIN USER_COL_COMMENTS cc
             ON tc.TABLE_NAME = cc.TABLE_NAME AND
         tc.COLUMN_NAME = cc.COLUMN_NAME
 WHERE tc.TABLE_NAME = '&tablename'
 ORDER BY tc.COLUMN_ID;
