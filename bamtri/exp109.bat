@echo off
set tag=%date:~0,4%%date:~5,2%%date:~8,2%

exp bamtri_mes/bamtri_mes@192.168.0.214/ora10g PARFILE=options.txt LOG=exp109.log OWNER=bamtri_mes

zip data%tag%.zip data.dmp exp109.log
mv data%tag%.zip dump
