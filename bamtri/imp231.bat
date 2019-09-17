@echo off
set logfile=imp231.log
set datfile=data.dmp

imp PARFILE=impopts.txt LOG=%logfile% FILE=%datfile%
