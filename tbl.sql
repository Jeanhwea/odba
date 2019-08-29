-- 查看所有表和视图，以及注释
SELECT tc.TABLE_NAME || ' ' || tc.COMMENTS
  FROM USER_TAB_COMMENTS tc
 WHERE tc.TABLE_TYPE in ('TABLE', 'VIEW') AND
       REGEXP_LIKE(tc.TABLE_NAME, '^[0-9A-Za-z][_0-9A-Za-z]*$')
 ORDER BY tc.TABLE_NAME;
