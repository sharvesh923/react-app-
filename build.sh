#!/bin/bash
sh "echo '${password}' | sudo -S su -"
apt-get install docker.io -y
apt-get install docker-compose -y
docker build -t react-app .
