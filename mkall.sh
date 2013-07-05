#!/bin/bash
DEVS=( `df | grep /media | awk '{ print $1 }'` )
echo ${DEVS[@]}
for I in "${DEVS[@]}"
do
    echo "Unmounting $I"
    umount $I
done

SRC=`echo ${DEVS[0]} | head -c -2`
echo "Checksumming $SRC"
MD5=`md5sum $SRC`

for DST in "${DEVS[@]:1}"
do
    xterm -e "./mk1.sh $SRC `echo $DST | head -c -2` $MD5" &
done

