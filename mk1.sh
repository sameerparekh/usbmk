#!/bin/sh
SRC=$1
DST=$2
MD5=$3

echo "Creating $DST"
pv -tpreb ${SRC} | dd of=${DST}
echo "Checking $DST"
CHK=`md5sum ${DST}`
if [ $CHK != $MD5 ]; then
    echo "$DST failed"
    exit -1
else
    echo "$DST succeeded"
done

