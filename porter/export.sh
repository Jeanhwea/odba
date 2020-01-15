#!/bin/bash
################################################################################
SERVER=${SERVER:="127.0.0.1"}
SID=${SID:="ora11g"}
SYSUSER=${SYSUSER:="system"}
SYSPASS=${SYSPASS:="oracle"}
################################################################################

export TZ='Asia/Shanghai'
# export NLS_LANG='.AL32UTF8'
export NLS_LANG='.ZHS16GBK'

FILETAG=$(date +'%Y%m%d_%H%M%S')
DATADIR=${DATADIR:="data"}

DATFILE="${DATADIR}/${FILETAG}_export.dmp"
LOGFILE="${DATADIR}/${FILETAG}_export.log"
USERID="${SYSUSER}/${SYSPASS}@${SERVER}/${SID}"

echo "Export from $USERID"
exp PARFILE=params-export.txt USERID=$USERID LOG=$LOGFILE FILE=$DATFILE
echo "Save log to $LOGFILE"
