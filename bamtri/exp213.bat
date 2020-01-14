@echo off
set datetag=%date:~0,4%%date:~5,2%%date:~8,2%
set timetag=%time:~0,2%%time:~3,2%%time:~6,2%
set filetag=%datetag%_%timetag%

set logfile=%filetag%_export.log
set datfile=%filetag%_export.dmp
set server=192.168.0.213
set userid=bamtri_mes/bamtri_mes@%server%/ora10g

set NLS_LANG='.ZHS16GBK'
exp PARFILE=expopts213.txt USERID=%userid% LOG=%logfile% FILE=%datfile%

rem zip data%tag%.zip %datfile% %logfile%
rem rm %datfile% %logfile%
rem mv data%tag%.zip dump
