SET LINESIZE 255;
SET PAGESIZE 50000;
SET FEEDBACK OFF;
SET TAB OFF;

TTITLE LEFT 'List of User Tables' SKIP 1 LINE;
COLUMN tsname FORMAT A20 HEADING 'Tablespace';
COLUMN tabname FORMAT A32 HEADING 'Tablename';
COLUMN tabcmt FORMAT A80 HEADING 'Comments' TRUNCATE;

SELECT
  utbs.TABLESPACE_NAME AS tsname,
  utbs.TABLE_NAME AS tabname,
  REPLACE(REPLACE(utbcmts.COMMENTS, CHR(13), ''), CHR(10), '\n') AS tabcmt
  FROM USER_TABLES utbs
         LEFT JOIN USER_TAB_COMMENTS utbcmts
             ON utbs.TABLE_NAME = utbcmts.TABLE_NAME
 ORDER BY tsname, tabname;
