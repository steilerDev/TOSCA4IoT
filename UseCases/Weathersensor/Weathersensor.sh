#!/bin/bash

apt-get -y update & apt-get upgrade
apt-get -y remove nodejs
hash -d node
wget https://nodejs.org/dist/v5.10.1/node-v5.10.1-linux-armv7l.tar.gz 
tar -xvf node-v5.10.1-linux-armv7l.tar.gz -C /usr/local/lib
export PATH=${PATH}:/usr/local/lib/node-v5.10.1-linux-armv7l/bin

#Git Installation
HOME="/home/pi"
apt-get -y install subversion git
cd ~
mkdir $HOME/UseCase
cd $HOME/UseCase/
svn export https://github.com/steilerDev/TOSCA4IoT.git/trunk/UseCases/Weathersensor
pip install freeopcua
nohup node /home/pi/UseCase/OPC_UA/SensorTag_Connect/sensortag2mqtt.js >>/dev/null 2>>/dev/null &