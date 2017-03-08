#!/bin/bash
sudo apt-get -y install jenkins

IP_ADDRESS=$(ifconfig eth1 | grep 'inet addr' | cut -d ':' -f 2 | cut -d ' ' -f 1)

echo "Ok! Go to your browser at http://$IP_ADDRESS:8080 to setup your PHP-Jenkins-Breakfast-Box"
