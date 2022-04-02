#!/bin/bash
echo "Begin setup docker ENV..."
sudo apt-get update
sudo apt install git
sudo apt install docker
sudo apt install docker.io

sudo curl -L "https://github.com/docker/compose/releases/download/1.28.6/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose

docker network create net-docker
# create containers: docker-compose up --build
echo "Done setup docker ENV --> Yeah."

# sudo groupadd docker
sudo gpasswd -a $USER docker
newgrp docker
docker ps
