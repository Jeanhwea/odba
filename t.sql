SET LINESIZE 255;
SET PAGESIZE 50000;
SET FEEDBACK OFF;
SET TAB OFF;
SET VERIFY OFF;
SET TERMOUT OFF;

DEFINE tablename = '&1';

TTITLE LEFT 'List columns of table [&tablename]' SKIP 1 LINE;
COLUMN colname FORMAT A25 HEADING 'Name';
COLUMN coltype FORMAT A10 HEADING 'Type';
COLUMN collen FORMAT 9999 HEADING 'Len';
COLUMN colnull FORMAT A2 HEADING 'NN';
COLUMN ispk FORMAT A2 HEADING 'PK';
COLUMN colcmt FORMAT A80 HEADING 'Comment' TRUNCATE;

SET TERMOUT ON;

-- Maximun length of user column name
-- SELECT MAX(LENGTH(COLUMN_NAME)) USER_TAB_COLUMNS;

SELECT utbc.COLUMN_NAME AS colname,
       utbc.DATA_TYPE AS coltype,
       utbc.DATA_LENGTH AS collen,
       DECODE(
         (SELECT ucst.CONSTRAINT_TYPE
            FROM USER_CONS_COLUMNS uccl, USER_CONSTRAINTS ucst
           WHERE ucst.CONSTRAINT_NAME = uccl.CONSTRAINT_NAME AND
                 utbc.COLUMN_NAME = uccl.COLUMN_NAME AND
                 utbc.TABLE_NAME = uccl.TABLE_NAME AND
                 ucst.CONSTRAINT_TYPE = 'P' AND
                 ROWNUM <= 1), 'P', '*', '')
         AS ispk,
       DECODE(utbc.NULLABLE, 'N', '!', '') AS colnull,
       (
         SELECT REPLACE(REPLACE(uclc.COMMENTS, CHR(13), ''), CHR(10), '\n')
           FROM USER_COL_COMMENTS uclc
          WHERE uclc.COLUMN_NAME = utbc.COLUMN_NAME AND
                uclc.TABLE_NAME = uclc.TABLE_NAME AND
                ROWNUM <= 1
       ) AS colcmt
  FROM USER_TAB_COLUMNS utbc
 WHERE UPPER(utbc.TABLE_NAME) = UPPER('&tablename')
 ORDER BY ispk, colnull, colname;
