#!/bin/bash
################################################################################
# 启动前需要修改的配置
################################################################################
TNSID=${TNSID:="127.0.0.1/ora11g"}
SYSUSER=${SYSUSER:="system"}
SYSPASS=${SYSPASS:="oracle"}
################################################################################

# 配置主机信息
HERE=`cd $(dirname $0); pwd`

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
USERID="${SYSUSER}/${SYSPASS}@${TNSID}/${SID}"

# 打印导出的配置
README="${DATADIR}/readme.txt"
echo "--------------------------------------------------------------" >> $README
echo "Configurations for exporting                                  " >> $README
echo "--------------------------------------------------------------" >> $README
echo "  ORACLE_HOME     $ORACLE_HOME                                " >> $README
echo "  NLS_LANG        $NLS_LANG                                   " >> $README
echo "--------------------------------------------------------------" >> $README
echo "  Host Name       $(hostname)                                 " >> $README
echo "  Base Foleder    $HERE                                       " >> $README
echo "  Start Date      $(date +'%Y-%m-%d')                         " >> $README
echo "  Start Time      $(date +'%H:%M:%S')                         " >> $README
echo "--------------------------------------------------------------" >> $README
echo "  TNS Identifier  $TNSID                                      " >> $README
echo "  Export User     $SYSUSER                                    " >> $README
echo "--------------------------------------------------------------" >> $README
cat $README

# 导出数据文件
exp PARFILE=params-export.txt USERID=$USERID LOG=$LOGFILE FILE=$DATFILE
echo "Save log to $LOGFILE"
echo "Export from $USERID" >> $LOGFILE

# 打包压缩文件
ZIPFILE="${DATADIR}/${FILETAG}_export.zip"
zip $ZIPFILE $DATFILE $LOGFILE $README
rm $DATFILE $LOGFILE $README
