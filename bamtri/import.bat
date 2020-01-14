@echo off
rem ----------------------------------------------------------------------------
set server=192.168.0.138
set sid=ora11g
rem ----------------------------------------------------------------------------

set NLS_LANG=.ZHS16GBK

set datetag=%date:~0,4%%date:~5,2%%date:~8,2%
set timetag=%time:~0,2%%time:~3,2%%time:~6,2%
set filetag=%datetag%_%timetag%

set datadir=data
set logfile=%datadir%\%filetag%_import.log
set datfile=%datadir%\data.dmp
set userid=system/oracle@%server%/%sid%

echo Import to %userid% > %logfile%
imp PARFILE=import-params.txt USERID=%userid% LOG=%logfile% FILE=%datfile%
echo Save log to %logfile%
