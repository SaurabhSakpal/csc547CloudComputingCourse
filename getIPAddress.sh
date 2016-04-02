#!/bin/bash
#
# fetching the IP address of the docker container
#
#
#echo "$1"
abc=`docker inspect 2e3badfe836a | grep -A 30 "NetworkSettings" | grep "\"IPAddress\":"`
#echo "$abc"
IFS='"' read -ra ADDR <<< "$abc"
echo "${ADDR[3]}"

