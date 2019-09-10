SET LINESIZE 255;
SET PAGESIZE 50000;
SET FEEDBACK OFF;
SET TAB OFF;

TTITLE LEFT 'List of User Sessions' SKIP 1 LINE;
COLUMN logintype FORMAT A16 HEADING 'Type';
COLUMN logontime HEADING 'Login Time';
COLUMN username FORMAT A16 HEADING 'User Name';
COLUMN servid FORMAT A16 HEADING 'Service Name';
COLUMN osid FORMAT A24 HEADING 'User@Hostname';
COLUMN program FORMAT A24 HEADING 'Program';
COLUMN status FORMAT A10 HEADING 'Status';
COLUMN state FORMAT A20 HEADING 'State';

SELECT
  sess.TYPE AS logintype,
  sess.LOGON_TIME AS logontime,
  sess.USERNAME AS username,
  sess.SERVICE_NAME AS servid,
  sess.OSUSER || '@' || sess.MACHINE AS osid,
  sess.PROGRAM AS program,
  sess.STATUS AS status,
  sess.STATE AS state
  FROM V$SESSION sess
 ORDER BY logintype, username, status;
