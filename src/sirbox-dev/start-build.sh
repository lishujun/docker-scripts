#!/bin/bash

# download rpm
wget http://log4c.com/centos/jdk-8u201-linux-x64.rpm
wget http://log4c.com/centos/mysql-community-release-el7-5.noarch.rpm
wget http://log4c.com/centos/nginx-release-centos-7-0.el7.ngx.noarch.rpm

docker build -t sirbox/dev:0.1 . 
