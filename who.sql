SET LINESIZE 255;
SET PAGESIZE 50000;
SET FEEDBACK OFF;
SET TAB OFF;

TTITLE LEFT 'List of User Sessions' SKIP 1 LINE;
-- COLUMN logintype FORMAT A10 HEADING 'Type';
COLUMN logontime HEADING 'Login Time';
COLUMN username FORMAT A12 HEADING 'User Name' TRUNCATE;
COLUMN servid FORMAT A12 HEADING 'Service Name';
COLUMN osid FORMAT A24 HEADING 'User@Hostname';
COLUMN program FORMAT A32 HEADING 'Program' TRUNCATE;
COLUMN status FORMAT A8 HEADING 'Status' TRUNCATE;
COLUMN state FORMAT A8 HEADING 'State' TRUNCATE;

SELECT
  -- sess.TYPE AS logintype,
  sess.LOGON_TIME AS logontime,
  sess.USERNAME AS username,
  sess.SERVICE_NAME AS servid,
  sess.OSUSER || '@' || sess.MACHINE AS osid,
  sess.PROGRAM AS program,
  sess.STATUS AS status,
  sess.STATE AS state
  FROM V$SESSION sess
 WHERE sess.TYPE = 'USER'
 ORDER BY logintype, username, status;
