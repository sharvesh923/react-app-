#!/bin/bash
sudo apt-get install docker.io -y
sudo apt-get install docker-compose -y
sudo docker build -t react-app .
