#!/bin/bash
sudo apt-get -y install jenkins

IP_ADDRESS=$(ifconfig eth1 | grep 'inet addr' | cut -d ':' -f 2 | cut -d ' ' -f 1)

echo "Ok! So now go to your browser and view this IP address at port http://$IP_ADDRESS:8080 and setup your jenkins machine"
