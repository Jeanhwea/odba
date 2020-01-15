#!/bin/bash
################################################################################
# 启动前需要修改的配置
################################################################################
SERVER=${SERVER:="127.0.0.1"}
SID=${SID:="ora11g"}
SYSUSER=${SYSUSER:="system"}
SYSPASS=${SYSPASS:="oracle"}
################################################################################

# 环境变量设置
export TZ='Asia/Shanghai'
# export NLS_LANG='.AL32UTF8'
export NLS_LANG='.ZHS16GBK'

# 处理日期和时间
FILETAG=$(date +'%Y%m%d_%H%M%S')

# 处理文件夹和文件
DATADIR=${DATADIR:="data"}
DATFILE="${DATADIR}/${FILETAG}_export.dmp"
LOGFILE="${DATADIR}/${FILETAG}_export.log"
USERID="${SYSUSER}/${SYSPASS}@${SERVER}/${SID}"

# 导出数据文件
echo "Export from $USERID"
exp PARFILE=params-export.txt USERID=$USERID LOG=$LOGFILE FILE=$DATFILE
echo "Save log to $LOGFILE"

# 打包压缩文件
ZIPFILE="${FILETAG}_export.zip"
zip $ZIPFILE $DATFILE $LOGFILE
mv $ZIPFILE $DATADIR
rm $DATFILE $LOGFILE
