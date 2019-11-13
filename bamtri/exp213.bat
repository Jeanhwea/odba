@echo off
set tag=%date:~0,4%%date:~5,2%%date:~8,2%
set logfile=exp213.log
set datfile=data.dmp

exp PARFILE=expopts213.txt LOG=%logfile% FILE=%datfile%
zip data%tag%.zip %datfile% %logfile%
rm %datfile% %logfile%
mv data%tag%.zip dump
