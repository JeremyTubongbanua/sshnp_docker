#!/bin/bash

NAME=$1

sudo docker build -t jeremy_demo-base -f ../demo-base/Dockerfile ../demo-base
sudo docker stop ${NAME}
sudo docker container rm ${NAME}
sudo docker build -t ${NAME} .
sudo docker network create ${NAME}
sudo docker run -it --name ${NAME} --network ${NAME} ${NAME}
