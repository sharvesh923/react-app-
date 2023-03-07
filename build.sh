#!/bin/bash
sudo -s apt-get install docker.io -y
sudo -s apt-get install docker-compose -y
sudo -s docker build -t react-app .
