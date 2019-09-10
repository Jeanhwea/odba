SET LINESIZE 255;
SET PAGESIZE 50000;
SET FEEDBACK OFF;
SET TAB OFF;
SET TERMOUT OFF;
ALTER SESSION SET nls_date_format = 'yyyy-mm-dd hh24:mi:ss';
SET TERMOUT ON;

TTITLE LEFT 'List of User Sessions' SKIP 1 LINE;
-- COLUMN logintype FORMAT A10 HEADING 'Type';
COLUMN logontime HEADING 'Login Time';
COLUMN username FORMAT A12 HEADING 'User' TRUNCATE;
COLUMN scmname FORMAT A12 HEADING 'Schema' TRUNCATE;
COLUMN servid FORMAT A12 HEADING 'SID';
COLUMN osid FORMAT A24 HEADING 'User@Hostname';
COLUMN program FORMAT A24 HEADING 'Program' TRUNCATE;
COLUMN status FORMAT A8 HEADING 'Status' TRUNCATE;
COLUMN state FORMAT A8 HEADING 'State' TRUNCATE;

SELECT
  sess.LOGON_TIME AS logontime,
  sess.USERNAME AS username,
  sess.SCHEMANAME AS scmname,
  sess.SERVICE_NAME AS servid,
  sess.OSUSER || '@' || sess.MACHINE AS osid,
  -- sess.STATUS AS status,
  -- sess.STATE AS state,
  sess.PROGRAM AS program
  FROM V$SESSION sess
 WHERE sess.TYPE = 'USER'
 ORDER BY logontime DESC, username;
