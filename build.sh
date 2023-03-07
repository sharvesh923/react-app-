#!/bin/bash
sudo apt install docker.io -y
sudo apt install docker-compose -y
docker build -t react-app .
