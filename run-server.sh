#!/bin/sh

port=`sh ./getPortNumber.sh`
echo "$port"
containerID=`docker run -d -e MYSQL_USER=mysql -e MYSQL_PASSWORD=mysql -e MYSQL_DATABASE=sample -e MYSQL_ROOT_PASSWORD=sa123 -p $port:3306 -v /data/mysql:/var/lib/mysql mysql`
ip=`sh ./getIPAddress.sh $containerID`
echo "$containerID : $port : $ip">> container_file
echo "$containerID"

