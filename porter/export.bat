@echo off
rem ----------------------------------------------------------------------------
rem 启动前需要修改的配置
rem ----------------------------------------------------------------------------
set TNSID=192.168.0.213/ora10g
set SYSUSER=system
set SYSPASS=dba
rem ----------------------------------------------------------------------------

rem 配置主机信息
set HERE=%~dp0
set DRIVER=%~d0
for /f %%a in ('hostname') do set HOST=%%a

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
set LOGFILE=%DATADIR%\%FILETAG%_export.log
set DATFILE=%DATADIR%\%FILETAG%_export.dmp
set USERID=%SYSUSER%/%SYSPASS%@%TNSID%

rem 打印导出的配置
set README=%DATADIR%\readme.txt
echo --------------------------------------------------------------  > %README%
echo Configurations for exporting                                   >> %README%
echo -------------------------------------------------------------- >> %README%
echo   ORACLE_HOME     %ORACLE_HOME%                                >> %README%
echo   NLS_LANG        %NLS_LANG%                                   >> %README%
echo -------------------------------------------------------------- >> %README%
echo   Host Name       %HOST%                                       >> %README%
echo   Base Foleder    %HERE%                                       >> %README%
echo   Start Date      %DATETAG:~0,4%-%DATETAG:~4,2%-%DATETAG:~6,2% >> %README%
echo   Start Time      %TIMETAG:~0,2%:%TIMETAG:~2,2%:%TIMETAG:~4,2% >> %README%
echo -------------------------------------------------------------- >> %README%
echo   TNS Identifier  %TNSID%                                      >> %README%
echo   Export User     %SYSUSER%                                    >> %README%
echo -------------------------------------------------------------- >> %README%
type %README%

rem 导出数据文件
exp PARFILE=params-export.txt USERID=%USERID% LOG=%LOGFILE% FILE=%DATFILE%
echo Save log to %LOGFILE%

rem 打包压缩文件
set ZIPFILE=%DATADIR%\%FILETAG%_export.zip
zip %ZIPFILE% %DATFILE% %LOGFILE% %README%
del %DATFILE% %LOGFILE% %README%
