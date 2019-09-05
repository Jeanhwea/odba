SET LINESIZE 255;
SET PAGESIZE 50000;
SET FEEDBACK OFF;
SET TAB OFF;
SET VERIFY OFF;
SET TERMOUT OFF;

-- read tablename from database
COLUMN tablename NOPRINT NEW_VALUE tabname;
SELECT UPPER(tc.TABLE_NAME) AS tabname
  FROM USER_TAB_COLUMNS tc
 WHERE UPPER(tc.TABLE_NAME) = UPPER('&1') AND
       ROWNUM <= 1;

TTITLE 'List columns of table [&tablename]' SKIP 1 LINE;
COLUMN colname FORMAT A32 HEADING 'Name';
COLUMN coltype FORMAT A10 HEADING 'Type';
COLUMN collen FORMAT 9999 HEADING 'Len';
COLUMN colnull FORMAT A2 HEADING 'NN';
COLUMN ispk FORMAT A2 HEADING 'PK';
COLUMN colcmt FORMAT A80 HEADING 'Comment' TRUNCATE;

SET TERMOUT ON;

SELECT tc.COLUMN_NAME AS colname,
       tc.DATA_TYPE AS coltype,
       tc.DATA_LENGTH AS collen,
       DECODE((SELECT cs.CONSTRAINT_TYPE
                 FROM USER_CONS_COLUMNS uc, USER_CONSTRAINTS cs
                WHERE cs.CONSTRAINT_NAME = uc.CONSTRAINT_NAME AND
                      tc.TABLE_NAME = uc.TABLE_NAME AND
                      tc.COLUMN_NAME = uc.COLUMN_NAME AND
                      cs.CONSTRAINT_TYPE = 'P'), 'P', '*', '') AS ispk,
       DECODE(tc.NULLABLE, 'N', '!', '') AS colnull,
       REPLACE(REPLACE(cc.COMMENTS, CHR(13), ''), CHR(10), ' _R_N ') AS colcmt
  FROM USER_TAB_COLUMNS tc
         LEFT JOIN USER_COL_COMMENTS cc
             ON tc.TABLE_NAME = cc.TABLE_NAME AND
         tc.COLUMN_NAME = cc.COLUMN_NAME
 WHERE UPPER(tc.TABLE_NAME) = UPPER('&tablename')
 ORDER BY ispk, colnull, colname;
