@echo off
set NLS_LANG=.ZHS16GBK

set datetag=%date:~0,4%%date:~5,2%%date:~8,2%
set timetag=%time:~0,2%%time:~3,2%%time:~6,2%
set filetag=%datetag%_%timetag%

set datadir=dump
set logfile=%datadir%\%filetag%_export.log
set datfile=%datadir%\%filetag%_export.dmp
set server=192.168.0.213
set userid=bamtri_mes/bamtri_mes@%server%/ora10g

echo Export from %userid% > %logfile%
exp PARFILE=expopts213.txt USERID=%userid% LOG=%logfile% FILE=%datfile%
echo Save log to %logfile%

rem zip data%tag%.zip %datfile% %logfile%
rem rm %datfile% %logfile%
rem mv data%tag%.zip dump
