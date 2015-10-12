#!/bin/bash

if [[ ! `dpkg-query -W -f='${Status}' openjdk-7-jre-headless | grep "install ok"` ]]; then
    echo "Installing JRE"
    sudo apt-get -y update
    sudo apt-get -y install openjdk-7-jre-headless
else
    echo "JRE already installed, skipping"
fi

echo "Downloading visualizer.jar"
#rm -f visualizer.jar
#wget --tries=10 --append-output=wget.out -O visualizer.jar http://ideaflow.org/visualizer-latest.jar

echo "vagrant?"
ls /vagrant

echo "Stating visualizer..."
java -jar /vagrant/visualizer.jar context=visualizer &

echo "Waiting for visualizer to start..."
sleep 20
