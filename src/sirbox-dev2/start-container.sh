#!/bin/bash

check_port() {
        
    c=`lsof -i :$1 | wc -l`

    if [ $c -gt 0 ]; then
        echo "fail : port $1 is bound"
        netstat -tunlp | grep $1
        exit
    fi
}

check_name(){
        
    c=`docker ps -a --format "table {{.Names}}" | grep $1 | wc -l`

    if [ $c -gt 0 ]; then
        echo "named $1 container exists"
        exit
    fi
}

create_container(){

    # begin create container
    echo "begin create container $1 and bind $2, $3"
    echo "please wait..."
    docker volume create sirbox-$1-volume

    echo "start container"
    docker run --privileged --name $1 -itd -p $2:80 -p $3:22 -v sirbox-$1-volume:/data sirbox/dev:0.2
}

set_mysql_password(){
    sleep 20
    echo "set password"
    docker exec -d $1 /bin/bash -c 'mysqladmin -uroot password sirbox.cn'
}


# check shell arguments
if [ $# -lt 3 ]; then
    echo "$0 s01 8080 50100"
    exit
fi

# check
check_name $1
check_port $2
check_port $3

# begin create container
create_container $1 $2 $3
set_mysql_password $1

echo "done"

