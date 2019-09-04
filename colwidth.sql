-- call init.sql first
@init.sql

-- format common fields
COLUMN MYID FORMAT 99999999 HEADING 'ID';
COLUMN DATETIME FORMAT A20 HEADING 'Updated At';
COLUMN SIGNED_CODE FORMAT A16 HEADING 'Updated By';
COLUMN VALIDATION FORMAT A8 HEADING 'Delete?';

-- more
COLUMN D_CODE FORMAT A10 TRUNCATE;
COLUMN D_NAME FORMAT A20;
COLUMN D_NOTE FORMAT A16 TRUNCATE;

COLUMN E_CODE FORMAT A10 TRUNCATE;
COLUMN E_NAME FORMAT A20;
COLUMN E_NOTE FORMAT A16 TRUNCATE;

COLUMN GESTURE FORMAT A8 TRUNCATE;
COLUMN PASSWORD FORMAT A8 TRUNCATE;
COLUMN PASS_STRING FORMAT A8 TRUNCATE;
COLUMN IS_ACTIVE FORMAT A10 TRUNCATE;
