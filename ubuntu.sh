#!/bin/bash

sudo apt update -y
sudo apt upgrade -y

sudo apt install curl
sudo apt install git build-essential
sudo apt install libpq-dev
sudo apt install libsqlite3-dev

# install rust in the future set this up to be automatic
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo.env

# install nvm
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash 
source ~/.profile   

# install latest version of node
nvm install node 

# install open jdk
sudo apt install openjdk-17-jdk

# install docker
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
	
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

# install minikube
sudo apt-get install apt-transport-https
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

# install helm
sudo snap install helm --classic

# install mongodb
wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org

# install postgresql
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install postgresql


sudo systemctl daemon-reload
sudo systemctl start mongod

