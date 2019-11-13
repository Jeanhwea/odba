DATFILE=$(find $(pwd) -type f -iname 'data*.zip' | sort -r | head -n 1)
SERVER=192.168.0.240

echo "upload ${DATFILE} to ${SERVER}"
scp $DATFILE ub64@${SERVER}:/tmp
