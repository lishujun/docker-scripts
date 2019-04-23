#!/bin/bash

docker run --privileged --name $1 -itd -p $2:80 sirbox/dev:0.1
docker exec -it $1 mysqladmin -uroot password "sirbox.cn"
