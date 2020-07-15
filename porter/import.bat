@echo off
rem ----------------------------------------------------------------------------
rem 启动前需要修改的配置
rem ----------------------------------------------------------------------------
set TNSID=192.168.0.231/xe
set SYSUSER=system
set SYSPASS=dba
rem ----------------------------------------------------------------------------

rem 环境变量
set NLS_LANG=.ZHS16GBK

rem 处理日期和时间
set DATETAG=%date:~0,4%%date:~5,2%%date:~8,2%
set TIMETAG=%time:~0,2%%time:~3,2%%time:~6,2%
rem 如果小时数小于 10，需要手工将前面补 0
set HOUR=%time:~0,2%
if /i %HOUR% LSS 10 (set TIMETAG=0%time:~1,1%%time:~3,2%%time:~6,2%)
set FILETAG=%DATETAG%_%TIMETAG%

rem 处理文件夹和文件
set DATADIR=data
set LOGFILE=%DATADIR%\%FILETAG%_import.log
set DATFILE=%DATADIR%\data.dmp
set USERID=%SYSUSER%/%SYSPASS%@%TNSID%

rem 导入数据文件
echo Import to %USERID%
imp PARFILE=params-import.txt USERID=%USERID% LOG=%LOGFILE% FILE=%DATFILE%
echo Save log to %LOGFILE%
echo Import to %USERID% >> %LOGFILE%
