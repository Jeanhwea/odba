#!/bin/bash
################################################################################
# 启动前需要修改的配置
################################################################################
TNSID=${TNSID:="127.0.0.1/ora11g"}
SYSUSER=${SYSUSER:="system"}
SYSPASS=${SYSPASS:="oracle"}
################################################################################

# 环境变量设置
export TZ='Asia/Shanghai'
# export NLS_LANG='.AL32UTF8'
export NLS_LANG='.ZHS16GBK'

# 处理日期和间时
FILETAG=$(date +'%Y%m%d_%H%M%S')

# 处理文件夹和文件
DATADIR=${DATADIR:="data"}
DATFILE="${DATADIR}/data.dmp"
LOGFILE="${DATADIR}/${FILETAG}_import.log"
USERID="${SYSUSER}/${SYSPASS}@${TNSID}"

# 导入数据文件
echo "Import into $USERID"
imp PARFILE=params-import.txt USERID=$USERID LOG=$LOGFILE FILE=$DATFILE
echo "Save log to $LOGFILE"
echo "Import into $USERID" >> $LOGFILE
