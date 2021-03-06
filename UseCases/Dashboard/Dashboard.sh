#!/bin/bash

apt-get -y update & apt-get upgrade
apt-get -y remove nodejs


#Git Installation
HOME="/home/pi"
apt-get -y install subversion git
cd ~
mkdir $HOME/UseCase
cd $HOME/UseCase/

#UseCase Installation
svn export https://github.com/steilerDev/TOSCA4IoT.git/trunk/UseCases/Dashboard

#Create Config-File
echo "Please insert the ip address of the TOSCA4IoT basestation"
read basestation_ip
echo "Please insert the port of the Message Broker [Standard:1883]"
read message_broker_port
echo "Please insert the topic on which the dashboard will subscribe to"
read topic

cat > $HOME/UseCase/Dashboard/config.properties <<EOL
basestation_ip=${basestation_ip}
message_broker_port=${message_broker_port}
topic=${topic}

EOL

#Start Application
nohup java /home/pi/UseCase/Dashboard/Dashboard.jar