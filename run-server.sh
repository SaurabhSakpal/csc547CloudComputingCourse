#!/bin/bash

port=`./getPortNumber.sh`
public_ip="192.168.0.14"
echo "$port"
old_dir=`pwd`
cd /data/mysql/
mkdir $port
chmod 777 $port
cd $old_dir
containerID=`docker run -d -e MYSQL_ROOT_PASSWORD=sa123 -p $public_ip:$port:3306/tcp -p $public_ip:$port:3306/udp -v /data/mysql/$port:/var/lib/mysql mysql`
ip=`./getIPAddress.sh $containerID`
echo "$containerID : $port : $ip">> container_file
echo "$containerID"

