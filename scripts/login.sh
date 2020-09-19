#!/bin/bash
REGISTRY_HOST=registry.cn-{AREA}.aliyuncs.com

SYNC_AREA=('shenzhen' 'shanghai' 'beijing' 'hangzhou' )

username=$1
password=$2

for area in ${SYNC_AREA[@]}
do
    echo $area
    registry=`echo $REGISTRY_HOST |sed 's/{AREA}/'$area'/g'`
    echo "login registry: "$area
    docker login $registry -u $username -p $password
done