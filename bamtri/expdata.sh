#!/bin/bash
export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe
export PATH=$ORACLE_HOME/bin:$PATH
export ORACLE_SID=XE
export NLS_LANG=".AL32UTF8"

HERE=`cd $(dirname $0); pwd`
TAG=$(date +'%Y%m%d')
LOGFILE=exp231.log

cd $HERE &&
exp bamtri_mes/bamtri_mes@localhost/xe PARFILE=options.txt LOG=${LOGFILE} OWNER=bamtri_mes &&
zip data${TAG}.zip data.dmp ${LOGFILE} &&
rm data.dmp ${LOGFILE}
