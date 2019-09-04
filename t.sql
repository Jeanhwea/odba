SET LINESIZE 255;
SET PAGESIZE 50000;
SET FEEDBACK OFF;
SET TAB OFF;
SET VERIFY OFF

DEFINE tablename = &1;

-- TTITLE CENTER 'Columns of Table [&tablename]' SKIP 1 LINE;
-- COLUMN tabname FORMAT A32 HEADING 'Table';
COLUMN colname FORMAT A32 HEADING 'Name';
COLUMN coltype FORMAT A10 HEADING 'Type';
COLUMN collen FORMAT 9999 HEADING 'Len';
COLUMN colnull FORMAT A2 HEADING 'NN';
COLUMN ispk FORMAT A2 HEADING 'PK';
COLUMN colcmt FORMAT A80 HEADING 'Comment' TRUNCATE;


SELECT tc.COLUMN_NAME AS colname,
       tc.DATA_TYPE AS coltype,
       tc.DATA_LENGTH AS collen,
       DECODE(tc.NULLABLE, 'N', '!', '') AS colnull,
       DECODE((SELECT cs.CONSTRAINT_TYPE
                 FROM USER_CONS_COLUMNS uc, USER_CONSTRAINTS cs
                WHERE cs.CONSTRAINT_NAME = uc.CONSTRAINT_NAME AND
                      tc.TABLE_NAME = uc.TABLE_NAME AND
                      tc.COLUMN_NAME = uc.COLUMN_NAME AND
                      cs.CONSTRAINT_TYPE = 'P'), 'P', '*', '') AS ispk,
       REPLACE(REPLACE(cc.COMMENTS, CHR(13), ''), CHR(10), ' _R_N ') AS colcmt
  FROM USER_TAB_COLUMNS tc
         LEFT JOIN USER_COL_COMMENTS cc
             ON tc.TABLE_NAME = cc.TABLE_NAME AND
         tc.COLUMN_NAME = cc.COLUMN_NAME
 WHERE UPPER(tc.TABLE_NAME) = UPPER('&tablename')
 ORDER BY tc.COLUMN_ID;
