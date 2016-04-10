#!/bin/sh

port=`sh ./getPortNumber.sh`
echo "$port"
old_dir=`pwd`
cd /data/mysql/
mkdir $port
chmod 777 $port
cd $old_dir
containerID=`docker run -d -e MYSQL_USER=mysql -e MYSQL_PASSWORD=mysql -e MYSQL_DATABASE=sample -e MYSQL_ROOT_PASSWORD=sa123 -p $port:3306 -v /data/mysql/$port:/var/lib/mysql mysql`
ip=`./getIPAddress.sh $containerID`
echo "$containerID : $port : $ip">> container_file
echo "$containerID"

