#!/bin/bash
sudo wget http://localhost:8080/jnlpJars/jenkins-cli.jar

echo -n "What is your Jenkins username: "

read J_USERNAME

echo -n "What is your Jenkins password: "

read -s J_PASSWORD
echo

sudo curl -L https://raw.githubusercontent.com/sebastianbergmann/php-jenkins-template/master/config.xml | \
     java -jar jenkins-cli.jar -s http://localhost:8080 create-job php-template  --username "$J_USERNAME" --password "$J_PASSWORD"

sudo java -jar jenkins-cli.jar -s http://localhost:8080 reload-configuration  --username "$J_USERNAME" --password "$J_PASSWORD"