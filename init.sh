#!/bin/bash

DIR=$(pwd)

docker-compose up -d

cd ~/Library/Containers/com.docker.docker/Data/database/
git reset -- com.docker.driver.amd64-linux
git checkout -- com.docker.driver.amd64-linux
cd com.docker.driver.amd64-linux
echo '{"registry-mirrors":["http:\/\/localhost:5000"],"debug":true,"storage-driver":"aufs","insecure-registries":["localhost:5000"]}' > etc/docker/daemon.json
git add etc/docker/daemon.json
git commit -m 'configuration for flagship-cutter'
cd $DIR

echo "Configured docker hub registry"
