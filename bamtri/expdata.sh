#!/bin/bash
export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe
export PATH=$ORACLE_HOME/bin:$PATH
export ORACLE_SID=XE
export NLS_LANG=".AL32UTF8"
export TZ='Asia/Shanghai'

HERE=`cd $(dirname $0); pwd`
TAG=$(date +'%Y%m%d')
LOGFILE=exp231.log
DATFILE=data.dmp

cd $HERE &&
exp PARFILE=expopts.txt LOG=${LOGFILE} FILE=${DATFILE} &&
zip data${TAG}.zip ${DATFILE} ${LOGFILE} &&
rm data.dmp ${LOGFILE}
