#!/bin/bash
sudo npm run build &&
sudo docker build -t react-app .
