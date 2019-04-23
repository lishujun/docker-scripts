#!/bin/bash

# download rpm

download(){
    if [ ! -f $1 ]; then
        echo "download $1..."
        wget http://log4c.com/centos/$1
    else
        echo "$1 is exists"
    fi
}


download jdk-8u201-linux-x64.rpm
download mysql-community-release-el7-5.noarch.rpm
download nginx-release-centos-7-0.el7.ngx.noarch.rpm

echo "build image..."
docker build -t sirbox/dev:0.1 . 
