#!/bin/bash
sudo -i
apt-get install docker.io -y
apt-get install docker-compose -y
docker build -t react-app .
