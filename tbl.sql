-- 查看所有表和视图，以及注释
SET HEADING OFF;

SELECT DECODE(tc.TABLE_TYPE, 'TABLE', 'T', 'VIEW', 'V', 'X')
         || ' ' || tc.TABLE_NAME || ' ' ||
         REPLACE(REPLACE(TC.COMMENTS, CHR(13), ''), CHR(10), ' _R_N ')
  FROM USER_TAB_COMMENTS tc
 WHERE tc.TABLE_TYPE in ('TABLE', 'VIEW') AND
       REGEXP_LIKE(tc.TABLE_NAME, '^[0-9A-Za-z][_0-9A-Za-z]*$')
 ORDER BY tc.TABLE_NAME;

SET HEADING ON;
