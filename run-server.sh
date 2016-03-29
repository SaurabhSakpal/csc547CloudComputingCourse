#!/bin/sh


docker run -d -e MYSQL_USER=mysql -e MYSQL_PASSWORD=mysql -e MYSQL_DATABASE=sample -e MYSQL_ROOT_PASSWORD=sa123 -p 3306:3306 -v /data/mysql:/var/lib/mysql mysql
