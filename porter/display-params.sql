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

-- 初始化内存参数
show parameter memory_target;
show parameter memory_max_target;
-- alter system set memory_max_target=22000m scope=spfile;
-- alter system set memory_target=22000m scope=spfile;

-- SGA 值
-- show parameter sga;
show parameter sga_max_size;
show parameter sga_target;
show parameter db_cache_size;
show parameter db_keep_cache_size;
show parameter db_recycle_cache_size;


-- alter system set sga_max_size=32000m scope=spfile;
-- alter system set sga_target=32000m scope=spfile;
-- alter system set lock_sga=true scope=spfile;
-- alter system set pre_page_sga=true scope=spfile;

-- alter system set db_cache_size=12000m scope=spfile;
-- alter system set db_keep_cache_size=0 scope=spfile;
-- alter system set db_recycle_cache_size=0 scope=spfile;


-- PGA 值
-- show parameter pga;
show parameter pga_aggregate_target;
show parameter statistics_level;

-- alter system set pga_aggregate_target=8000m scope=spfile;
