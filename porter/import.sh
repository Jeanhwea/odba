#!/bin/bash
SERVER=${SERVER:="127.0.0.1"}
SID=${SID:="ora11g"}

export TZ='Asia/Shanghai'
# export NLS_LANG='.AL32UTF8'
export NLS_LANG='.ZHS16GBK'

FILETAG=$(date +'%Y%m%d_%H%M%S')
DATADIR=${DATADIR:="data"}

DATFILE="${DATADIR}/bamtri_mes.dmp"
LOGFILE="${DATADIR}/${FILETAG}_import.log"
USERID="system/oracle@${SERVER}/ora11g"

echo "Import from $USERID"
imp PARFILE=params-import.txt USERID=$USERID LOG=$LOGFILE FILE=$DATFILE
echo "Save log to $LOGFILE"
