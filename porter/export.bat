@echo off
rem ----------------------------------------------------------------------------
rem 启动前需要修改的配置
rem ----------------------------------------------------------------------------
set server=192.168.0.213
set sid=ora10g
set sysuser=system
set syspass=dba
rem ----------------------------------------------------------------------------

rem 配置主机信息
set here=%~dp0
set driver=%~d0
for /f %%a in ('hostname') do set host=%%a

rem 环境变量
set NLS_LANG=.ZHS16GBK

rem 处理日期和时间
set datetag=%date:~0,4%%date:~5,2%%date:~8,2%
set timetag=%time:~0,2%%time:~3,2%%time:~6,2%
rem 如果小时数小于 10，需要手工将前面补 0
set hour=%time:~0,2%
if /i %hour% LSS 10 (set timetag=0%time:~1,1%%time:~3,2%%time:~6,2%)
set filetag=%datetag%_%timetag%

rem 处理文件夹和文件
set datadir=data
set logfile=%datadir%\%filetag%_export.log
set datfile=%datadir%\%filetag%_export.dmp
set userid=%sysuser%/%syspass%@%server%/%sid%

rem 导出数据文件
echo Export from %userid%
exp PARFILE=params-export.txt USERID=%userid% LOG=%logfile% FILE=%datfile%
echo Save log to %logfile%

rem 写导出的说明文件
set readme=readme.txt
echo The file contains some export information  > %readme%
echo                                           >> %readme%
echo Status of Host                            >> %readme%
echo ----------------------------------------  >> %readme%
echo Host Name     %host%                      >> %readme%
echo Base Foleder  %here%                      >> %readme%
echo Start         %datetag% %timetag%         >> %readme%
echo                                           >> %readme%
echo Current Environments                      >> %readme%
echo ----------------------------------------  >> %readme%
echo ORACLE_HOME   %ORACLE_HOME%               >> %readme%
echo NLS_LANG      %NLS_LANG%                  >> %readme%
echo                                           >> %readme%
echo Status of Database                        >> %readme%
echo ----------------------------------------  >> %readme%
echo Server        %server%                    >> %readme%
echo SID           %sid%                       >> %readme%
echo Export User   %sysuser%                   >> %readme%

rem 打包压缩文件
set zipfile=%filetag%_export.zip
zip %zipfile% %datfile% %logfile% %readme%
move /y %zipfile% %datadir%
del %datfile% %logfile% %readme%
