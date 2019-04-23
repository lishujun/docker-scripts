#!/bin/bash

if [ $# -le 0 ]; then
    echo "$0 s01 8080"
    exit
fi

echo "start container"
docker run --privileged --name $1 -itd -p $2:80 sirbox/dev:0.1

sleep 20
echo "set password"
docker exec -d $1 /bin/bash -c 'mysqladmin -uroot password sirbox.cn'
