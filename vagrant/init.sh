#!/bin/bash

sudo apt-get -y update
sudo apt-get -y install openjdk-7-jre-headless

rm -f visualizer.jar
curl -s http://ideaflow.org/visualizer-latest.jar > visualizer.jar

echo "Stating visualizer..."
java -jar visualizer.jar context=visualizer &

echo "Waiting for visualizer to start..."
sleep 20
