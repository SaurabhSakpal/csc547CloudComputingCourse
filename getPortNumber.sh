#!/bin/bash
#
# Returns new port number for the new mysql docker container
#
#
if [ ! -f container_file ]
then
touch container_file
#echo "new file created"
echo "3401"
exit 0
fi

if [ ! -s container_file ]
then
echo "3401"
exit 0
fi

port=`cat mysql_container_config`
#echo $port
grep ": $port :" container_file > /dev/null
if [ $? -eq 0 ]
then
abc=`grep ": $port :" container_file`
pqr=`tail -n 1 container_file`
#echo "$pqr"
IFS=': ' read -ra ADDR <<< "$pqr"
#echo "${ADDR[1]}"
newPort=`expr ${ADDR[1]} + 1`
echo "$newPort"
else
echo "3401"
fi

