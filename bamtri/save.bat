set tag=%date:~0,4%%date:~5,2%%date:~8,2%

zip data%tag%.zip data.dmp exp109.log
mv data%tag%.zip dump
