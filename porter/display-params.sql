set linesize 120

-- 最大 CPU 数量
show parameters cpu;
-- alter system set cpu_count=32 scope=both;

-- 系统进程数
show parameter processes;
show parameter sessions;
-- alter system set processes=1024 scope=spfile;
-- alter system set sessions=450 scope=spfile;

-- 游标数目
show parameter open_cursors;
-- select count(*) from v$open_cursor;
-- alter system set open_cursors=20480 scope=both;

-- JOB 值
show parameter job_queue_process;
-- alter system set job_queue_processes=10;

-- SGA 值
show parameter sga;
