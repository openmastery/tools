#!/bin/bash

sudo apt-get -y update
sudo apt-get -y install openjdk-7-jre-headless

rm -f visualizer.jar
wget --tries=10 --append-output=wget.out -O visualizer.jar http://ideaflow.org/visualizer-latest.jar

echo "Stating visualizer..."
java -jar visualizer.jar context=visualizer &

echo "Waiting for visualizer to start..."
sleep 20
