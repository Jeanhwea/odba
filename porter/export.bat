@echo off
rem ----------------------------------------------------------------------------
set server=192.168.0.139
set sid=ora11g
set user=system/oracle
rem ----------------------------------------------------------------------------

set NLS_LANG=.ZHS16GBK

set datetag=%date:~0,4%%date:~5,2%%date:~8,2%
set timetag=%time:~0,2%%time:~3,2%%time:~6,2%
set filetag=%datetag%_%timetag%

set datadir=data
set logfile=%datadir%\%filetag%_export.log
set datfile=%datadir%\%filetag%_export.dmp
set userid=%user%@%server%/%sid%

echo Export from %userid% > %logfile%
exp PARFILE=params-export.txt USERID=%userid% LOG=%logfile% FILE=%datfile%
echo Save log to %logfile%

set zipfile=%filetag%_export.zip
zip %zipfile% %datfile% %logfile%
move /y %zipfile% %datadir%
del %datfile% %logfile%
