SET LINESIZE 255;
SET PAGESIZE 50000;
SET FEEDBACK OFF;
SET TAB OFF;
SET HEADING OFF;

-- 导出所有表结构
SELECT 'CREATE TABLE ' || cmt.TABLE_NAME || ' (' || CHR(10) ||
         (
           SELECT '  ' || REPLACE(WM_CONCAT(
             col.COLUMN_NAME || ' ' ||
             DECODE(col.DATA_TYPE,
                    'DATE', col.DATA_TYPE,
                    'NUMBER', col.DATA_TYPE,
                    'BLOB', col.DATA_TYPE,
                    'CLOB', col.DATA_TYPE,
                    col.DATA_TYPE || '(' || col.DATA_LENGTH || ')') ||
                    DECODE(col.NULLABLE, 'N', ' NOT NULL', '') ||
                    DECODE((
                      SELECT cs.CONSTRAINT_TYPE
                        FROM USER_CONS_COLUMNS uc, USER_CONSTRAINTS cs
                       WHERE cs.CONSTRAINT_NAME = uc.CONSTRAINT_NAME AND
                             col.TABLE_NAME = uc.TABLE_NAME AND
                             col.COLUMN_NAME = uc.COLUMN_NAME AND
                             cs.CONSTRAINT_TYPE = 'P'), 'P', ' PRIMARY KEY', '')
           ), ',', ',' || CHR(10) || '  ')
             FROM USER_TAB_COLUMNS col
            WHERE cmt.TABLE_NAME = col.TABLE_NAME
         ) || CHR(10) || ');' AS sqltext
  FROM USER_TAB_COMMENTS cmt
 WHERE cmt.TABLE_TYPE = 'TABLE' AND
       REGEXP_LIKE(cmt.TABLE_NAME, '^[0-9A-Za-z][_0-9A-Za-z]*$')
 ORDER BY cmt.TABLE_NAME;


-- 导出所有表的注释
SELECT 'COMMENT ON TABLE ' || tc.TABLE_NAME || ' IS ''' ||
         REPLACE(REPLACE(tc.COMMENTS, CHR(13), ''), CHR(10), '\n')
         || ''';' AS sqltext
  FROM USER_TAB_COMMENTS tc
 WHERE tc.TABLE_TYPE = 'TABLE' AND
       REGEXP_LIKE(tc.TABLE_NAME, '^[0-9A-Za-z][_0-9A-Za-z]*$')
 ORDER BY tc.TABLE_NAME;

-- 导出所有列的注释
SELECT 'COMMENT ON COLUMN ' || cc.TABLE_NAME || '.' || cc.COLUMN_NAME || ' IS ''' ||
         REPLACE(REPLACE(cc.COMMENTS, CHR(13), ''), CHR(10), '\n')
         || ''';' AS sqltext
  FROM USER_COL_COMMENTS cc
 WHERE REGEXP_LIKE(cc.TABLE_NAME, '^[0-9A-Za-z][_0-9A-Za-z]*$')
 ORDER BY cc.TABLE_NAME;
