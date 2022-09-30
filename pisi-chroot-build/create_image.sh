#!/bin/bash

### Colors ##
ESC=$(printf '\033') GREEN="${ESC}[32m" MAGENTA="${ESC}[35m"

### Color Functions ##

greenprint() { printf "${GREEN}%s${RESET}\n" "$1"; }
magentaprint() { printf "${MAGENTA}%s${RESET}\n" "$1"; }


echo "$(greenprint ' Creating Docker Image')"
sudo python dockertest.py rootfs


echo "$(greenprint ' Tagging docker image')"
sudo docker tag pisichrootbeta:latest pisilinux/chroot:base


echo "$(greenprint ' Building docker image')"
sudo docker build . -t pisilinux/chroot:latest


echo "$(greenprint ' Connecting Hub-Docker Server')"
sudo chmod 666 /var/run/docker.sock
docker login

echo "$(greenprint ' Committing chroot:base')"
docker push pisilinux/chroot:base


echo "$(greenprint ' Committing chroot:latest')"
docker push pisilinux/chroot:latest

echo "$(magentaprint 'DOCKER IMAGE IS COMMITTED TO HUB-DOCKER SERVER')"
