#!/bin/bash


# check shell arguments
if [ $# -le 0 ]; then
    echo "$0 s01 8080"
    exit
fi



# check port
#c=`netstat -tunlp | grep $2 | wc -l`
c=`lsof -i :$2 | wc -l`

if [ $c -gt 0 ]; then
     echo "port $2 is bound"
     netstat -tunlp | grep $2
     exit
fi

# check container name
c=`docker ps -a --format "table {{.Names}}" | grep $1 | wc -l`

if [ $c -gt 0 ]; then
     echo "named $1 container exists"
     exit
fi


# begin create container
echo "begin create container $1 and bind $2"
echo "please wait..."
docker volume create sirbox-$1-volume

echo "start container"
docker run --privileged --name $1 -itd -p $2:80 -v sirbox-$1-volume:/data sirbox/dev:0.1



sleep 20
echo "set password"
docker exec -d $1 /bin/bash -c 'mysqladmin -uroot password sirbox.cn'

echo "done"
