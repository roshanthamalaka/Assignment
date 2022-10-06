#!/bin/bash

#Update the server 
sudo yum update  -y 

#Install Git 
sudo yum install git -y 

#Install the Docker
sudo yum install docker -y 

#Start and Enable the Docker Service 
sudo service  docker start
sudo service  docker enable 

#Wait Some time after docker initalized
sleep 5s


#Initalize the docker swarm 
sudo docker swarm init  

#Wait Some time 
sleep 2s



#Clone the Git repo to the  directory we want 
mkdir -p /tmp/GitRepo
cd /tmp/GitRepo
git clone https://github.com/dockersamples/example-voting-app
cd example-voting-app

#Deploy the app using Docker Swarm
sudo docker stack deploy --compose-file docker-stack.yml vote