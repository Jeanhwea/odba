@echo off
rem ----------------------------------------------------------------------------
rem 启动前需要修改的配置
rem ----------------------------------------------------------------------------
set server=192.168.0.215
set sid=ora10g
set user=system/dba
rem ----------------------------------------------------------------------------

rem 环境变量
set NLS_LANG=.ZHS16GBK

rem 处理日期和是时间
set datetag=%date:~0,4%%date:~5,2%%date:~8,2%
set timetag=%time:~0,2%%time:~3,2%%time:~6,2%
rem 如果小时数小于 10，需要手工将前面补 0
set hour=%time:~0,2%
if /i %hour% LSS 10 (set timetag=0%time:~1,1%%time:~3,2%%time:~6,2%)
set filetag=%datetag%_%timetag%

rem 处理文件夹和文件
set datadir=data
set logfile=%datadir%\%filetag%_import.log
set datfile=%datadir%\data.dmp
set userid=%user%@%server%/%sid%

rem 导入数据文件
echo Import to %userid% > %logfile%
imp PARFILE=params-import.txt USERID=%userid% LOG=%logfile% FILE=%datfile%
echo Save log to %logfile%
