#!/bin/bash
sudo -i
apt install docker.io -y
apt install docker-compose -y
docker build -t react-app .
