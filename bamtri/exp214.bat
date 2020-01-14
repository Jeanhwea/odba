@echo off
set NLS_LANG=.ZHS16GBK

set datetag=%date:~0,4%%date:~5,2%%date:~8,2%
set timetag=%time:~0,2%%time:~3,2%%time:~6,2%
set filetag=%datetag%_%timetag%

set logfile=%filetag%_export.log
set datfile=%filetag%_export.dmp
set server=192.168.0.213
set userid=bamtri_mes/bamtri_mes@%server%/ora10g

set datadir=data

echo Export from %userid%
exp PARFILE=export-params.txt USERID=%userid% LOG=%logfile% FILE=%datfile%
echo Save log to %logfile%
