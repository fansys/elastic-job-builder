#!/bin/bash
REGISTRY_HOST=registry.cn-{AREA}.aliyuncs.com

SYNC_AREA=('shenzhen' 'shanghai' 'beijing' 'hangzhou' )

repository=$1

echo "sync image: "$repository

for area in ${SYNC_AREA[@]}
do
    echo $area
    registry=`echo $REGISTRY_HOST |sed 's/{AREA}/'$area'/g'`
    to_repository=$registry/$repository
    docker tag $repository $to_repository
    echo "push "$repository" to area: "$area
    docker push $to_repository
done